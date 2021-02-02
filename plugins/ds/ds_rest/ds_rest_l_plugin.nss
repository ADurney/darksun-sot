// -----------------------------------------------------------------------------
//    File: ds_rest_l_plugin.nss
//  System: Rest (library)
// -----------------------------------------------------------------------------
// Description:
//  Library functions for PW Subsystem
// -----------------------------------------------------------------------------
// Builder Use:
//  None!  Leave me alone.
// -----------------------------------------------------------------------------

#include "util_i_library"
#include "core_i_framework"
#include "ds_rest_i_events"

// -----------------------------------------------------------------------------
//                               Library Dispatch
// -----------------------------------------------------------------------------

void OnLibraryLoad()
{
    if (!H2_USE_DS_REST_SYSTEM)
        return;

    object oPlugin = GetPlugin("ds");
    
    // ----- Module Events -----
    RegisterEventScripts(oPlugin, MODULE_EVENT_ON_PLAYER_REST_CANCELLED, "spellbook_OnPlayerRestCancelled", 4.0);
    RegisterEventScripts(oPlugin, MODULE_EVENT_ON_PLAYER_REST_FINISHED,  "spellbook_OnPlayerRestFinished",  4.0);
    RegisterEventScripts(oPlugin, MODULE_EVENT_ON_PLAYER_REST_STARTED,   "spellbook_OnPlayerRestStarted",   5.0);

    // ----- Module Events -----
    RegisterLibraryScript("spellbook_OnPlayerRestCancelled", 1);
    RegisterLibraryScript("spellbook_OnPlayerRestFinished",  2);
    RegisterLibraryScript("spellbook_OnPlayerRestStarted",   3);
}

void OnLibraryScript(string sScript, int nEntry)
{
    switch (nEntry)
    {
        
        // ----- Module Events -----
        case 1: spellbook_OnPlayerRestCancelled(); break;
        case 2: spellbook_OnPlayerRestFinished();  break;
        case 3: spellbook_OnPlayerRestStarted();   break;
        
        default: CriticalError("Library function " + sScript + " not found");
    }
}
