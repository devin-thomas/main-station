// Generated from Supabase project bqfzzrasfunysseoogcg. Regenerate after schema migrations.
export type Json =
  | string
  | number
  | boolean
  | null
  | { [key: string]: Json | undefined }
  | Json[]

export type Database = {
  // Allows to automatically instantiate createClient with right options
  // instead of createClient<Database, { PostgrestVersion: 'XX' }>(URL, KEY)
  __InternalSupabase: {
    PostgrestVersion: "14.15"
  }
  public: {
    Tables: {
      character_art_assets: {
        Row: {
          asset_reuse_mode: string
          asset_sha256: string
          character_id: string
          created_at: string
          credit_text: string
          disabled_at: string | null
          id: string
          is_primary: boolean
          license_url: string | null
          permission_evidence: string | null
          replaced_by: string | null
          retrieved_at: string
          review_state: Database["public"]["Enums"]["art_review_state"]
          reviewed_at: string | null
          source_publisher: string
          source_url: string
          storage_path: string
        }
        Insert: {
          asset_reuse_mode: string
          asset_sha256: string
          character_id: string
          created_at?: string
          credit_text: string
          disabled_at?: string | null
          id?: string
          is_primary?: boolean
          license_url?: string | null
          permission_evidence?: string | null
          replaced_by?: string | null
          retrieved_at: string
          review_state?: Database["public"]["Enums"]["art_review_state"]
          reviewed_at?: string | null
          source_publisher: string
          source_url: string
          storage_path: string
        }
        Update: {
          asset_reuse_mode?: string
          asset_sha256?: string
          character_id?: string
          created_at?: string
          credit_text?: string
          disabled_at?: string | null
          id?: string
          is_primary?: boolean
          license_url?: string | null
          permission_evidence?: string | null
          replaced_by?: string | null
          retrieved_at?: string
          review_state?: Database["public"]["Enums"]["art_review_state"]
          reviewed_at?: string | null
          source_publisher?: string
          source_url?: string
          storage_path?: string
        }
        Relationships: [
          {
            foreignKeyName: "character_art_assets_character_id_fkey"
            columns: ["character_id"]
            isOneToOne: false
            referencedRelation: "characters"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "character_art_assets_replaced_by_fkey"
            columns: ["replaced_by"]
            isOneToOne: false
            referencedRelation: "character_art_assets"
            referencedColumns: ["id"]
          },
        ]
      }
      character_picks: {
        Row: {
          character_id: string
          created_at: string
          game_version_id: string
          id: string
          lineup_id: string
          options: Json
          pick_kind: Database["public"]["Enums"]["character_role"]
          slot_id: string
          slot_index: number
        }
        Insert: {
          character_id: string
          created_at?: string
          game_version_id: string
          id?: string
          lineup_id: string
          options?: Json
          pick_kind?: Database["public"]["Enums"]["character_role"]
          slot_id: string
          slot_index: number
        }
        Update: {
          character_id?: string
          created_at?: string
          game_version_id?: string
          id?: string
          lineup_id?: string
          options?: Json
          pick_kind?: Database["public"]["Enums"]["character_role"]
          slot_id?: string
          slot_index?: number
        }
        Relationships: [
          {
            foreignKeyName: "character_picks_character_id_game_version_id_fkey"
            columns: ["character_id", "game_version_id"]
            isOneToOne: false
            referencedRelation: "characters"
            referencedColumns: ["id", "game_version_id"]
          },
          {
            foreignKeyName: "character_picks_game_version_id_fkey"
            columns: ["game_version_id"]
            isOneToOne: false
            referencedRelation: "game_versions"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "character_picks_lineup_id_game_version_id_fkey"
            columns: ["lineup_id", "game_version_id"]
            isOneToOne: false
            referencedRelation: "lineups"
            referencedColumns: ["id", "game_version_id"]
          },
          {
            foreignKeyName: "character_picks_lineup_id_game_version_id_fkey"
            columns: ["lineup_id", "game_version_id"]
            isOneToOne: false
            referencedRelation: "public_lineups"
            referencedColumns: ["id", "game_version_id"]
          },
        ]
      }
      characters: {
        Row: {
          created_at: string
          display_name: string
          game_version_id: string
          id: string
          is_playable: boolean
          roster_order: number
          roster_role: Database["public"]["Enums"]["character_role"]
          roster_status: string
          slug: string
          source_checked_at: string
          summary: string
          summary_reuse_mode: string
          summary_source_publisher: string
          summary_source_url: string
          updated_at: string
        }
        Insert: {
          created_at?: string
          display_name: string
          game_version_id: string
          id?: string
          is_playable?: boolean
          roster_order?: number
          roster_role?: Database["public"]["Enums"]["character_role"]
          roster_status?: string
          slug: string
          source_checked_at: string
          summary: string
          summary_reuse_mode?: string
          summary_source_publisher: string
          summary_source_url: string
          updated_at?: string
        }
        Update: {
          created_at?: string
          display_name?: string
          game_version_id?: string
          id?: string
          is_playable?: boolean
          roster_order?: number
          roster_role?: Database["public"]["Enums"]["character_role"]
          roster_status?: string
          slug?: string
          source_checked_at?: string
          summary?: string
          summary_reuse_mode?: string
          summary_source_publisher?: string
          summary_source_url?: string
          updated_at?: string
        }
        Relationships: [
          {
            foreignKeyName: "characters_game_version_id_fkey"
            columns: ["game_version_id"]
            isOneToOne: false
            referencedRelation: "game_versions"
            referencedColumns: ["id"]
          },
        ]
      }
      game_versions: {
        Row: {
          active: boolean
          catalog_source_url: string
          catalog_status: string
          created_at: string
          id: string
          launch_order: number
          name: string
          release_label: string
          selection_schema: Json
          short_name: string
          slug: string
          source_checked_at: string
          updated_at: string
        }
        Insert: {
          active?: boolean
          catalog_source_url: string
          catalog_status?: string
          created_at?: string
          id?: string
          launch_order: number
          name: string
          release_label: string
          selection_schema: Json
          short_name: string
          slug: string
          source_checked_at: string
          updated_at?: string
        }
        Update: {
          active?: boolean
          catalog_source_url?: string
          catalog_status?: string
          created_at?: string
          id?: string
          launch_order?: number
          name?: string
          release_label?: string
          selection_schema?: Json
          short_name?: string
          slug?: string
          source_checked_at?: string
          updated_at?: string
        }
        Relationships: []
      }
      lineups: {
        Row: {
          category: Database["public"]["Enums"]["lineup_category"]
          client_request_id: string
          created_at: string
          game_version_id: string
          id: string
          is_complete: boolean
          lifecycle: Database["public"]["Enums"]["lineup_lifecycle"]
          options: Json
          owner_id: string
          sort_order: number
          updated_at: string
          visibility: Database["public"]["Enums"]["lineup_visibility"]
        }
        Insert: {
          category: Database["public"]["Enums"]["lineup_category"]
          client_request_id?: string
          created_at?: string
          game_version_id: string
          id?: string
          is_complete?: boolean
          lifecycle: Database["public"]["Enums"]["lineup_lifecycle"]
          options?: Json
          owner_id: string
          sort_order?: number
          updated_at?: string
          visibility: Database["public"]["Enums"]["lineup_visibility"]
        }
        Update: {
          category?: Database["public"]["Enums"]["lineup_category"]
          client_request_id?: string
          created_at?: string
          game_version_id?: string
          id?: string
          is_complete?: boolean
          lifecycle?: Database["public"]["Enums"]["lineup_lifecycle"]
          options?: Json
          owner_id?: string
          sort_order?: number
          updated_at?: string
          visibility?: Database["public"]["Enums"]["lineup_visibility"]
        }
        Relationships: [
          {
            foreignKeyName: "lineups_game_version_id_fkey"
            columns: ["game_version_id"]
            isOneToOne: false
            referencedRelation: "game_versions"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "lineups_owner_id_fkey"
            columns: ["owner_id"]
            isOneToOne: false
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
        ]
      }
      profile_claims: {
        Row: {
          completed_at: string | null
          created_at: string
          id: string
          owner_id: string
          request_id: string
          response: Json | null
        }
        Insert: {
          completed_at?: string | null
          created_at?: string
          id?: string
          owner_id: string
          request_id: string
          response?: Json | null
        }
        Update: {
          completed_at?: string | null
          created_at?: string
          id?: string
          owner_id?: string
          request_id?: string
          response?: Json | null
        }
        Relationships: []
      }
      profiles: {
        Row: {
          bio: string | null
          created_at: string
          display_name: string
          handle: string
          id: string
          updated_at: string
        }
        Insert: {
          bio?: string | null
          created_at?: string
          display_name: string
          handle: string
          id: string
          updated_at?: string
        }
        Update: {
          bio?: string | null
          created_at?: string
          display_name?: string
          handle?: string
          id?: string
          updated_at?: string
        }
        Relationships: []
      }
      recommendation_feedback: {
        Row: {
          character_id: string
          created_at: string
          id: string
          owner_id: string
          reason_code: string | null
          recommendation_run_id: string
          response: Database["public"]["Enums"]["feedback_response"]
          updated_at: string
        }
        Insert: {
          character_id: string
          created_at?: string
          id?: string
          owner_id: string
          reason_code?: string | null
          recommendation_run_id: string
          response: Database["public"]["Enums"]["feedback_response"]
          updated_at?: string
        }
        Update: {
          character_id?: string
          created_at?: string
          id?: string
          owner_id?: string
          reason_code?: string | null
          recommendation_run_id?: string
          response?: Database["public"]["Enums"]["feedback_response"]
          updated_at?: string
        }
        Relationships: [
          {
            foreignKeyName: "recommendation_feedback_character_id_fkey"
            columns: ["character_id"]
            isOneToOne: false
            referencedRelation: "characters"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "recommendation_feedback_owner_id_fkey"
            columns: ["owner_id"]
            isOneToOne: false
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "recommendation_feedback_recommendation_run_id_fkey"
            columns: ["recommendation_run_id"]
            isOneToOne: false
            referencedRelation: "recommendation_runs"
            referencedColumns: ["id"]
          },
        ]
      }
      recommendation_runs: {
        Row: {
          candidates: Json
          created_at: string
          id: string
          owner_id: string
          scoring_policy: string
          target_game_version_id: string
        }
        Insert: {
          candidates: Json
          created_at?: string
          id?: string
          owner_id: string
          scoring_policy: string
          target_game_version_id: string
        }
        Update: {
          candidates?: Json
          created_at?: string
          id?: string
          owner_id?: string
          scoring_policy?: string
          target_game_version_id?: string
        }
        Relationships: [
          {
            foreignKeyName: "recommendation_runs_owner_id_fkey"
            columns: ["owner_id"]
            isOneToOne: false
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "recommendation_runs_target_game_version_id_fkey"
            columns: ["target_game_version_id"]
            isOneToOne: false
            referencedRelation: "game_versions"
            referencedColumns: ["id"]
          },
        ]
      }
    }
    Views: {
      character_usage_stats: {
        Row: {
          active_player_count: number | null
          character_id: string | null
          game_version_id: string | null
          main_player_count: number | null
          public_player_count: number | null
          registered_player_share: number | null
          retired_player_count: number | null
          secondary_player_count: number | null
        }
        Relationships: [
          {
            foreignKeyName: "lineups_game_version_id_fkey"
            columns: ["game_version_id"]
            isOneToOne: false
            referencedRelation: "game_versions"
            referencedColumns: ["id"]
          },
        ]
      }
      player_game_signatures: {
        Row: {
          character_id: string | null
          game_version_id: string | null
          normalized_weight: number | null
          policy_version: string | null
          profile_id: string | null
          raw_weight: number | null
        }
        Relationships: [
          {
            foreignKeyName: "lineups_game_version_id_fkey"
            columns: ["game_version_id"]
            isOneToOne: false
            referencedRelation: "game_versions"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "lineups_owner_id_fkey"
            columns: ["profile_id"]
            isOneToOne: false
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
        ]
      }
      public_lineups: {
        Row: {
          category: Database["public"]["Enums"]["lineup_category"] | null
          created_at: string | null
          display_name: string | null
          game_name: string | null
          game_slug: string | null
          game_version_id: string | null
          handle: string | null
          id: string | null
          lifecycle: Database["public"]["Enums"]["lineup_lifecycle"] | null
          options: Json | null
          owner_id: string | null
          sort_order: number | null
          updated_at: string | null
          visibility: Database["public"]["Enums"]["lineup_visibility"] | null
        }
        Relationships: [
          {
            foreignKeyName: "lineups_game_version_id_fkey"
            columns: ["game_version_id"]
            isOneToOne: false
            referencedRelation: "game_versions"
            referencedColumns: ["id"]
          },
          {
            foreignKeyName: "lineups_owner_id_fkey"
            columns: ["owner_id"]
            isOneToOne: false
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
        ]
      }
      public_profile_mainline: {
        Row: {
          bio: string | null
          category: Database["public"]["Enums"]["lineup_category"] | null
          created_at: string | null
          display_name: string | null
          game_slug: string | null
          handle: string | null
          id: string | null
          lifecycle: Database["public"]["Enums"]["lineup_lifecycle"] | null
          owner_id: string | null
          picks: Json | null
          sort_order: number | null
          team_option: string | null
          updated_at: string | null
          visibility: Database["public"]["Enums"]["lineup_visibility"] | null
        }
        Relationships: [
          {
            foreignKeyName: "lineups_owner_id_fkey"
            columns: ["owner_id"]
            isOneToOne: false
            referencedRelation: "profiles"
            referencedColumns: ["id"]
          },
        ]
      }
      registered_player_counts: {
        Row: {
          game_version_id: string | null
          registered_player_count: number | null
        }
        Relationships: [
          {
            foreignKeyName: "lineups_game_version_id_fkey"
            columns: ["game_version_id"]
            isOneToOne: false
            referencedRelation: "game_versions"
            referencedColumns: ["id"]
          },
        ]
      }
    }
    Functions: {
      claim_profile_draft: {
        Args: { p_payload: Json; p_request_id: string }
        Returns: Json
      }
      delete_my_account: { Args: never; Returns: undefined }
      export_my_profile: { Args: never; Returns: Json }
      finalize_lineup: {
        Args: { p_lineup_id: string }
        Returns: {
          category: Database["public"]["Enums"]["lineup_category"]
          client_request_id: string
          created_at: string
          game_version_id: string
          id: string
          is_complete: boolean
          lifecycle: Database["public"]["Enums"]["lineup_lifecycle"]
          options: Json
          owner_id: string
          sort_order: number
          updated_at: string
          visibility: Database["public"]["Enums"]["lineup_visibility"]
        }
        SetofOptions: {
          from: "*"
          to: "lineups"
          isOneToOne: true
          isSetofReturn: false
        }
      }
      lineup_is_complete: { Args: { p_lineup_id: string }; Returns: boolean }
      lineup_is_publishable: { Args: { p_lineup_id: string }; Returns: boolean }
      recommend_characters: {
        Args: { p_profile_id: string; p_target_game_version_id: string }
        Returns: {
          character_id: string
          character_name: string
          policy_version: string
          rank: number
          score: number
          support_count: number
        }[]
      }
      save_my_profile_draft: {
        Args: { p_payload: Json; p_request_id: string }
        Returns: Json
      }
      selection_schema_is_valid: { Args: { candidate: Json }; Returns: boolean }
    }
    Enums: {
      art_review_state: "pending" | "approved" | "disabled" | "replaced"
      character_role: "fighter" | "kameo"
      feedback_response: "would_try" | "not_for_me" | "already_play"
      lineup_category: "main" | "secondary"
      lineup_lifecycle: "active" | "retired"
      lineup_visibility: "public" | "private"
    }
    CompositeTypes: {
      [_ in never]: never
    }
  }
}

type DatabaseWithoutInternals = Omit<Database, "__InternalSupabase">

type DefaultSchema = DatabaseWithoutInternals[Extract<keyof Database, "public">]

export type Tables<
  DefaultSchemaTableNameOrOptions extends
    | keyof (DefaultSchema["Tables"] & DefaultSchema["Views"])
    | { schema: keyof DatabaseWithoutInternals },
  TableName extends DefaultSchemaTableNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof (DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"] &
        DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Views"])
    : never = never,
> = DefaultSchemaTableNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals
}
  ? (DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"] &
      DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Views"])[TableName] extends {
      Row: infer R
    }
    ? R
    : never
  : DefaultSchemaTableNameOrOptions extends keyof (DefaultSchema["Tables"] &
        DefaultSchema["Views"])
    ? (DefaultSchema["Tables"] &
        DefaultSchema["Views"])[DefaultSchemaTableNameOrOptions] extends {
        Row: infer R
      }
      ? R
      : never
    : never

export type TablesInsert<
  DefaultSchemaTableNameOrOptions extends
    | keyof DefaultSchema["Tables"]
    | { schema: keyof DatabaseWithoutInternals },
  TableName extends DefaultSchemaTableNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"]
    : never = never,
> = DefaultSchemaTableNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals
}
  ? DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"][TableName] extends {
      Insert: infer I
    }
    ? I
    : never
  : DefaultSchemaTableNameOrOptions extends keyof DefaultSchema["Tables"]
    ? DefaultSchema["Tables"][DefaultSchemaTableNameOrOptions] extends {
        Insert: infer I
      }
      ? I
      : never
    : never

export type TablesUpdate<
  DefaultSchemaTableNameOrOptions extends
    | keyof DefaultSchema["Tables"]
    | { schema: keyof DatabaseWithoutInternals },
  TableName extends DefaultSchemaTableNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"]
    : never = never,
> = DefaultSchemaTableNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals
}
  ? DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"][TableName] extends {
      Update: infer U
    }
    ? U
    : never
  : DefaultSchemaTableNameOrOptions extends keyof DefaultSchema["Tables"]
    ? DefaultSchema["Tables"][DefaultSchemaTableNameOrOptions] extends {
        Update: infer U
      }
      ? U
      : never
    : never

