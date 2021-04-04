// -----------------------------------------------------------------------------
//    File: ds_rest_i_config.nss
//  System: Rest (configuration)
//      URL:
// Authors: Aden Durney (ADurney) <aden.durney@gmail.com>
// -----------------------------------------------------------------------------
// Description:
//  Configuration File for PW Subsystem.
// -----------------------------------------------------------------------------
// Builder Use:
//  Set the constants below as directed in the comments for each constant.
// -----------------------------------------------------------------------------

// -----------------------------------------------------------------------------
//                                   Variables
// -----------------------------------------------------------------------------

const int H2_USE_DS_REST_SYSTEM = TRUE;


//TODO
//Require Wizards to read their spellbook before they can rest and restore spells

const int DS_REST_REQUIRE_WIZARD_SPELLBOOK_READ = TRUE;


//Tag of the spellbook item that needs to be in inventory to restore spells

const string DS_REST_SPELLBOOK = "ds_rest_spellbook";