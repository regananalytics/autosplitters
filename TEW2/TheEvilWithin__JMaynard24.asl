state("TEW2")
{
    int isLoading       : 0x236B338;
    int LoadingCutscene : 0x38B7170;
    /* int MenuSave        : 0x1E211F8;
       int LoadingIcon     : 0x01E239F0, 0x530, 0x4d8, 0x8; */
    int Chapter         : 0x3615208, 0x5c;
    int Pause           : 0x3637B00;
    int Chap2Chase      : 0x3D3FA10, 0x8, 0x578, 0x42c;
    float x             : 0x38CD190;
    float y             : 0x38CD194;
    float z             : 0x38CD198;
}

reset
{
    return current.Chapter == 1 && old.Chapter == 0;
}

start
{
    return current.Chapter == 1 && old.Chapter == 1;
}

split
{
    return (current.Chapter > old.Chapter && old.Chapter < 17 && old.Chapter > 0) ||
           (current.x > 42099.80858 && current.x < 42099.80860 && current.y > -28778.58009 && current.y < -28778.58007 && current.x != old.x && current.Chapter == 17);
}

isLoading
{
    return current.isLoading == 1 ||
           current.Pause == 1 ||
           (current.LoadingCutscene == 1 && current.Chapter != 2) ||
           (current.LoadingCutscene == 1 && current.Chapter == 2 && current.Chap2Chase != 1) ||
           current.Chapter < 1 ||
           current.Chapter > 17 ||
           (current.z < -4300.0 && current.z > -4400.0 && current.Chapter != 1)
           ;
}

init
{
    timer.IsGameTimePaused = false;
}

exit
{
    timer.IsGameTimePaused = true;
}
