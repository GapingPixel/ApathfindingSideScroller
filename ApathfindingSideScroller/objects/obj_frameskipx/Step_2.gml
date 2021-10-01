/// @description Update FPS Array - Determine Skip Every...
      
    FSKIP_Index++ ; //Increment per STEP Index Counter
    FSKIP_Index = FSKIP_Index mod FSKIP_ArrayCount; //MOD Index to ArrayCount Numbers (0-ArrayCount)
    FPSIndex[FSKIP_Index] = fps ; //STORE FPS to Array    
    
    if(SKIP_Frames){ //BEGIN
    var X=0; for( var i = 0 ; i <FSKIP_ArrayCount ; i++) //AVERAGE the FPS Stored Values
    {X += FPSIndex[i];} FPS = round(X/FSKIP_ArrayCount); //STORE Average in FPS
    
    var FPSDiff = room_speed-FPS; //COMPUTE - How Many Frames Behind?
    
    //CHECK Frame Rate - If too many frames missed then start skipping every 'X' to catchup
    if (FPSDiff<=MAXFRAMES_Missed) {SKIPEvery = -1;} else {SKIPEvery = ceil(room_speed/FPSDiff);  //If FrameLoss<MAXFRAME then all OK (-1)
    if (room_speed/SKIPEvery>MAX_Skips){SKIPEvery = ceil(room_speed/MAX_Skips);}} //else compute SKIPEvery MOD value to Help Catch Up  
    
    //if MOD==0 (no divide remainder) then Skip Frame else Draw Frame
    if((FSKIP_Index mod SKIPEvery==0) && SKIPEvery>1){draw_enable_drawevent(false);} else {draw_enable_drawevent(true);}
    } //END
    

