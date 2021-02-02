// -----------------------------------------------------------------------------
//    File: ds_rest_i_events.nss
//  System: Rest (events)
//      URL:
//  Authors: Aden Durney (ADurney) <aden.durney@gmail.com>
// -----------------------------------------------------------------------------
// Description:
//  Event functions for PW Subsystem.
// -----------------------------------------------------------------------------
// Builder Use:
//  None!  Leave me alone.
// -----------------------------------------------------------------------------

#include "ds_rest_i_main"
#include "rest_i_main.nss"

// -----------------------------------------------------------------------------
//                              Function Prototypes
// -----------------------------------------------------------------------------


// ---< rest_OnPlayerRestStarted >---
// This is an event function when the module-level OnPlayerRestStarted event
//  fires.  It is registered as a library and event script in rest_l_plugin.
//  This function ensure the PC meets all requirements to rest as set in the
//  Rest system configuration file.
void spellbook_OnPlayerRestStarted();

// ---< rest_OnPlayerRestFinished >---
// This is an event function when the module-level OnPlayerRestFinished event
//  fires.  It is registered as a library and event script in rest_l_plugin.
//  This function restores PC spells/feats and sets the PC up for the next
//  resting period.
void spellbook_OnPlayerRestFinished();

// ---< rest_OnPlayerRestCancelled >---
// This is an event function when the module-level OnPlayerRestCancelled event
//  fires.  It is registered as a library and event script in rest_l_plugin.
//  This function sets PC values upon rest cancellation and removes the sleep
//  effect.
void spellbook_OnPlayerRestCancelled();




// -----------------------------------------------------------------------------
//                             Function Definitions
// -----------------------------------------------------------------------------


void spellbook_OnPlayerRestStarted()
{
        object oPC = GetLastPCRested();

    if (!h2_GetAllowRest(oPC)){
        Debug("h2 allowed rest disabled");
    return;
    }
    h2_SetAllowSpellRecovery(oPC, FALSE);
    int foo =  h2_GetAllowSpellRecovery(oPC);
    if (foo)
    {
        Debug("Spell is true");

    }
    else
    {
        Debug("spell is false");
    }

    /*
    object oPC = GetLastPCRested();

    if (!h2_GetAllowRest(oPC))
        return;

    int skipDialog, nRemainingTime = h2_RemainingTimeForRecoveryInRest(oPC);
    if (!H2_USE_REST_DIALOG)
        skipDialog = TRUE;
    else
        skipDialog = _GetLocalInt(oPC, H2_SKIP_REST_DIALOG);
    
    if (H2_REQUIRE_REST_TRIGGER_OR_CAMPFIRE)
    {
        object oRestTrigger = _GetLocalObject(oPC, H2_REST_TRIGGER);
        object oCampfire = GetNearestObjectByTag(H2_CAMPFIRE, oPC);
        if (GetIsObjectValid(oRestTrigger))
        {
            if (_GetLocalInt(oRestTrigger, H2_IGNORE_MINIMUM_REST_TIME))
                nRemainingTime = 0;
            string feedback = _GetLocalString(oRestTrigger, H2_REST_FEEDBACK);
            if (feedback != "" && skipDialog)
                SendMessageToPC(oPC, feedback);
        }
        else if (!GetIsObjectValid(oCampfire) || GetDistanceBetween(oPC, oCampfire) > 4.0)
        {
            h2_SetAllowRest(oPC, FALSE);
            return;
        }
    }

    if (nRemainingTime > 0)
    {
        if (!skipDialog)
        {
            string waittime = FloatToString(nRemainingTime / HoursToSeconds(1), 5, 2);
            string message = H2_TEXT_RECOVER_WITH_REST_IN + waittime + H2_TEXT_HOURS;
            SendMessageToPC(oPC, message);
        }
        h2_SetAllowSpellRecovery(oPC, FALSE);
        h2_SetAllowFeatRecovery(oPC, FALSE);
        h2_SetPostRestHealAmount(oPC, 0);
    }
    else
    {   
        if (skipDialog && H2_SLEEP_EFFECTS)
            h2_ApplySleepEffects(oPC);
        if (H2_HP_HEALED_PER_REST_PER_LEVEL > -1)
        {
            int postRestHealAmt = H2_HP_HEALED_PER_REST_PER_LEVEL * GetHitDice(oPC);
            h2_SetPostRestHealAmount(oPC, postRestHealAmt);
        }
    }
    */
}

void spellbook_OnPlayerRestFinished()
{
    /*
    object oPC = GetLastPCRested();
    int bAllowSpellRecovery = h2_GetAllowSpellRecovery(oPC);
    if (!bAllowSpellRecovery)
        h2_SetAvailableSpellsToSavedValues(oPC);

    int bAllowFeatRecovery = h2_GetAllowFeatRecovery(oPC);
    if (!bAllowFeatRecovery)
        h2_SetAvailableSpellsToSavedValues(oPC);

    if (bAllowSpellRecovery && bAllowFeatRecovery)
        h2_SaveLastRecoveryRestTime(oPC);

    h2_LimitPostRestHeal(oPC, h2_GetPostRestHealAmount(oPC));
    */
}

void spellbook_OnPlayerRestCancelled()
{
    /*
    object oPC = GetLastPCRested();
    h2_SetPlayerHitPointsToSavedValue(oPC);
    h2_SetAvailableSpellsToSavedValues(oPC);
    h2_SetAvailableFeatsToSavedValues(oPC);
    if (H2_SLEEP_EFFECTS)
        h2_RemoveEffectType(oPC, EFFECT_TYPE_BLINDNESS);
        */
}