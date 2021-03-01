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
//  fires.  It is registered as a library and event script in ds_rest_l_plugin.
//  This function ensure the PC meets all requirements to rest as set in the
//  Rest system configuration file.
void spellbook_OnPlayerRestStarted();

// ---< rest_OnPlayerRestFinished >---
// This is an event function when the module-level OnPlayerRestFinished event
//  fires.  It is registered as a library and event script in ds_rest_l_plugin.
//  This function restores PC spells/feats and sets the PC up for the next
//  resting period.
void spellbook_OnPlayerRestFinished();

// ---< rest_OnPlayerRestCancelled >---
// This is an event function when the module-level OnPlayerRestCancelled event
//  fires.  It is registered as a library and event script in ds_rest_l_plugin.
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
    return;
    }

    h2_SavePCHitPoints(oPC);
    h2_SavePCAvailableSpells(oPC);
    h2_SavePCAvailableFeats(oPC);

}

void spellbook_OnPlayerRestFinished()
{
    int i;
    object oPC = GetLastPCRested();
    for (i = 1; i <= 3; i++)
    {
        int nClass = GetClassByPosition(i, oPC);
        if (nClass == CLASS_TYPE_INVALID)
            continue;
        switch (nClass)
        {
            case CLASS_TYPE_WIZARD:
                    h2_SetAllowSpellRecovery(oPC, FALSE);
                    Debug("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");
                    Debug("BAD WIZARD NO SPELLS :)");
                break;
        }
    }

}

void spellbook_OnPlayerRestCancelled()
{

}
   