export type Enums<
  DefaultSchemaEnumNameOrOptions extends
    | keyof DefaultSchema["Enums"]
    | { schema: keyof DatabaseWithoutInternals },
  EnumName extends DefaultSchemaEnumNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof DatabaseWithoutInternals[DefaultSchemaEnumNameOrOptions["schema"]]["Enums"]
    : never = never,
> = DefaultSchemaEnumNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals
}
  ? DatabaseWithoutInternals[DefaultSchemaEnumNameOrOptions["schema"]]["Enums"][EnumName]
  : DefaultSchemaEnumNameOrOptions extends keyof DefaultSchema["Enums"]
    ? DefaultSchema["Enums"][DefaultSchemaEnumNameOrOptions]
    : never

export type CompositeTypes<
  PublicCompositeTypeNameOrOptions extends
    | keyof DefaultSchema["CompositeTypes"]
    | { schema: keyof DatabaseWithoutInternals },
  CompositeTypeName extends PublicCompositeTypeNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof DatabaseWithoutInternals[PublicCompositeTypeNameOrOptions["schema"]]["CompositeTypes"]
    : never = never,
> = PublicCompositeTypeNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals
}
  ? DatabaseWithoutInternals[PublicCompositeTypeNameOrOptions["schema"]]["CompositeTypes"][CompositeTypeName]
  : PublicCompositeTypeNameOrOptions extends keyof DefaultSchema["CompositeTypes"]
    ? DefaultSchema["CompositeTypes"][PublicCompositeTypeNameOrOptions]
    : never

export const Constants = {
  public: {
    Enums: {
      art_review_state: ["pending", "approved", "disabled", "replaced"],
      character_role: ["fighter", "kameo"],
      feedback_response: ["would_try", "not_for_me", "already_play"],
      lineup_category: ["main", "secondary"],
      lineup_lifecycle: ["active", "retired"],
      lineup_visibility: ["public", "private"],
    },
  },
} as const
