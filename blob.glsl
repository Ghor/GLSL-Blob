//===================================//
// https://github.com/Ghor/GLSL-Blob //
//===================================//
// This is not a standalone fragment shader, just a function you can include in your own fragment shader to calculate cool blob shapes.

// Arguments //
// texture_coords: What point on the blob's rectangle you want to sample from.
// endpoint_roundness: Higher values make the endpoints of the spine wider, lower values make the endpoints thinner.
// midpoint_roundness: Higher values expand the shape toward the endpoints of the spine, lower values contract the shape toward the center of mass and make it sharper.
// vertebra_bias: 1.0 is the middle of the spine. Higher values move the center of mass upward, and lower values move the center of mass downward.
// edge_softness: Higher values give soft glowy edges, lower values give hard edges. 0.25 recommended for hard edges.

float CalcBlobIntensity( vec2 texture_coords, float endpoint_roundness, float midpoint_roundness, float vertebra_bias, float edge_softness )
{	
	float distance_to_axis = abs( texture_coords.x-0.5 )*2.0;
	float biased_vertebra_pos = abs( pow(texture_coords.y,vertebra_bias)-0.5 )*2.0;
	float vertebra_intensity = 1.0-pow( biased_vertebra_pos, midpoint_roundness );
	return pow(clamp( vertebra_intensity - pow( distance_to_axis, endpoint_roundness ), 0.0, 1.0 ), edge_softness );
}
