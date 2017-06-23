function dim3_to_dim2(dims) = [dims[0], dims[1]];

function keyboard_outer_dims() = dim3_to_dim2(KEYBOARD_DIMENSIONS) + KEYBOARD_PADDING + KEYBOARD_MARGIN;
function keyboard_middle_inner_dims() = dim3_to_dim2(KEYBOARD_DIMENSIONS) + KEYBOARD_PADDING;
function keyboard_top_inner_dims() = KEYBOARD_DIMENSIONS - KEYBOARD_OVERLAP;

function tablet_outer_dims() = dim3_to_dim2(TABLET_DIMENSIONS) + TABLET_PADDING + TABLET_MARGIN;
function tablet_middle_inner_dims() = dim3_to_dim2(TABLET_DIMENSIONS) + TABLET_PADDING;
function tablet_top_inner_dims() = TABLET_DIMENSIONS - TABLET_OVERLAP;
