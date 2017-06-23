function dim3_to_dim2(dims) = [dims[0], dims[1]];

function keyboard_outer_dims() = dim3_to_dim2(KEYBOARD_DIMENSIONS) + KEYBOARD_PADDING + KEYBOARD_MARGIN;
function keyboard_middle_inner_dims() = dim3_to_dim2(KEYBOARD_DIMENSIONS) + KEYBOARD_PADDING;
function keyboard_top_inner_dims() = KEYBOARD_DIMENSIONS - KEYBOARD_OVERLAP;
function keyboard_z_offset() = (KEYBOARD_DIMENSIONS[2] + KEYBOARD_PADDING[2] + MATERIAL_THICKNESS) / 2;
function keyboard_side_radius() = (keyboard_z_offset() + (MATERIAL_THICKNESS / 2)) + KEYBOARD_SIDE_RADIUS_PADDING;

function tablet_outer_dims() = dim3_to_dim2(TABLET_DIMENSIONS) + TABLET_PADDING + TABLET_MARGIN;
function tablet_middle_inner_dims() = dim3_to_dim2(TABLET_DIMENSIONS) + TABLET_PADDING;
function tablet_top_inner_dims() = TABLET_DIMENSIONS - TABLET_OVERLAP;
function tablet_z_offset() = (TABLET_DIMENSIONS[2] + TABLET_PADDING[2] + MATERIAL_THICKNESS) / 2;
function tablet_side_radius() = (tablet_z_offset() + (MATERIAL_THICKNESS / 2)) + TABLET_SIDE_RADIUS_PADDING;

function hinge_radius() = max(keyboard_side_radius(), tablet_side_radius());
