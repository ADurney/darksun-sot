
#include "core_i_constants"
#include "res_i_const"

void main()
{
    SetLocalInt(OBJECT_SELF, FRAMEWORK_OUTSIDER, TRUE);
    SetLocalString(OBJECT_SELF, CREATURE_EVENT_ON_DAMAGED, "x2_def_ondamage:last");
    ExecuteScript("hook_creature04", OBJECT_SELF);
}
