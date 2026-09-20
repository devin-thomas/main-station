// Browser-context probes adapted from the surface-sweep skill's browser-probes.mjs
// (devin-thomas/skills, surface-sweep/scripts/browser-probes.mjs). Kept here as a
// maintained project helper so the sweep does not depend on an external checkout.
// Each function is passed to page.evaluate and runs in the page, not in Node.

export interface GeometryOptions {
  tolerance?: number;
  contain?: { parent: string; child: string }[];
  separate?: { a: string; b: string }[];
  inViewport?: string[];
}

export interface GeometryResult {
  viewport: { width: number; height: number };
  documentOverflow: number;
  issues: Record<string, unknown>[];
}

export async function waitForAssets({ timeoutMs = 10000, scope = 'html' } = {}) {
  if (!Number.isFinite(timeoutMs) || timeoutMs <= 0) throw new Error('Invalid asset deadline');
  const root = document.querySelector(scope);
  if (!root) throw new Error(`Missing asset scope: ${scope}`);
  const all = [...root.querySelectorAll('img')];
  if (root instanceof HTMLImageElement) all.unshift(root);
  // A lazy image below the fold is not part of the rendered surface and never decodes until it
  // nears the viewport, so waiting on one would hang rather than report anything.
  const nearViewport = (img: HTMLImageElement) => {
    const bounds = img.getBoundingClientRect();
    const margin = window.innerHeight;
    return bounds.bottom > -margin && bounds.top < window.innerHeight + margin;
  };
  const images = all.filter((img) => img.loading !== 'lazy' || img.complete || nearViewport(img));
  let timer: ReturnType<typeof setTimeout> | undefined;
  try {
    return await Promise.race([
      (async () => {
        await document.fonts.ready;
        return await Promise.all(images.map(async (img) => {
          await img.decode();
          if (!img.complete || !img.naturalWidth || !img.naturalHeight) {
            throw new Error(`Broken image: ${img.currentSrc || img.getAttribute('src')}`);
          }
          return { src: img.currentSrc, width: img.naturalWidth, height: img.naturalHeight };
        }));
      })(),
      new Promise((_, reject) => {
        timer = setTimeout(() => reject(new Error(`Asset readiness timed out after ${timeoutMs}ms`)), timeoutMs);
      }),
    ]);
  } finally {
    clearTimeout(timer);
  }
}

export function inspectGeometry({ tolerance = 1, contain = [], separate = [], inViewport = [] }: GeometryOptions = {}): GeometryResult {
  if (!Number.isFinite(tolerance) || tolerance < 0) throw new Error('Invalid geometry tolerance');
  const issues: Record<string, unknown>[] = [];
  const rect = (element: Element) => {
    const { left, right, top, bottom, width, height } = element.getBoundingClientRect();
    return { left, right, top, bottom, width, height };
  };
  const visible = (element: Element) => {
    const style = getComputedStyle(element);
    const bounds = rect(element);
    return style.visibility !== 'hidden' && style.visibility !== 'collapse' &&
      bounds.width > 0 && bounds.height > 0 && element.getClientRects().length > 0;
  };
  const required = (selector: string, root: Document | Element = document) => {
    const elements = [...root.querySelectorAll(selector)].filter(visible);
    if (!elements.length) issues.push({ kind: 'missing-or-hidden', selector });
    return elements;
  };
  for (const { parent, child } of contain) {
    for (const element of required(parent)) {
      const outer = rect(element);
      for (const descendant of required(child, element)) {
        const inner = rect(descendant);
        if (inner.left < outer.left - tolerance || inner.right > outer.right + tolerance ||
            inner.top < outer.top - tolerance || inner.bottom > outer.bottom + tolerance) {
          issues.push({ kind: 'outside-parent', parent, child, outer, inner });
        }
      }
    }
  }
  for (const { a, b } of separate) {
    const first = required(a);
    const second = required(b);
    for (const left of first) for (const right of second) {
      const one = rect(left);
      const two = rect(right);
      if (Math.min(one.right, two.right) - Math.max(one.left, two.left) > tolerance &&
          Math.min(one.bottom, two.bottom) - Math.max(one.top, two.top) > tolerance) {
        issues.push({ kind: 'overlap', a, b, one, two });
      }
    }
  }
  const viewport = {
    width: document.documentElement.clientWidth,
    height: document.documentElement.clientHeight,
  };
  for (const selector of inViewport) for (const element of required(selector)) {
    const bounds = rect(element);
    if (bounds.left < -tolerance || bounds.top < -tolerance ||
        bounds.right > viewport.width + tolerance || bounds.bottom > viewport.height + tolerance) {
      issues.push({ kind: 'outside-viewport', selector, bounds });
    }
  }
  return {
    viewport,
    documentOverflow: Math.max(document.documentElement.scrollWidth, document.body?.scrollWidth ?? 0) - viewport.width,
    issues,
  };
}

/**
 * Controls smaller than the 44x44 CSS pixel target SPEC 16 requires.
 *
 * WCAG 2.2 SC 2.5.8 exempts a target rendered inline inside a sentence, where the size is
 * set by the surrounding text rather than by the control. That exemption is applied here
 * only when the element really is inline AND its parent holds other text, so a standalone
 * block link cannot claim it.
 */
export function undersizedTargets(minimum = 44) {
  const selectors = 'a[href], button, select, input:not([type="hidden"]), [role="button"], [tabindex]:not([tabindex="-1"])';
  const inlineInSentence = (element: Element) => {
    if (!getComputedStyle(element).display.startsWith('inline')) return false;
    const parent = element.parentElement;
    if (!parent) return false;
    return [...parent.childNodes]
      .filter((node) => node !== element && node.nodeType === Node.TEXT_NODE)
      .some((node) => (node.textContent ?? '').trim().length > 0);
  };
  return [...document.querySelectorAll(selectors)]
    .filter((element) => {
      const style = getComputedStyle(element);
      if (style.visibility === 'hidden' || style.display === 'none') return false;
      if (element.getClientRects().length === 0) return false;
      return !inlineInSentence(element);
    })
    .map((element) => {
      const { width, height } = element.getBoundingClientRect();
      return {
        tag: element.tagName.toLowerCase(),
        label: (element.getAttribute('aria-label') ?? element.textContent ?? '').trim().slice(0, 40),
        className: typeof element.className === 'string' ? element.className : '',
        width: Math.round(width),
        height: Math.round(height),
      };
    })
    .filter((entry) => entry.width > 0 && (entry.width < minimum || entry.height < minimum));
}
