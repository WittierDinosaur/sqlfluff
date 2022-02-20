-- This query generated by script/generate_corr_queries.py and should probably not be
--  modified manually. Instead, make changes to that script and rerun it.

WITH
raw_effect_sizes AS (
    SELECT
        state_user_v_peer_open,
        business_type,
        COUNT(*) AS campaign_count,

        -- The following is the slope of the regression line. Note that CORR (which is the Pearson's correlation
        --  coefficient is symmetric in its arguments, but since STDDEV_POP(open_rate_su) appears in the
        --  numerator this is the slope of the regression line considering STDDEV_POP(open_rate_su) to be
        --  the "y variable" and uses_small_subject_line to be the "x variable" in terms of the regression line.
        SAFE_DIVIDE(
            SAFE_MULTIPLY(
                CORR(open_rate_su, uses_small_subject_line),
                STDDEV_POP(open_rate_su)
            ),
            STDDEV_POP(uses_small_subject_line)
        ) AS open_uses_small_subject_line,

        -- The following is the slope of the regression line. Note that CORR (which is the Pearson's correlation
        --  coefficient is symmetric in its arguments, but since STDDEV_POP(open_rate_su) appears in the
        --  numerator this is the slope of the regression line considering STDDEV_POP(open_rate_su) to be
        --  the "y variable" and uses_personal_subject to be the "x variable" in terms of the regression line.
        SAFE_DIVIDE(
            SAFE_MULTIPLY(
                CORR(open_rate_su, uses_personal_subject),
                STDDEV_POP(open_rate_su)
            ),
            STDDEV_POP(uses_personal_subject)
        ) AS open_uses_personal_subject,

        -- The following is the slope of the regression line. Note that CORR (which is the Pearson's correlation
        --  coefficient is symmetric in its arguments, but since STDDEV_POP(open_rate_su) appears in the
        --  numerator this is the slope of the regression line considering STDDEV_POP(open_rate_su) to be
        --  the "y variable" and uses_timewarp to be the "x variable" in terms of the regression line.
        SAFE_DIVIDE(
            SAFE_MULTIPLY(
                CORR(open_rate_su, uses_timewarp), STDDEV_POP(open_rate_su)
            ),
            STDDEV_POP(uses_timewarp)
        ) AS open_uses_timewarp,

        -- The following is the slope of the regression line. Note that CORR (which is the Pearson's correlation
        --  coefficient is symmetric in its arguments, but since STDDEV_POP(open_rate_su) appears in the
        --  numerator this is the slope of the regression line considering STDDEV_POP(open_rate_su) to be
        --  the "y variable" and uses_small_preview to be the "x variable" in terms of the regression line.
        SAFE_DIVIDE(
            SAFE_MULTIPLY(
                CORR(open_rate_su, uses_small_preview), STDDEV_POP(open_rate_su)
            ),
            STDDEV_POP(uses_small_preview)
        ) AS open_uses_small_preview,

        -- The following is the slope of the regression line. Note that CORR (which is the Pearson's correlation
        --  coefficient is symmetric in its arguments, but since STDDEV_POP(open_rate_su) appears in the
        --  numerator this is the slope of the regression line considering STDDEV_POP(open_rate_su) to be
        --  the "y variable" and uses_personal_to to be the "x variable" in terms of the regression line.
        SAFE_DIVIDE(
            SAFE_MULTIPLY(
                CORR(open_rate_su, uses_personal_to), STDDEV_POP(open_rate_su)
            ),
            STDDEV_POP(uses_personal_to)
        ) AS open_uses_personal_to,

        -- The following is the slope of the regression line. Note that CORR (which is the Pearson's correlation
        --  coefficient is symmetric in its arguments, but since STDDEV_POP(open_rate_su) appears in the
        --  numerator this is the slope of the regression line considering STDDEV_POP(open_rate_su) to be
        --  the "y variable" and uses_ab_test_subject to be the "x variable" in terms of the regression line.
        SAFE_DIVIDE(
            SAFE_MULTIPLY(
                CORR(open_rate_su, uses_ab_test_subject),
                STDDEV_POP(open_rate_su)
            ),
            STDDEV_POP(uses_ab_test_subject)
        ) AS open_uses_ab_test_subject,

        -- The following is the slope of the regression line. Note that CORR (which is the Pearson's correlation
        --  coefficient is symmetric in its arguments, but since STDDEV_POP(open_rate_su) appears in the
        --  numerator this is the slope of the regression line considering STDDEV_POP(open_rate_su) to be
        --  the "y variable" and uses_ab_test_content to be the "x variable" in terms of the regression line.
        SAFE_DIVIDE(
            SAFE_MULTIPLY(
                CORR(open_rate_su, uses_ab_test_content),
                STDDEV_POP(open_rate_su)
            ),
            STDDEV_POP(uses_ab_test_content)
        ) AS open_uses_ab_test_content,

        -- The following is the slope of the regression line. Note that CORR (which is the Pearson's correlation
        --  coefficient is symmetric in its arguments, but since STDDEV_POP(open_rate_su) appears in the
        --  numerator this is the slope of the regression line considering STDDEV_POP(open_rate_su) to be
        --  the "y variable" and uses_preview_text to be the "x variable" in terms of the regression line.
        SAFE_DIVIDE(
            SAFE_MULTIPLY(
                CORR(open_rate_su, uses_preview_text), STDDEV_POP(open_rate_su)
            ),
            STDDEV_POP(uses_preview_text)
        ) AS open_uses_preview_text,

        -- The following is the slope of the regression line. Note that CORR (which is the Pearson's correlation
        --  coefficient is symmetric in its arguments, but since STDDEV_POP(open_rate_su) appears in the
        --  numerator this is the slope of the regression line considering STDDEV_POP(open_rate_su) to be
        --  the "y variable" and uses_sto to be the "x variable" in terms of the regression line.
        SAFE_DIVIDE(
            SAFE_MULTIPLY(CORR(open_rate_su, uses_sto), STDDEV_POP(open_rate_su)),
            STDDEV_POP(uses_sto)
        ) AS open_uses_sto,

        -- The following is the slope of the regression line. Note that CORR (which is the Pearson's correlation
        --  coefficient is symmetric in its arguments, but since STDDEV_POP(open_rate_su) appears in the
        --  numerator this is the slope of the regression line considering STDDEV_POP(open_rate_su) to be
        --  the "y variable" and uses_freemail_from to be the "x variable" in terms of the regression line.
        SAFE_DIVIDE(
            SAFE_MULTIPLY(
                CORR(open_rate_su, uses_freemail_from), STDDEV_POP(open_rate_su)
            ),
            STDDEV_POP(uses_freemail_from)
        ) AS open_uses_freemail_from,

        -- The following is the slope of the regression line. Note that CORR (which is the Pearson's correlation
        --  coefficient is symmetric in its arguments, but since STDDEV_POP(open_rate_su) appears in the
        --  numerator this is the slope of the regression line considering STDDEV_POP(open_rate_su) to be
        --  the "y variable" and uses_resend_non_openers to be the "x variable" in terms of the regression line.
        SAFE_DIVIDE(
            SAFE_MULTIPLY(
                CORR(open_rate_su, uses_resend_non_openers),
                STDDEV_POP(open_rate_su)
            ),
            STDDEV_POP(uses_resend_non_openers)
        ) AS open_uses_resend_non_openers,

        -- The following is the slope of the regression line. Note that CORR (which is the Pearson's correlation
        --  coefficient is symmetric in its arguments, but since STDDEV_POP(open_rate_su) appears in the
        --  numerator this is the slope of the regression line considering STDDEV_POP(open_rate_su) to be
        --  the "y variable" and uses_promo_code to be the "x variable" in terms of the regression line.
        SAFE_DIVIDE(
            SAFE_MULTIPLY(
                CORR(open_rate_su, uses_promo_code), STDDEV_POP(open_rate_su)
            ),
            STDDEV_POP(uses_promo_code)
        ) AS open_uses_promo_code,

        -- The following is the slope of the regression line. Note that CORR (which is the Pearson's correlation
        --  coefficient is symmetric in its arguments, but since STDDEV_POP(open_rate_su) appears in the
        --  numerator this is the slope of the regression line considering STDDEV_POP(open_rate_su) to be
        --  the "y variable" and uses_prex to be the "x variable" in terms of the regression line.
        SAFE_DIVIDE(
            SAFE_MULTIPLY(CORR(open_rate_su, uses_prex), STDDEV_POP(open_rate_su)),
            STDDEV_POP(uses_prex)
        ) AS open_uses_prex,

        -- The following is the slope of the regression line. Note that CORR (which is the Pearson's correlation
        --  coefficient is symmetric in its arguments, but since STDDEV_POP(open_rate_su) appears in the
        --  numerator this is the slope of the regression line considering STDDEV_POP(open_rate_su) to be
        --  the "y variable" and uses_ab_test_from to be the "x variable" in terms of the regression line.
        SAFE_DIVIDE(
            SAFE_MULTIPLY(
                CORR(open_rate_su, uses_ab_test_from), STDDEV_POP(open_rate_su)
            ),
            STDDEV_POP(uses_ab_test_from)
        ) AS open_uses_ab_test_from

    FROM
        `{{gcp_project}}.{{dataset}}.global_actions_states`
    GROUP BY
        state_user_v_peer_open,
        business_type),

imputed_effect_sizes AS (
    SELECT
        campaign_count,
        state_user_v_peer_open,
        business_type,

        -- We now impute the value of the effect size to 0 if it was NaN or NULL. This is to
        --  take into account states where all campaigns either did or did not perform an 
        --  action. In these cases, we assume that campaign outcome is uncorrelated with 
        --  the action because we do not have evidence otherwise.
        COALESCE(
            IF(
                IS_NAN(open_uses_small_subject_line),
                0,
                open_uses_small_subject_line
            ),
            0
        ) AS open_uses_small_subject_line,

        -- We now impute the value of the effect size to 0 if it was NaN or NULL. This is to
        --  take into account states where all campaigns either did or did not perform an 
        --  action. In these cases, we assume that campaign outcome is uncorrelated with 
        --  the action because we do not have evidence otherwise.
        COALESCE(
            IF(IS_NAN(open_uses_personal_subject), 0, open_uses_personal_subject), 0
        ) AS open_uses_personal_subject,

        -- We now impute the value of the effect size to 0 if it was NaN or NULL. This is to
        --  take into account states where all campaigns either did or did not perform an 
        --  action. In these cases, we assume that campaign outcome is uncorrelated with 
        --  the action because we do not have evidence otherwise.
        COALESCE(
            IF(IS_NAN(open_uses_timewarp), 0, open_uses_timewarp), 0
        ) AS open_uses_timewarp,

        -- We now impute the value of the effect size to 0 if it was NaN or NULL. This is to
        --  take into account states where all campaigns either did or did not perform an 
        --  action. In these cases, we assume that campaign outcome is uncorrelated with 
        --  the action because we do not have evidence otherwise.
        COALESCE(
            IF(IS_NAN(open_uses_small_preview), 0, open_uses_small_preview), 0
        ) AS open_uses_small_preview,

        -- We now impute the value of the effect size to 0 if it was NaN or NULL. This is to
        --  take into account states where all campaigns either did or did not perform an 
        --  action. In these cases, we assume that campaign outcome is uncorrelated with 
        --  the action because we do not have evidence otherwise.
        COALESCE(
            IF(IS_NAN(open_uses_personal_to), 0, open_uses_personal_to), 0
        ) AS open_uses_personal_to,

        -- We now impute the value of the effect size to 0 if it was NaN or NULL. This is to
        --  take into account states where all campaigns either did or did not perform an 
        --  action. In these cases, we assume that campaign outcome is uncorrelated with 
        --  the action because we do not have evidence otherwise.
        COALESCE(
            IF(IS_NAN(open_uses_ab_test_subject), 0, open_uses_ab_test_subject), 0
        ) AS open_uses_ab_test_subject,

        -- We now impute the value of the effect size to 0 if it was NaN or NULL. This is to
        --  take into account states where all campaigns either did or did not perform an 
        --  action. In these cases, we assume that campaign outcome is uncorrelated with 
        --  the action because we do not have evidence otherwise.
        COALESCE(
            IF(IS_NAN(open_uses_ab_test_content), 0, open_uses_ab_test_content), 0
        ) AS open_uses_ab_test_content,

        -- We now impute the value of the effect size to 0 if it was NaN or NULL. This is to
        --  take into account states where all campaigns either did or did not perform an 
        --  action. In these cases, we assume that campaign outcome is uncorrelated with 
        --  the action because we do not have evidence otherwise.
        COALESCE(
            IF(IS_NAN(open_uses_preview_text), 0, open_uses_preview_text), 0
        ) AS open_uses_preview_text,

        -- We now impute the value of the effect size to 0 if it was NaN or NULL. This is to
        --  take into account states where all campaigns either did or did not perform an 
        --  action. In these cases, we assume that campaign outcome is uncorrelated with 
        --  the action because we do not have evidence otherwise.
        COALESCE(
            IF(IS_NAN(open_uses_sto), 0, open_uses_sto), 0
        ) AS open_uses_sto,

        -- We now impute the value of the effect size to 0 if it was NaN or NULL. This is to
        --  take into account states where all campaigns either did or did not perform an 
        --  action. In these cases, we assume that campaign outcome is uncorrelated with 
        --  the action because we do not have evidence otherwise.
        COALESCE(
            IF(IS_NAN(open_uses_freemail_from), 0, open_uses_freemail_from), 0
        ) AS open_uses_freemail_from,

        -- We now impute the value of the effect size to 0 if it was NaN or NULL. This is to
        --  take into account states where all campaigns either did or did not perform an 
        --  action. In these cases, we assume that campaign outcome is uncorrelated with 
        --  the action because we do not have evidence otherwise.
        COALESCE(
            IF(
                IS_NAN(open_uses_resend_non_openers),
                0,
                open_uses_resend_non_openers
            ),
            0
        ) AS open_uses_resend_non_openers,

        -- We now impute the value of the effect size to 0 if it was NaN or NULL. This is to
        --  take into account states where all campaigns either did or did not perform an 
        --  action. In these cases, we assume that campaign outcome is uncorrelated with 
        --  the action because we do not have evidence otherwise.
        COALESCE(
            IF(IS_NAN(open_uses_promo_code), 0, open_uses_promo_code), 0
        ) AS open_uses_promo_code,

        -- We now impute the value of the effect size to 0 if it was NaN or NULL. This is to
        --  take into account states where all campaigns either did or did not perform an 
        --  action. In these cases, we assume that campaign outcome is uncorrelated with 
        --  the action because we do not have evidence otherwise.
        COALESCE(
            IF(IS_NAN(open_uses_prex), 0, open_uses_prex), 0
        ) AS open_uses_prex,

        -- We now impute the value of the effect size to 0 if it was NaN or NULL. This is to
        --  take into account states where all campaigns either did or did not perform an 
        --  action. In these cases, we assume that campaign outcome is uncorrelated with 
        --  the action because we do not have evidence otherwise.
        COALESCE(
            IF(IS_NAN(open_uses_ab_test_from), 0, open_uses_ab_test_from), 0
        ) AS open_uses_ab_test_from

    FROM
        raw_effect_sizes
),

action_states AS (
    SELECT
        has_used_small_subject_line,
        has_used_personal_subject,
        has_used_timewarp,
        has_used_small_preview,
        has_used_personal_to,
        has_used_ab_test_subject,
        has_used_ab_test_content,
        has_used_preview_text,
        has_used_sto,
        has_used_freemail_from,
        has_used_resend_non_openers,
        has_used_promo_code,
        has_used_prex,
        has_used_ab_test_from
    FROM `{{gcp_project}}.{{dataset}}.global_state_space`
    GROUP BY has_used_small_subject_line,
        has_used_personal_subject,
        has_used_timewarp,
        has_used_small_preview,
        has_used_personal_to,
        has_used_ab_test_subject,
        has_used_ab_test_content,
        has_used_preview_text,
        has_used_sto,
        has_used_freemail_from,
        has_used_resend_non_openers,
        has_used_promo_code,
        has_used_prex,
        has_used_ab_test_from)

SELECT
    imputed_effect_sizes.*,
    has_used_small_subject_line,
    has_used_personal_subject,
    has_used_timewarp,
    has_used_small_preview,
    has_used_personal_to,
    has_used_ab_test_subject,
    has_used_ab_test_content,
    has_used_preview_text,
    has_used_sto,
    has_used_freemail_from,
    has_used_resend_non_openers,
    has_used_promo_code,
    has_used_prex,
    has_used_ab_test_from
FROM
    imputed_effect_sizes
CROSS JOIN action_states
ORDER BY campaign_count DESC
