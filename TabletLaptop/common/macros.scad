function dim3_to_dim2(dims) = [dims[0], dims[1]];

function keyboard_outer_dims() = dim3_to_dim2(KEYBOARD_DIMENSIONS) + KEYBOARD_PADDING + KEYBOARD_MARGIN;
function keyboard_middle_inner_dims() = dim3_to_dim2(KEYBOARD_DIMENSIONS) + KEYBOARD_PADDING;
function keyboard_top_inner_dims() = KEYBOARD_DIMENSIONS - KEYBOARD_OVERLAP;
function keyboard_z_offset() = (KEYBOARD_DIMENSIONS[2] + KEYBOARD_PADDING[2] + MATERIAL_THICKNESS) / 2;

function keyboard_side_radius() = (keyboard_z_offset() + (MATERIAL_THICKNESS / 2)) + KEYBOARD_SIDE_RADIUS_PADDING;

function keyboard_assy_dx() = (keyboard_outer_dims()[0] + MATERIAL_THICKNESS) / 2;
function keyboard_assy_x_positions() = [-keyboard_assy_dx(), keyboard_assy_dx()];

function keyboard_tab_dy_a() = ((keyboard_outer_dims()[1] * 0.4) - TAB_WIDTH) / 2;
function keyboard_tab_y_positions_a() = [-keyboard_tab_dy_a(), keyboard_tab_dy_a()];

function keyboard_screw_dy_a() = ((keyboard_outer_dims()[1] * 0.6) - TAB_WIDTH) / 2;
function keyboard_screw_y_positions_a() = [-keyboard_screw_dy_a(), 0, keyboard_screw_dy_a()];

function keyboard_tab_dy_b() = ((keyboard_outer_dims()[1] * 0.9) - TAB_WIDTH) / 2;
function keyboard_tab_y_positions_b() = [-keyboard_tab_dy_b(), keyboard_tab_dy_b()];

function tablet_outer_dims() = dim3_to_dim2(TABLET_DIMENSIONS) + TABLET_PADDING + TABLET_MARGIN;
function tablet_middle_inner_dims() = dim3_to_dim2(TABLET_DIMENSIONS) + TABLET_PADDING;
function tablet_top_inner_dims() = TABLET_DIMENSIONS - TABLET_OVERLAP;
function tablet_z_offset() = (TABLET_DIMENSIONS[2] + TABLET_PADDING[2] + MATERIAL_THICKNESS) / 2;

function tablet_side_radius() = (tablet_z_offset() + (MATERIAL_THICKNESS / 2)) + TABLET_SIDE_RADIUS_PADDING;

function tablet_assy_dx() = (tablet_outer_dims()[0] + MATERIAL_THICKNESS) / 2;
function tablet_assy_x_positions() = [-tablet_assy_dx(), tablet_assy_dx()];

function tablet_tab_dy_a() = ((tablet_outer_dims()[1] * 0.4) - TAB_WIDTH) / 2;
function tablet_tab_y_positions_a() = [-tablet_tab_dy_a(), tablet_tab_dy_a()];

function tablet_screw_dy_a() = ((tablet_outer_dims()[1] * 0.6) - TAB_WIDTH) / 2;
function tablet_screw_y_positions_a() = [-tablet_screw_dy_a(), 0, tablet_screw_dy_a()];

function tablet_tab_dy_b() = ((tablet_outer_dims()[1] * 0.9) - TAB_WIDTH) / 2;
function tablet_tab_y_positions_b() = [-tablet_tab_dy_b(), tablet_tab_dy_b()];

function hinge_radius() = max(keyboard_side_radius(), tablet_side_radius());

function keyboard_y_assy_offset() = (keyboard_outer_dims()[1] / 2) + hinge_radius();
function tablet_y_assy_offset() = (tablet_outer_dims()[1] / 2) + hinge_radius() + 5;
function tablet_z_assy_offset() = hinge_radius() * 2;
