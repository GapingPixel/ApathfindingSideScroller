// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_seq_create(Sequence,destroy){

var seqObj = instance_create_depth(x,y,0,obj_effect_sequence_player)

with (seqObj)
{
	sequenceChild_Destroy = destroy;//Determine to destroy sequence after creation
	sequenceChild = Sequence//Sequence we are creating
}


}