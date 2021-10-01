/// @description Cast Shadows(REQUIRES value shadow_y!!)
/// @param REQUIRED(shadow_y
function CastShadow() {
	var p, q;
	p = $7fffffff // positive a-lot


	if (place_meeting(x, y, parSolid) || place_meeting(x,y,parJumpThru)) {
	    p = y + 16
	} else {

	//Handling Solids
	with (parSolid) {
	    if (other.x < bbox_left) continue
	    if (other.x > bbox_right) continue
	    if (other.bbox_top > bbox_bottom) continue
	    if (bbox_top > p) continue
	    // pixel-perfect checking, if needed:
	    if (object_is_ancestor(object_index, parSolid)) {
	        q = bbox_top
	        repeat (bbox_bottom - bbox_top) {
	            if (collision_point(other.x, q, id, true, false)) {
	                p = min(p, q)
	                break
	            }
	            q += 1
	        }
	    } else p = min(p, max(other.bbox_bottom, bbox_top))
	    }

	//Handling Platforms
	with (parJumpThru) {
	    if (other.x < bbox_left) continue
	    if (other.x > bbox_right) continue
	    if (other.bbox_top > bbox_bottom) continue
	    if (bbox_top > p) continue
	    // pixel-perfect checking, if needed:
	    if (object_is_ancestor(object_index, parJumpThru)) {
	        q = bbox_top
	        repeat (bbox_bottom - bbox_top) {
	            if (collision_point(other.x, q, id, true, false)) {
	                p = min(p, q)
	                break
	            }
	            q += 1
	        }
	    } else p = min(p, max(other.bbox_bottom, bbox_top))
	}

	}




	shadow_y = p



}
