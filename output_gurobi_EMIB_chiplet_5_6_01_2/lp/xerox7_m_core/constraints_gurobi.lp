\ Model ChipletPlacementGrid
\ LP format - for model browsing. Use MPS format to capture full model detail.
\ Signature: 0xf104b852190c85f2
Minimize
  0.00248015873015873 aspect_ratio_penalty - 8.23601e-06 power_aware_penalty
   + 8.14164e-05 wirelength + 0.0937916567764727 bbox_area_proxy_t
Subject To
 width_rotation_0: - 6.79 r_0 + w_var_0 = 6.16
 height_rotation_0: 6.79 r_0 + h_var_0 = 12.95
 x_grid_var_ub_0: w_var_0 + x_grid_var_0 <= 138
 y_grid_var_ub_0: h_var_0 + y_grid_var_0 <= 138
 width_rotation_1: - 8.05 r_1 + w_var_1 = 4.9
 height_rotation_1: 8.05 r_1 + h_var_1 = 12.95
 x_grid_var_ub_1: w_var_1 + x_grid_var_1 <= 138
 y_grid_var_ub_1: h_var_1 + y_grid_var_1 <= 138
 width_rotation_2: 0.84 r_2 + w_var_2 = 8.4
 height_rotation_2: - 0.84 r_2 + h_var_2 = 7.56
 x_grid_var_ub_2: w_var_2 + x_grid_var_2 <= 138
 y_grid_var_ub_2: h_var_2 + y_grid_var_2 <= 138
 width_rotation_3: - 7.77 r_3 + w_var_3 = 11.62
 height_rotation_3: 7.77 r_3 + h_var_3 = 19.39
 x_grid_var_ub_3: w_var_3 + x_grid_var_3 <= 138
 y_grid_var_ub_3: h_var_3 + y_grid_var_3 <= 138
 width_rotation_4: - 4.34 r_4 + w_var_4 = 12.18
 height_rotation_4: 4.34 r_4 + h_var_4 = 16.52
 x_grid_var_ub_4: w_var_4 + x_grid_var_4 <= 138
 y_grid_var_ub_4: h_var_4 + y_grid_var_4 <= 138
 width_rotation_5: - 4.34 r_5 + w_var_5 = 8.82
 height_rotation_5: 4.34 r_5 + h_var_5 = 13.16
 x_grid_var_ub_5: w_var_5 + x_grid_var_5 <= 138
 y_grid_var_ub_5: h_var_5 + y_grid_var_5 <= 138
 width_rotation_6: 8.19 r_6 + w_var_6 = 21.14
 height_rotation_6: - 8.19 r_6 + h_var_6 = 12.95
 x_grid_var_ub_6: w_var_6 + x_grid_var_6 <= 138
 y_grid_var_ub_6: h_var_6 + y_grid_var_6 <= 138
 EMIB_width_rotation_0_4: 0.2933 r_EMIB_0_4 + EMIB_w_var_0_4 = 2
 EMIB_height_rotation_0_4: - 0.2933 r_EMIB_0_4 + EMIB_h_var_0_4 = 1.7067
 EMIB_x_grid_var_ub_0_4: EMIB_w_var_0_4 + EMIB_x_grid_var_0_4 <= 138
 EMIB_y_grid_var_ub_0_4: EMIB_h_var_0_4 + EMIB_y_grid_var_0_4 <= 138
 EMIB_width_rotation_0_5: 1.1467 r_EMIB_0_5 + EMIB_w_var_0_5 = 2
 EMIB_height_rotation_0_5: - 1.1467 r_EMIB_0_5 + EMIB_h_var_0_5 = 0.8533
 EMIB_x_grid_var_ub_0_5: EMIB_w_var_0_5 + EMIB_x_grid_var_0_5 <= 138
 EMIB_y_grid_var_ub_0_5: EMIB_h_var_0_5 + EMIB_y_grid_var_0_5 <= 138
 EMIB_width_rotation_0_6: 1.1467 r_EMIB_0_6 + EMIB_w_var_0_6 = 2
 EMIB_height_rotation_0_6: - 1.1467 r_EMIB_0_6 + EMIB_h_var_0_6 = 0.8533
 EMIB_x_grid_var_ub_0_6: EMIB_w_var_0_6 + EMIB_x_grid_var_0_6 <= 138
 EMIB_y_grid_var_ub_0_6: EMIB_h_var_0_6 + EMIB_y_grid_var_0_6 <= 138
 EMIB_width_rotation_1_2: 1.1467 r_EMIB_1_2 + EMIB_w_var_1_2 = 2
 EMIB_height_rotation_1_2: - 1.1467 r_EMIB_1_2 + EMIB_h_var_1_2 = 0.8533
 EMIB_x_grid_var_ub_1_2: EMIB_w_var_1_2 + EMIB_x_grid_var_1_2 <= 138
 EMIB_y_grid_var_ub_1_2: EMIB_h_var_1_2 + EMIB_y_grid_var_1_2 <= 138
 EMIB_width_rotation_2_4: 1.1467 r_EMIB_2_4 + EMIB_w_var_2_4 = 2
 EMIB_height_rotation_2_4: - 1.1467 r_EMIB_2_4 + EMIB_h_var_2_4 = 0.8533
 EMIB_x_grid_var_ub_2_4: EMIB_w_var_2_4 + EMIB_x_grid_var_2_4 <= 138
 EMIB_y_grid_var_ub_2_4: EMIB_h_var_2_4 + EMIB_y_grid_var_2_4 <= 138
 EMIB_width_rotation_2_5: 0.2933 r_EMIB_2_5 + EMIB_w_var_2_5 = 2
 EMIB_height_rotation_2_5: - 0.2933 r_EMIB_2_5 + EMIB_h_var_2_5 = 1.7067
 EMIB_x_grid_var_ub_2_5: EMIB_w_var_2_5 + EMIB_x_grid_var_2_5 <= 138
 EMIB_y_grid_var_ub_2_5: EMIB_h_var_2_5 + EMIB_y_grid_var_2_5 <= 138
 EMIB_width_rotation_3_4: 0.2933 r_EMIB_3_4 + EMIB_w_var_3_4 = 2
 EMIB_height_rotation_3_4: - 0.2933 r_EMIB_3_4 + EMIB_h_var_3_4 = 1.7067
 EMIB_x_grid_var_ub_3_4: EMIB_w_var_3_4 + EMIB_x_grid_var_3_4 <= 138
 EMIB_y_grid_var_ub_3_4: EMIB_h_var_3_4 + EMIB_y_grid_var_3_4 <= 138
 EMIB_width_rotation_3_5: 1.1467 r_EMIB_3_5 + EMIB_w_var_3_5 = 2
 EMIB_height_rotation_3_5: - 1.1467 r_EMIB_3_5 + EMIB_h_var_3_5 = 0.8533
 EMIB_x_grid_var_ub_3_5: EMIB_w_var_3_5 + EMIB_x_grid_var_3_5 <= 138
 EMIB_y_grid_var_ub_3_5: EMIB_h_var_3_5 + EMIB_y_grid_var_3_5 <= 138
 EMIB_width_rotation_4_5: 1.1467 r_EMIB_4_5 + EMIB_w_var_4_5 = 2
 EMIB_height_rotation_4_5: - 1.1467 r_EMIB_4_5 + EMIB_h_var_4_5 = 0.8533
 EMIB_x_grid_var_ub_4_5: EMIB_w_var_4_5 + EMIB_x_grid_var_4_5 <= 138
 EMIB_y_grid_var_ub_4_5: EMIB_h_var_4_5 + EMIB_y_grid_var_4_5 <= 138
 EMIB_width_rotation_4_6: 0.2933 r_EMIB_4_6 + EMIB_w_var_4_6 = 2
 EMIB_height_rotation_4_6: - 0.2933 r_EMIB_4_6 + EMIB_h_var_4_6 = 1.7067
 EMIB_x_grid_var_ub_4_6: EMIB_w_var_4_6 + EMIB_x_grid_var_4_6 <= 138
 EMIB_y_grid_var_ub_4_6: EMIB_h_var_4_6 + EMIB_y_grid_var_4_6 <= 138
 cx_def_0: - 0.5 w_var_0 - x_grid_var_0 + cx_grid_var_0 = 0
 cy_def_0: - 0.5 h_var_0 - y_grid_var_0 + cy_grid_var_0 = 0
 cx_def_1: - 0.5 w_var_1 - x_grid_var_1 + cx_grid_var_1 = 0
 cy_def_1: - 0.5 h_var_1 - y_grid_var_1 + cy_grid_var_1 = 0
 cx_def_2: - 0.5 w_var_2 - x_grid_var_2 + cx_grid_var_2 = 0
 cy_def_2: - 0.5 h_var_2 - y_grid_var_2 + cy_grid_var_2 = 0
 cx_def_3: - 0.5 w_var_3 - x_grid_var_3 + cx_grid_var_3 = 0
 cy_def_3: - 0.5 h_var_3 - y_grid_var_3 + cy_grid_var_3 = 0
 cx_def_4: - 0.5 w_var_4 - x_grid_var_4 + cx_grid_var_4 = 0
 cy_def_4: - 0.5 h_var_4 - y_grid_var_4 + cy_grid_var_4 = 0
 cx_def_5: - 0.5 w_var_5 - x_grid_var_5 + cx_grid_var_5 = 0
 cy_def_5: - 0.5 h_var_5 - y_grid_var_5 + cy_grid_var_5 = 0
 cx_def_6: - 0.5 w_var_6 - x_grid_var_6 + cx_grid_var_6 = 0
 cy_def_6: - 0.5 h_var_6 - y_grid_var_6 + cy_grid_var_6 = 0
 EMIB_cx_def_0_4: - 0.5 EMIB_w_var_0_4 - EMIB_x_grid_var_0_4
   + EMIB_cx_grid_var_0_4 = 0
 EMIB_cy_def_0_4: - 0.5 EMIB_h_var_0_4 - EMIB_y_grid_var_0_4
   + EMIB_cy_grid_var_0_4 = 0
 EMIB_cx_def_0_5: - 0.5 EMIB_w_var_0_5 - EMIB_x_grid_var_0_5
   + EMIB_cx_grid_var_0_5 = 0
 EMIB_cy_def_0_5: - 0.5 EMIB_h_var_0_5 - EMIB_y_grid_var_0_5
   + EMIB_cy_grid_var_0_5 = 0
 EMIB_cx_def_0_6: - 0.5 EMIB_w_var_0_6 - EMIB_x_grid_var_0_6
   + EMIB_cx_grid_var_0_6 = 0
 EMIB_cy_def_0_6: - 0.5 EMIB_h_var_0_6 - EMIB_y_grid_var_0_6
   + EMIB_cy_grid_var_0_6 = 0
 EMIB_cx_def_1_2: - 0.5 EMIB_w_var_1_2 - EMIB_x_grid_var_1_2
   + EMIB_cx_grid_var_1_2 = 0
 EMIB_cy_def_1_2: - 0.5 EMIB_h_var_1_2 - EMIB_y_grid_var_1_2
   + EMIB_cy_grid_var_1_2 = 0
 EMIB_cx_def_2_4: - 0.5 EMIB_w_var_2_4 - EMIB_x_grid_var_2_4
   + EMIB_cx_grid_var_2_4 = 0
 EMIB_cy_def_2_4: - 0.5 EMIB_h_var_2_4 - EMIB_y_grid_var_2_4
   + EMIB_cy_grid_var_2_4 = 0
 EMIB_cx_def_2_5: - 0.5 EMIB_w_var_2_5 - EMIB_x_grid_var_2_5
   + EMIB_cx_grid_var_2_5 = 0
 EMIB_cy_def_2_5: - 0.5 EMIB_h_var_2_5 - EMIB_y_grid_var_2_5
   + EMIB_cy_grid_var_2_5 = 0
 EMIB_cx_def_3_4: - 0.5 EMIB_w_var_3_4 - EMIB_x_grid_var_3_4
   + EMIB_cx_grid_var_3_4 = 0
 EMIB_cy_def_3_4: - 0.5 EMIB_h_var_3_4 - EMIB_y_grid_var_3_4
   + EMIB_cy_grid_var_3_4 = 0
 EMIB_cx_def_3_5: - 0.5 EMIB_w_var_3_5 - EMIB_x_grid_var_3_5
   + EMIB_cx_grid_var_3_5 = 0
 EMIB_cy_def_3_5: - 0.5 EMIB_h_var_3_5 - EMIB_y_grid_var_3_5
   + EMIB_cy_grid_var_3_5 = 0
 EMIB_cx_def_4_5: - 0.5 EMIB_w_var_4_5 - EMIB_x_grid_var_4_5
   + EMIB_cx_grid_var_4_5 = 0
 EMIB_cy_def_4_5: - 0.5 EMIB_h_var_4_5 - EMIB_y_grid_var_4_5
   + EMIB_cy_grid_var_4_5 = 0
 EMIB_cx_def_4_6: - 0.5 EMIB_w_var_4_6 - EMIB_x_grid_var_4_6
   + EMIB_cx_grid_var_4_6 = 0
 EMIB_cy_def_4_6: - 0.5 EMIB_h_var_4_6 - EMIB_y_grid_var_4_6
   + EMIB_cy_grid_var_4_6 = 0
 must_adjacent_sb_0_4: z1_0_4 + z2_0_4 = 1
 horizontal_direction_sb_0_4: - z1_0_4 + z1L_0_4 + z1R_0_4 = 0
 vertical_direction_sb_0_4: - z2_0_4 + z2D_0_4 + z2U_0_4 = 0
 EMIB_rotate_eq_z2_0_4: r_EMIB_0_4 - z2_0_4 = 0
 horizontal_left_dist_lb_0_4: - w_var_0 - x_grid_var_0 + x_grid_var_4
   - 276 z1L_0_4 >= -276
 EMIB_left_overlap_0_4: w_var_0 + x_grid_var_0 - EMIB_x_grid_var_0_4
   - 276 z1L_0_4 >= -275.001
 EMIB_right_overlap_0_4: EMIB_w_var_0_4 - x_grid_var_4
   + EMIB_x_grid_var_0_4 - 276 z1L_0_4 >= -275.001
 horizontal_right_dist_lb_0_4: - w_var_4 + x_grid_var_0 - x_grid_var_4
   - 276 z1R_0_4 >= -276
 EMIB_left_overlap_right_0_4: w_var_4 + x_grid_var_4 - EMIB_x_grid_var_0_4
   - 276 z1R_0_4 >= -275.001
 EMIB_right_overlap_right_0_4: EMIB_w_var_0_4 - x_grid_var_0
   + EMIB_x_grid_var_0_4 - 276 z1R_0_4 >= -275.001
 vertical_down_dist_lb_0_4: - h_var_0 - y_grid_var_0 + y_grid_var_4
   - 276 z2D_0_4 >= -276
 EMIB_bottom_overlap_down_0_4: h_var_0 + y_grid_var_0 - EMIB_y_grid_var_0_4
   - 276 z2D_0_4 >= -275.001
 EMIB_top_overlap_down_0_4: EMIB_h_var_0_4 - y_grid_var_4
   + EMIB_y_grid_var_0_4 - 276 z2D_0_4 >= -275.001
 vertical_up_dist_lb_0_4: - h_var_4 + y_grid_var_0 - y_grid_var_4
   - 276 z2U_0_4 >= -276
 EMIB_bottom_overlap_up_0_4: h_var_4 + y_grid_var_4 - EMIB_y_grid_var_0_4
   - 276 z2U_0_4 >= -275.001
 EMIB_top_overlap_up_0_4: EMIB_h_var_0_4 - y_grid_var_0
   + EMIB_y_grid_var_0_4 - 276 z2U_0_4 >= -275.001
 shared_yi_ub1_0_4: h_var_0 - EMIB_h_var_0_4 + y_grid_var_0
   - EMIB_y_grid_var_0_4 - 276 z1_0_4 >= -276
 shared_yi_ub2_0_4: y_grid_var_0 - EMIB_y_grid_var_0_4 + 276 z1_0_4 <= 276
 shared_yj_ub1_0_4: h_var_4 - EMIB_h_var_0_4 + y_grid_var_4
   - EMIB_y_grid_var_0_4 - 276 z1_0_4 >= -276
 shared_yj_ub2_0_4: y_grid_var_4 - EMIB_y_grid_var_0_4 + 276 z1_0_4 <= 276
 shared_xi_ub1_0_4: w_var_0 - EMIB_w_var_0_4 + x_grid_var_0
   - EMIB_x_grid_var_0_4 - 276 z2_0_4 >= -276
 shared_xi_ub2_0_4: x_grid_var_0 - EMIB_x_grid_var_0_4 + 276 z2_0_4 <= 276
 shared_xj_ub1_0_4: w_var_4 - EMIB_w_var_0_4 + x_grid_var_4
   - EMIB_x_grid_var_0_4 - 276 z2_0_4 >= -276
 shared_xj_ub2_0_4: x_grid_var_4 - EMIB_x_grid_var_0_4 + 276 z2_0_4 <= 276
 must_adjacent_sb_0_5: z1_0_5 + z2_0_5 = 1
 horizontal_direction_sb_0_5: - z1_0_5 + z1L_0_5 + z1R_0_5 = 0
 vertical_direction_sb_0_5: - z2_0_5 + z2D_0_5 + z2U_0_5 = 0
 EMIB_rotate_eq_z2_0_5: r_EMIB_0_5 - z2_0_5 = 0
 horizontal_left_dist_lb_0_5: - w_var_0 - x_grid_var_0 + x_grid_var_5
   - 276 z1L_0_5 >= -276
 EMIB_left_overlap_0_5: w_var_0 + x_grid_var_0 - EMIB_x_grid_var_0_5
   - 276 z1L_0_5 >= -275.001
 EMIB_right_overlap_0_5: EMIB_w_var_0_5 - x_grid_var_5
   + EMIB_x_grid_var_0_5 - 276 z1L_0_5 >= -275.001
 horizontal_right_dist_lb_0_5: - w_var_5 + x_grid_var_0 - x_grid_var_5
   - 276 z1R_0_5 >= -276
 EMIB_left_overlap_right_0_5: w_var_5 + x_grid_var_5 - EMIB_x_grid_var_0_5
   - 276 z1R_0_5 >= -275.001
 EMIB_right_overlap_right_0_5: EMIB_w_var_0_5 - x_grid_var_0
   + EMIB_x_grid_var_0_5 - 276 z1R_0_5 >= -275.001
 vertical_down_dist_lb_0_5: - h_var_0 - y_grid_var_0 + y_grid_var_5
   - 276 z2D_0_5 >= -276
 EMIB_bottom_overlap_down_0_5: h_var_0 + y_grid_var_0 - EMIB_y_grid_var_0_5
   - 276 z2D_0_5 >= -275.001
 EMIB_top_overlap_down_0_5: EMIB_h_var_0_5 - y_grid_var_5
   + EMIB_y_grid_var_0_5 - 276 z2D_0_5 >= -275.001
 vertical_up_dist_lb_0_5: - h_var_5 + y_grid_var_0 - y_grid_var_5
   - 276 z2U_0_5 >= -276
 EMIB_bottom_overlap_up_0_5: h_var_5 + y_grid_var_5 - EMIB_y_grid_var_0_5
   - 276 z2U_0_5 >= -275.001
 EMIB_top_overlap_up_0_5: EMIB_h_var_0_5 - y_grid_var_0
   + EMIB_y_grid_var_0_5 - 276 z2U_0_5 >= -275.001
 shared_yi_ub1_0_5: h_var_0 - EMIB_h_var_0_5 + y_grid_var_0
   - EMIB_y_grid_var_0_5 - 276 z1_0_5 >= -276
 shared_yi_ub2_0_5: y_grid_var_0 - EMIB_y_grid_var_0_5 + 276 z1_0_5 <= 276
 shared_yj_ub1_0_5: h_var_5 - EMIB_h_var_0_5 + y_grid_var_5
   - EMIB_y_grid_var_0_5 - 276 z1_0_5 >= -276
 shared_yj_ub2_0_5: y_grid_var_5 - EMIB_y_grid_var_0_5 + 276 z1_0_5 <= 276
 shared_xi_ub1_0_5: w_var_0 - EMIB_w_var_0_5 + x_grid_var_0
   - EMIB_x_grid_var_0_5 - 276 z2_0_5 >= -276
 shared_xi_ub2_0_5: x_grid_var_0 - EMIB_x_grid_var_0_5 + 276 z2_0_5 <= 276
 shared_xj_ub1_0_5: w_var_5 - EMIB_w_var_0_5 + x_grid_var_5
   - EMIB_x_grid_var_0_5 - 276 z2_0_5 >= -276
 shared_xj_ub2_0_5: x_grid_var_5 - EMIB_x_grid_var_0_5 + 276 z2_0_5 <= 276
 must_adjacent_sb_0_6: z1_0_6 + z2_0_6 = 1
 horizontal_direction_sb_0_6: - z1_0_6 + z1L_0_6 + z1R_0_6 = 0
 vertical_direction_sb_0_6: - z2_0_6 + z2D_0_6 + z2U_0_6 = 0
 EMIB_rotate_eq_z2_0_6: r_EMIB_0_6 - z2_0_6 = 0
 horizontal_left_dist_lb_0_6: - w_var_0 - x_grid_var_0 + x_grid_var_6
   - 276 z1L_0_6 >= -276
 EMIB_left_overlap_0_6: w_var_0 + x_grid_var_0 - EMIB_x_grid_var_0_6
   - 276 z1L_0_6 >= -275.001
 EMIB_right_overlap_0_6: EMIB_w_var_0_6 - x_grid_var_6
   + EMIB_x_grid_var_0_6 - 276 z1L_0_6 >= -275.001
 horizontal_right_dist_lb_0_6: - w_var_6 + x_grid_var_0 - x_grid_var_6
   - 276 z1R_0_6 >= -276
 EMIB_left_overlap_right_0_6: w_var_6 + x_grid_var_6 - EMIB_x_grid_var_0_6
   - 276 z1R_0_6 >= -275.001
 EMIB_right_overlap_right_0_6: EMIB_w_var_0_6 - x_grid_var_0
   + EMIB_x_grid_var_0_6 - 276 z1R_0_6 >= -275.001
 vertical_down_dist_lb_0_6: - h_var_0 - y_grid_var_0 + y_grid_var_6
   - 276 z2D_0_6 >= -276
 EMIB_bottom_overlap_down_0_6: h_var_0 + y_grid_var_0 - EMIB_y_grid_var_0_6
   - 276 z2D_0_6 >= -275.001
 EMIB_top_overlap_down_0_6: EMIB_h_var_0_6 - y_grid_var_6
   + EMIB_y_grid_var_0_6 - 276 z2D_0_6 >= -275.001
 vertical_up_dist_lb_0_6: - h_var_6 + y_grid_var_0 - y_grid_var_6
   - 276 z2U_0_6 >= -276
 EMIB_bottom_overlap_up_0_6: h_var_6 + y_grid_var_6 - EMIB_y_grid_var_0_6
   - 276 z2U_0_6 >= -275.001
 EMIB_top_overlap_up_0_6: EMIB_h_var_0_6 - y_grid_var_0
   + EMIB_y_grid_var_0_6 - 276 z2U_0_6 >= -275.001
 shared_yi_ub1_0_6: h_var_0 - EMIB_h_var_0_6 + y_grid_var_0
   - EMIB_y_grid_var_0_6 - 276 z1_0_6 >= -276
 shared_yi_ub2_0_6: y_grid_var_0 - EMIB_y_grid_var_0_6 + 276 z1_0_6 <= 276
 shared_yj_ub1_0_6: h_var_6 - EMIB_h_var_0_6 + y_grid_var_6
   - EMIB_y_grid_var_0_6 - 276 z1_0_6 >= -276
 shared_yj_ub2_0_6: y_grid_var_6 - EMIB_y_grid_var_0_6 + 276 z1_0_6 <= 276
 shared_xi_ub1_0_6: w_var_0 - EMIB_w_var_0_6 + x_grid_var_0
   - EMIB_x_grid_var_0_6 - 276 z2_0_6 >= -276
 shared_xi_ub2_0_6: x_grid_var_0 - EMIB_x_grid_var_0_6 + 276 z2_0_6 <= 276
 shared_xj_ub1_0_6: w_var_6 - EMIB_w_var_0_6 + x_grid_var_6
   - EMIB_x_grid_var_0_6 - 276 z2_0_6 >= -276
 shared_xj_ub2_0_6: x_grid_var_6 - EMIB_x_grid_var_0_6 + 276 z2_0_6 <= 276
 must_adjacent_sb_1_2: z1_1_2 + z2_1_2 = 1
 horizontal_direction_sb_1_2: - z1_1_2 + z1L_1_2 + z1R_1_2 = 0
 vertical_direction_sb_1_2: - z2_1_2 + z2D_1_2 + z2U_1_2 = 0
 EMIB_rotate_eq_z2_1_2: r_EMIB_1_2 - z2_1_2 = 0
 horizontal_left_dist_lb_1_2: - w_var_1 - x_grid_var_1 + x_grid_var_2
   - 276 z1L_1_2 >= -276
 EMIB_left_overlap_1_2: w_var_1 + x_grid_var_1 - EMIB_x_grid_var_1_2
   - 276 z1L_1_2 >= -275.001
 EMIB_right_overlap_1_2: EMIB_w_var_1_2 - x_grid_var_2
   + EMIB_x_grid_var_1_2 - 276 z1L_1_2 >= -275.001
 horizontal_right_dist_lb_1_2: - w_var_2 + x_grid_var_1 - x_grid_var_2
   - 276 z1R_1_2 >= -276
 EMIB_left_overlap_right_1_2: w_var_2 + x_grid_var_2 - EMIB_x_grid_var_1_2
   - 276 z1R_1_2 >= -275.001
 EMIB_right_overlap_right_1_2: EMIB_w_var_1_2 - x_grid_var_1
   + EMIB_x_grid_var_1_2 - 276 z1R_1_2 >= -275.001
 vertical_down_dist_lb_1_2: - h_var_1 - y_grid_var_1 + y_grid_var_2
   - 276 z2D_1_2 >= -276
 EMIB_bottom_overlap_down_1_2: h_var_1 + y_grid_var_1 - EMIB_y_grid_var_1_2
   - 276 z2D_1_2 >= -275.001
 EMIB_top_overlap_down_1_2: EMIB_h_var_1_2 - y_grid_var_2
   + EMIB_y_grid_var_1_2 - 276 z2D_1_2 >= -275.001
 vertical_up_dist_lb_1_2: - h_var_2 + y_grid_var_1 - y_grid_var_2
   - 276 z2U_1_2 >= -276
 EMIB_bottom_overlap_up_1_2: h_var_2 + y_grid_var_2 - EMIB_y_grid_var_1_2
   - 276 z2U_1_2 >= -275.001
 EMIB_top_overlap_up_1_2: EMIB_h_var_1_2 - y_grid_var_1
   + EMIB_y_grid_var_1_2 - 276 z2U_1_2 >= -275.001
 shared_yi_ub1_1_2: h_var_1 - EMIB_h_var_1_2 + y_grid_var_1
   - EMIB_y_grid_var_1_2 - 276 z1_1_2 >= -276
 shared_yi_ub2_1_2: y_grid_var_1 - EMIB_y_grid_var_1_2 + 276 z1_1_2 <= 276
 shared_yj_ub1_1_2: h_var_2 - EMIB_h_var_1_2 + y_grid_var_2
   - EMIB_y_grid_var_1_2 - 276 z1_1_2 >= -276
 shared_yj_ub2_1_2: y_grid_var_2 - EMIB_y_grid_var_1_2 + 276 z1_1_2 <= 276
 shared_xi_ub1_1_2: w_var_1 - EMIB_w_var_1_2 + x_grid_var_1
   - EMIB_x_grid_var_1_2 - 276 z2_1_2 >= -276
 shared_xi_ub2_1_2: x_grid_var_1 - EMIB_x_grid_var_1_2 + 276 z2_1_2 <= 276
 shared_xj_ub1_1_2: w_var_2 - EMIB_w_var_1_2 + x_grid_var_2
   - EMIB_x_grid_var_1_2 - 276 z2_1_2 >= -276
 shared_xj_ub2_1_2: x_grid_var_2 - EMIB_x_grid_var_1_2 + 276 z2_1_2 <= 276
 must_adjacent_sb_2_4: z1_2_4 + z2_2_4 = 1
 horizontal_direction_sb_2_4: - z1_2_4 + z1L_2_4 + z1R_2_4 = 0
 vertical_direction_sb_2_4: - z2_2_4 + z2D_2_4 + z2U_2_4 = 0
 EMIB_rotate_eq_z2_2_4: r_EMIB_2_4 - z2_2_4 = 0
 horizontal_left_dist_lb_2_4: - w_var_2 - x_grid_var_2 + x_grid_var_4
   - 276 z1L_2_4 >= -276
 EMIB_left_overlap_2_4: w_var_2 + x_grid_var_2 - EMIB_x_grid_var_2_4
   - 276 z1L_2_4 >= -275.001
 EMIB_right_overlap_2_4: EMIB_w_var_2_4 - x_grid_var_4
   + EMIB_x_grid_var_2_4 - 276 z1L_2_4 >= -275.001
 horizontal_right_dist_lb_2_4: - w_var_4 + x_grid_var_2 - x_grid_var_4
   - 276 z1R_2_4 >= -276
 EMIB_left_overlap_right_2_4: w_var_4 + x_grid_var_4 - EMIB_x_grid_var_2_4
   - 276 z1R_2_4 >= -275.001
 EMIB_right_overlap_right_2_4: EMIB_w_var_2_4 - x_grid_var_2
   + EMIB_x_grid_var_2_4 - 276 z1R_2_4 >= -275.001
 vertical_down_dist_lb_2_4: - h_var_2 - y_grid_var_2 + y_grid_var_4
   - 276 z2D_2_4 >= -276
 EMIB_bottom_overlap_down_2_4: h_var_2 + y_grid_var_2 - EMIB_y_grid_var_2_4
   - 276 z2D_2_4 >= -275.001
 EMIB_top_overlap_down_2_4: EMIB_h_var_2_4 - y_grid_var_4
   + EMIB_y_grid_var_2_4 - 276 z2D_2_4 >= -275.001
 vertical_up_dist_lb_2_4: - h_var_4 + y_grid_var_2 - y_grid_var_4
   - 276 z2U_2_4 >= -276
 EMIB_bottom_overlap_up_2_4: h_var_4 + y_grid_var_4 - EMIB_y_grid_var_2_4
   - 276 z2U_2_4 >= -275.001
 EMIB_top_overlap_up_2_4: EMIB_h_var_2_4 - y_grid_var_2
   + EMIB_y_grid_var_2_4 - 276 z2U_2_4 >= -275.001
 shared_yi_ub1_2_4: h_var_2 - EMIB_h_var_2_4 + y_grid_var_2
   - EMIB_y_grid_var_2_4 - 276 z1_2_4 >= -276
 shared_yi_ub2_2_4: y_grid_var_2 - EMIB_y_grid_var_2_4 + 276 z1_2_4 <= 276
 shared_yj_ub1_2_4: h_var_4 - EMIB_h_var_2_4 + y_grid_var_4
   - EMIB_y_grid_var_2_4 - 276 z1_2_4 >= -276
 shared_yj_ub2_2_4: y_grid_var_4 - EMIB_y_grid_var_2_4 + 276 z1_2_4 <= 276
 shared_xi_ub1_2_4: w_var_2 - EMIB_w_var_2_4 + x_grid_var_2
   - EMIB_x_grid_var_2_4 - 276 z2_2_4 >= -276
 shared_xi_ub2_2_4: x_grid_var_2 - EMIB_x_grid_var_2_4 + 276 z2_2_4 <= 276
 shared_xj_ub1_2_4: w_var_4 - EMIB_w_var_2_4 + x_grid_var_4
   - EMIB_x_grid_var_2_4 - 276 z2_2_4 >= -276
 shared_xj_ub2_2_4: x_grid_var_4 - EMIB_x_grid_var_2_4 + 276 z2_2_4 <= 276
 must_adjacent_sb_2_5: z1_2_5 + z2_2_5 = 1
 horizontal_direction_sb_2_5: - z1_2_5 + z1L_2_5 + z1R_2_5 = 0
 vertical_direction_sb_2_5: - z2_2_5 + z2D_2_5 + z2U_2_5 = 0
 EMIB_rotate_eq_z2_2_5: r_EMIB_2_5 - z2_2_5 = 0
 horizontal_left_dist_lb_2_5: - w_var_2 - x_grid_var_2 + x_grid_var_5
   - 276 z1L_2_5 >= -276
 EMIB_left_overlap_2_5: w_var_2 + x_grid_var_2 - EMIB_x_grid_var_2_5
   - 276 z1L_2_5 >= -275.001
 EMIB_right_overlap_2_5: EMIB_w_var_2_5 - x_grid_var_5
   + EMIB_x_grid_var_2_5 - 276 z1L_2_5 >= -275.001
 horizontal_right_dist_lb_2_5: - w_var_5 + x_grid_var_2 - x_grid_var_5
   - 276 z1R_2_5 >= -276
 EMIB_left_overlap_right_2_5: w_var_5 + x_grid_var_5 - EMIB_x_grid_var_2_5
   - 276 z1R_2_5 >= -275.001
 EMIB_right_overlap_right_2_5: EMIB_w_var_2_5 - x_grid_var_2
   + EMIB_x_grid_var_2_5 - 276 z1R_2_5 >= -275.001
 vertical_down_dist_lb_2_5: - h_var_2 - y_grid_var_2 + y_grid_var_5
   - 276 z2D_2_5 >= -276
 EMIB_bottom_overlap_down_2_5: h_var_2 + y_grid_var_2 - EMIB_y_grid_var_2_5
   - 276 z2D_2_5 >= -275.001
 EMIB_top_overlap_down_2_5: EMIB_h_var_2_5 - y_grid_var_5
   + EMIB_y_grid_var_2_5 - 276 z2D_2_5 >= -275.001
 vertical_up_dist_lb_2_5: - h_var_5 + y_grid_var_2 - y_grid_var_5
   - 276 z2U_2_5 >= -276
 EMIB_bottom_overlap_up_2_5: h_var_5 + y_grid_var_5 - EMIB_y_grid_var_2_5
   - 276 z2U_2_5 >= -275.001
 EMIB_top_overlap_up_2_5: EMIB_h_var_2_5 - y_grid_var_2
   + EMIB_y_grid_var_2_5 - 276 z2U_2_5 >= -275.001
 shared_yi_ub1_2_5: h_var_2 - EMIB_h_var_2_5 + y_grid_var_2
   - EMIB_y_grid_var_2_5 - 276 z1_2_5 >= -276
 shared_yi_ub2_2_5: y_grid_var_2 - EMIB_y_grid_var_2_5 + 276 z1_2_5 <= 276
 shared_yj_ub1_2_5: h_var_5 - EMIB_h_var_2_5 + y_grid_var_5
   - EMIB_y_grid_var_2_5 - 276 z1_2_5 >= -276
 shared_yj_ub2_2_5: y_grid_var_5 - EMIB_y_grid_var_2_5 + 276 z1_2_5 <= 276
 shared_xi_ub1_2_5: w_var_2 - EMIB_w_var_2_5 + x_grid_var_2
   - EMIB_x_grid_var_2_5 - 276 z2_2_5 >= -276
 shared_xi_ub2_2_5: x_grid_var_2 - EMIB_x_grid_var_2_5 + 276 z2_2_5 <= 276
 shared_xj_ub1_2_5: w_var_5 - EMIB_w_var_2_5 + x_grid_var_5
   - EMIB_x_grid_var_2_5 - 276 z2_2_5 >= -276
 shared_xj_ub2_2_5: x_grid_var_5 - EMIB_x_grid_var_2_5 + 276 z2_2_5 <= 276
 must_adjacent_sb_3_4: z1_3_4 + z2_3_4 = 1
 horizontal_direction_sb_3_4: - z1_3_4 + z1L_3_4 + z1R_3_4 = 0
 vertical_direction_sb_3_4: - z2_3_4 + z2D_3_4 + z2U_3_4 = 0
 EMIB_rotate_eq_z2_3_4: r_EMIB_3_4 - z2_3_4 = 0
 horizontal_left_dist_lb_3_4: - w_var_3 - x_grid_var_3 + x_grid_var_4
   - 276 z1L_3_4 >= -276
 EMIB_left_overlap_3_4: w_var_3 + x_grid_var_3 - EMIB_x_grid_var_3_4
   - 276 z1L_3_4 >= -275.001
 EMIB_right_overlap_3_4: EMIB_w_var_3_4 - x_grid_var_4
   + EMIB_x_grid_var_3_4 - 276 z1L_3_4 >= -275.001
 horizontal_right_dist_lb_3_4: - w_var_4 + x_grid_var_3 - x_grid_var_4
   - 276 z1R_3_4 >= -276
 EMIB_left_overlap_right_3_4: w_var_4 + x_grid_var_4 - EMIB_x_grid_var_3_4
   - 276 z1R_3_4 >= -275.001
 EMIB_right_overlap_right_3_4: EMIB_w_var_3_4 - x_grid_var_3
   + EMIB_x_grid_var_3_4 - 276 z1R_3_4 >= -275.001
 vertical_down_dist_lb_3_4: - h_var_3 - y_grid_var_3 + y_grid_var_4
   - 276 z2D_3_4 >= -276
 EMIB_bottom_overlap_down_3_4: h_var_3 + y_grid_var_3 - EMIB_y_grid_var_3_4
   - 276 z2D_3_4 >= -275.001
 EMIB_top_overlap_down_3_4: EMIB_h_var_3_4 - y_grid_var_4
   + EMIB_y_grid_var_3_4 - 276 z2D_3_4 >= -275.001
 vertical_up_dist_lb_3_4: - h_var_4 + y_grid_var_3 - y_grid_var_4
   - 276 z2U_3_4 >= -276
 EMIB_bottom_overlap_up_3_4: h_var_4 + y_grid_var_4 - EMIB_y_grid_var_3_4
   - 276 z2U_3_4 >= -275.001
 EMIB_top_overlap_up_3_4: EMIB_h_var_3_4 - y_grid_var_3
   + EMIB_y_grid_var_3_4 - 276 z2U_3_4 >= -275.001
 shared_yi_ub1_3_4: h_var_3 - EMIB_h_var_3_4 + y_grid_var_3
   - EMIB_y_grid_var_3_4 - 276 z1_3_4 >= -276
 shared_yi_ub2_3_4: y_grid_var_3 - EMIB_y_grid_var_3_4 + 276 z1_3_4 <= 276
 shared_yj_ub1_3_4: h_var_4 - EMIB_h_var_3_4 + y_grid_var_4
   - EMIB_y_grid_var_3_4 - 276 z1_3_4 >= -276
 shared_yj_ub2_3_4: y_grid_var_4 - EMIB_y_grid_var_3_4 + 276 z1_3_4 <= 276
 shared_xi_ub1_3_4: w_var_3 - EMIB_w_var_3_4 + x_grid_var_3
   - EMIB_x_grid_var_3_4 - 276 z2_3_4 >= -276
 shared_xi_ub2_3_4: x_grid_var_3 - EMIB_x_grid_var_3_4 + 276 z2_3_4 <= 276
 shared_xj_ub1_3_4: w_var_4 - EMIB_w_var_3_4 + x_grid_var_4
   - EMIB_x_grid_var_3_4 - 276 z2_3_4 >= -276
 shared_xj_ub2_3_4: x_grid_var_4 - EMIB_x_grid_var_3_4 + 276 z2_3_4 <= 276
 must_adjacent_sb_3_5: z1_3_5 + z2_3_5 = 1
 horizontal_direction_sb_3_5: - z1_3_5 + z1L_3_5 + z1R_3_5 = 0
 vertical_direction_sb_3_5: - z2_3_5 + z2D_3_5 + z2U_3_5 = 0
 EMIB_rotate_eq_z2_3_5: r_EMIB_3_5 - z2_3_5 = 0
 horizontal_left_dist_lb_3_5: - w_var_3 - x_grid_var_3 + x_grid_var_5
   - 276 z1L_3_5 >= -276
 EMIB_left_overlap_3_5: w_var_3 + x_grid_var_3 - EMIB_x_grid_var_3_5
   - 276 z1L_3_5 >= -275.001
 EMIB_right_overlap_3_5: EMIB_w_var_3_5 - x_grid_var_5
   + EMIB_x_grid_var_3_5 - 276 z1L_3_5 >= -275.001
 horizontal_right_dist_lb_3_5: - w_var_5 + x_grid_var_3 - x_grid_var_5
   - 276 z1R_3_5 >= -276
 EMIB_left_overlap_right_3_5: w_var_5 + x_grid_var_5 - EMIB_x_grid_var_3_5
   - 276 z1R_3_5 >= -275.001
 EMIB_right_overlap_right_3_5: EMIB_w_var_3_5 - x_grid_var_3
   + EMIB_x_grid_var_3_5 - 276 z1R_3_5 >= -275.001
 vertical_down_dist_lb_3_5: - h_var_3 - y_grid_var_3 + y_grid_var_5
   - 276 z2D_3_5 >= -276
 EMIB_bottom_overlap_down_3_5: h_var_3 + y_grid_var_3 - EMIB_y_grid_var_3_5
   - 276 z2D_3_5 >= -275.001
 EMIB_top_overlap_down_3_5: EMIB_h_var_3_5 - y_grid_var_5
   + EMIB_y_grid_var_3_5 - 276 z2D_3_5 >= -275.001
 vertical_up_dist_lb_3_5: - h_var_5 + y_grid_var_3 - y_grid_var_5
   - 276 z2U_3_5 >= -276
 EMIB_bottom_overlap_up_3_5: h_var_5 + y_grid_var_5 - EMIB_y_grid_var_3_5
   - 276 z2U_3_5 >= -275.001
 EMIB_top_overlap_up_3_5: EMIB_h_var_3_5 - y_grid_var_3
   + EMIB_y_grid_var_3_5 - 276 z2U_3_5 >= -275.001
 shared_yi_ub1_3_5: h_var_3 - EMIB_h_var_3_5 + y_grid_var_3
   - EMIB_y_grid_var_3_5 - 276 z1_3_5 >= -276
 shared_yi_ub2_3_5: y_grid_var_3 - EMIB_y_grid_var_3_5 + 276 z1_3_5 <= 276
 shared_yj_ub1_3_5: h_var_5 - EMIB_h_var_3_5 + y_grid_var_5
   - EMIB_y_grid_var_3_5 - 276 z1_3_5 >= -276
 shared_yj_ub2_3_5: y_grid_var_5 - EMIB_y_grid_var_3_5 + 276 z1_3_5 <= 276
 shared_xi_ub1_3_5: w_var_3 - EMIB_w_var_3_5 + x_grid_var_3
   - EMIB_x_grid_var_3_5 - 276 z2_3_5 >= -276
 shared_xi_ub2_3_5: x_grid_var_3 - EMIB_x_grid_var_3_5 + 276 z2_3_5 <= 276
 shared_xj_ub1_3_5: w_var_5 - EMIB_w_var_3_5 + x_grid_var_5
   - EMIB_x_grid_var_3_5 - 276 z2_3_5 >= -276
 shared_xj_ub2_3_5: x_grid_var_5 - EMIB_x_grid_var_3_5 + 276 z2_3_5 <= 276
 must_adjacent_sb_4_5: z1_4_5 + z2_4_5 = 1
 horizontal_direction_sb_4_5: - z1_4_5 + z1L_4_5 + z1R_4_5 = 0
 vertical_direction_sb_4_5: - z2_4_5 + z2D_4_5 + z2U_4_5 = 0
 EMIB_rotate_eq_z2_4_5: r_EMIB_4_5 - z2_4_5 = 0
 horizontal_left_dist_lb_4_5: - w_var_4 - x_grid_var_4 + x_grid_var_5
   - 276 z1L_4_5 >= -276
 EMIB_left_overlap_4_5: w_var_4 + x_grid_var_4 - EMIB_x_grid_var_4_5
   - 276 z1L_4_5 >= -275.001
 EMIB_right_overlap_4_5: EMIB_w_var_4_5 - x_grid_var_5
   + EMIB_x_grid_var_4_5 - 276 z1L_4_5 >= -275.001
 horizontal_right_dist_lb_4_5: - w_var_5 + x_grid_var_4 - x_grid_var_5
   - 276 z1R_4_5 >= -276
 EMIB_left_overlap_right_4_5: w_var_5 + x_grid_var_5 - EMIB_x_grid_var_4_5
   - 276 z1R_4_5 >= -275.001
 EMIB_right_overlap_right_4_5: EMIB_w_var_4_5 - x_grid_var_4
   + EMIB_x_grid_var_4_5 - 276 z1R_4_5 >= -275.001
 vertical_down_dist_lb_4_5: - h_var_4 - y_grid_var_4 + y_grid_var_5
   - 276 z2D_4_5 >= -276
 EMIB_bottom_overlap_down_4_5: h_var_4 + y_grid_var_4 - EMIB_y_grid_var_4_5
   - 276 z2D_4_5 >= -275.001
 EMIB_top_overlap_down_4_5: EMIB_h_var_4_5 - y_grid_var_5
   + EMIB_y_grid_var_4_5 - 276 z2D_4_5 >= -275.001
 vertical_up_dist_lb_4_5: - h_var_5 + y_grid_var_4 - y_grid_var_5
   - 276 z2U_4_5 >= -276
 EMIB_bottom_overlap_up_4_5: h_var_5 + y_grid_var_5 - EMIB_y_grid_var_4_5
   - 276 z2U_4_5 >= -275.001
 EMIB_top_overlap_up_4_5: EMIB_h_var_4_5 - y_grid_var_4
   + EMIB_y_grid_var_4_5 - 276 z2U_4_5 >= -275.001
 shared_yi_ub1_4_5: h_var_4 - EMIB_h_var_4_5 + y_grid_var_4
   - EMIB_y_grid_var_4_5 - 276 z1_4_5 >= -276
 shared_yi_ub2_4_5: y_grid_var_4 - EMIB_y_grid_var_4_5 + 276 z1_4_5 <= 276
 shared_yj_ub1_4_5: h_var_5 - EMIB_h_var_4_5 + y_grid_var_5
   - EMIB_y_grid_var_4_5 - 276 z1_4_5 >= -276
 shared_yj_ub2_4_5: y_grid_var_5 - EMIB_y_grid_var_4_5 + 276 z1_4_5 <= 276
 shared_xi_ub1_4_5: w_var_4 - EMIB_w_var_4_5 + x_grid_var_4
   - EMIB_x_grid_var_4_5 - 276 z2_4_5 >= -276
 shared_xi_ub2_4_5: x_grid_var_4 - EMIB_x_grid_var_4_5 + 276 z2_4_5 <= 276
 shared_xj_ub1_4_5: w_var_5 - EMIB_w_var_4_5 + x_grid_var_5
   - EMIB_x_grid_var_4_5 - 276 z2_4_5 >= -276
 shared_xj_ub2_4_5: x_grid_var_5 - EMIB_x_grid_var_4_5 + 276 z2_4_5 <= 276
 must_adjacent_sb_4_6: z1_4_6 + z2_4_6 = 1
 horizontal_direction_sb_4_6: - z1_4_6 + z1L_4_6 + z1R_4_6 = 0
 vertical_direction_sb_4_6: - z2_4_6 + z2D_4_6 + z2U_4_6 = 0
 EMIB_rotate_eq_z2_4_6: r_EMIB_4_6 - z2_4_6 = 0
 horizontal_left_dist_lb_4_6: - w_var_4 - x_grid_var_4 + x_grid_var_6
   - 276 z1L_4_6 >= -276
 EMIB_left_overlap_4_6: w_var_4 + x_grid_var_4 - EMIB_x_grid_var_4_6
   - 276 z1L_4_6 >= -275.001
 EMIB_right_overlap_4_6: EMIB_w_var_4_6 - x_grid_var_6
   + EMIB_x_grid_var_4_6 - 276 z1L_4_6 >= -275.001
 horizontal_right_dist_lb_4_6: - w_var_6 + x_grid_var_4 - x_grid_var_6
   - 276 z1R_4_6 >= -276
 EMIB_left_overlap_right_4_6: w_var_6 + x_grid_var_6 - EMIB_x_grid_var_4_6
   - 276 z1R_4_6 >= -275.001
 EMIB_right_overlap_right_4_6: EMIB_w_var_4_6 - x_grid_var_4
   + EMIB_x_grid_var_4_6 - 276 z1R_4_6 >= -275.001
 vertical_down_dist_lb_4_6: - h_var_4 - y_grid_var_4 + y_grid_var_6
   - 276 z2D_4_6 >= -276
 EMIB_bottom_overlap_down_4_6: h_var_4 + y_grid_var_4 - EMIB_y_grid_var_4_6
   - 276 z2D_4_6 >= -275.001
 EMIB_top_overlap_down_4_6: EMIB_h_var_4_6 - y_grid_var_6
   + EMIB_y_grid_var_4_6 - 276 z2D_4_6 >= -275.001
 vertical_up_dist_lb_4_6: - h_var_6 + y_grid_var_4 - y_grid_var_6
   - 276 z2U_4_6 >= -276
 EMIB_bottom_overlap_up_4_6: h_var_6 + y_grid_var_6 - EMIB_y_grid_var_4_6
   - 276 z2U_4_6 >= -275.001
 EMIB_top_overlap_up_4_6: EMIB_h_var_4_6 - y_grid_var_4
   + EMIB_y_grid_var_4_6 - 276 z2U_4_6 >= -275.001
 shared_yi_ub1_4_6: h_var_4 - EMIB_h_var_4_6 + y_grid_var_4
   - EMIB_y_grid_var_4_6 - 276 z1_4_6 >= -276
 shared_yi_ub2_4_6: y_grid_var_4 - EMIB_y_grid_var_4_6 + 276 z1_4_6 <= 276
 shared_yj_ub1_4_6: h_var_6 - EMIB_h_var_4_6 + y_grid_var_6
   - EMIB_y_grid_var_4_6 - 276 z1_4_6 >= -276
 shared_yj_ub2_4_6: y_grid_var_6 - EMIB_y_grid_var_4_6 + 276 z1_4_6 <= 276
 shared_xi_ub1_4_6: w_var_4 - EMIB_w_var_4_6 + x_grid_var_4
   - EMIB_x_grid_var_4_6 - 276 z2_4_6 >= -276
 shared_xi_ub2_4_6: x_grid_var_4 - EMIB_x_grid_var_4_6 + 276 z2_4_6 <= 276
 shared_xj_ub1_4_6: w_var_6 - EMIB_w_var_4_6 + x_grid_var_6
   - EMIB_x_grid_var_4_6 - 276 z2_4_6 >= -276
 shared_xj_ub2_4_6: x_grid_var_6 - EMIB_x_grid_var_4_6 + 276 z2_4_6 <= 276
 non_overlap_any_0_1: p_left_0_1 + p_right_0_1 + p_down_0_1 + p_up_0_1
   >= 1
 non_overlap_left_0_1: w_var_0 + x_grid_var_0 - x_grid_var_1
   + 276 p_left_0_1 <= 276
 non_overlap_left_rev_0_1: - w_var_0 - x_grid_var_0 + x_grid_var_1
   - 276 p_left_0_1 <= 0
 non_overlap_right_0_1: w_var_1 - x_grid_var_0 + x_grid_var_1
   + 276 p_right_0_1 <= 276
 non_overlap_right_rev_0_1: - w_var_1 + x_grid_var_0 - x_grid_var_1
   - 276 p_right_0_1 <= 0
 non_overlap_down_0_1: h_var_0 + y_grid_var_0 - y_grid_var_1
   + 276 p_down_0_1 <= 276
 non_overlap_down_rev_0_1: - h_var_0 - y_grid_var_0 + y_grid_var_1
   - 276 p_down_0_1 <= 0
 non_overlap_up_0_1: h_var_1 - y_grid_var_0 + y_grid_var_1 + 276 p_up_0_1
   <= 276
 non_overlap_up_rev_0_1: - h_var_1 + y_grid_var_0 - y_grid_var_1
   - 276 p_up_0_1 <= 0
 non_overlap_any_0_2: p_left_0_2 + p_right_0_2 + p_down_0_2 + p_up_0_2
   >= 1
 non_overlap_left_0_2: w_var_0 + x_grid_var_0 - x_grid_var_2
   + 276 p_left_0_2 <= 276
 non_overlap_left_rev_0_2: - w_var_0 - x_grid_var_0 + x_grid_var_2
   - 276 p_left_0_2 <= 0
 non_overlap_right_0_2: w_var_2 - x_grid_var_0 + x_grid_var_2
   + 276 p_right_0_2 <= 276
 non_overlap_right_rev_0_2: - w_var_2 + x_grid_var_0 - x_grid_var_2
   - 276 p_right_0_2 <= 0
 non_overlap_down_0_2: h_var_0 + y_grid_var_0 - y_grid_var_2
   + 276 p_down_0_2 <= 276
 non_overlap_down_rev_0_2: - h_var_0 - y_grid_var_0 + y_grid_var_2
   - 276 p_down_0_2 <= 0
 non_overlap_up_0_2: h_var_2 - y_grid_var_0 + y_grid_var_2 + 276 p_up_0_2
   <= 276
 non_overlap_up_rev_0_2: - h_var_2 + y_grid_var_0 - y_grid_var_2
   - 276 p_up_0_2 <= 0
 non_overlap_any_0_3: p_left_0_3 + p_right_0_3 + p_down_0_3 + p_up_0_3
   >= 1
 non_overlap_left_0_3: w_var_0 + x_grid_var_0 - x_grid_var_3
   + 276 p_left_0_3 <= 276
 non_overlap_left_rev_0_3: - w_var_0 - x_grid_var_0 + x_grid_var_3
   - 276 p_left_0_3 <= 0
 non_overlap_right_0_3: w_var_3 - x_grid_var_0 + x_grid_var_3
   + 276 p_right_0_3 <= 276
 non_overlap_right_rev_0_3: - w_var_3 + x_grid_var_0 - x_grid_var_3
   - 276 p_right_0_3 <= 0
 non_overlap_down_0_3: h_var_0 + y_grid_var_0 - y_grid_var_3
   + 276 p_down_0_3 <= 276
 non_overlap_down_rev_0_3: - h_var_0 - y_grid_var_0 + y_grid_var_3
   - 276 p_down_0_3 <= 0
 non_overlap_up_0_3: h_var_3 - y_grid_var_0 + y_grid_var_3 + 276 p_up_0_3
   <= 276
 non_overlap_up_rev_0_3: - h_var_3 + y_grid_var_0 - y_grid_var_3
   - 276 p_up_0_3 <= 0
 non_overlap_any_0_4: p_left_0_4 + p_right_0_4 + p_down_0_4 + p_up_0_4
   >= 1
 non_overlap_left_0_4: w_var_0 + x_grid_var_0 - x_grid_var_4
   + 276 p_left_0_4 <= 276
 non_overlap_left_rev_0_4: - w_var_0 - x_grid_var_0 + x_grid_var_4
   - 276 p_left_0_4 <= 0
 non_overlap_right_0_4: w_var_4 - x_grid_var_0 + x_grid_var_4
   + 276 p_right_0_4 <= 276
 non_overlap_right_rev_0_4: - w_var_4 + x_grid_var_0 - x_grid_var_4
   - 276 p_right_0_4 <= 0
 non_overlap_down_0_4: h_var_0 + y_grid_var_0 - y_grid_var_4
   + 276 p_down_0_4 <= 276
 non_overlap_down_rev_0_4: - h_var_0 - y_grid_var_0 + y_grid_var_4
   - 276 p_down_0_4 <= 0
 non_overlap_up_0_4: h_var_4 - y_grid_var_0 + y_grid_var_4 + 276 p_up_0_4
   <= 276
 non_overlap_up_rev_0_4: - h_var_4 + y_grid_var_0 - y_grid_var_4
   - 276 p_up_0_4 <= 0
 non_overlap_any_0_5: p_left_0_5 + p_right_0_5 + p_down_0_5 + p_up_0_5
   >= 1
 non_overlap_left_0_5: w_var_0 + x_grid_var_0 - x_grid_var_5
   + 276 p_left_0_5 <= 276
 non_overlap_left_rev_0_5: - w_var_0 - x_grid_var_0 + x_grid_var_5
   - 276 p_left_0_5 <= 0
 non_overlap_right_0_5: w_var_5 - x_grid_var_0 + x_grid_var_5
   + 276 p_right_0_5 <= 276
 non_overlap_right_rev_0_5: - w_var_5 + x_grid_var_0 - x_grid_var_5
   - 276 p_right_0_5 <= 0
 non_overlap_down_0_5: h_var_0 + y_grid_var_0 - y_grid_var_5
   + 276 p_down_0_5 <= 276
 non_overlap_down_rev_0_5: - h_var_0 - y_grid_var_0 + y_grid_var_5
   - 276 p_down_0_5 <= 0
 non_overlap_up_0_5: h_var_5 - y_grid_var_0 + y_grid_var_5 + 276 p_up_0_5
   <= 276
 non_overlap_up_rev_0_5: - h_var_5 + y_grid_var_0 - y_grid_var_5
   - 276 p_up_0_5 <= 0
 non_overlap_any_0_6: p_left_0_6 + p_right_0_6 + p_down_0_6 + p_up_0_6
   >= 1
 non_overlap_left_0_6: w_var_0 + x_grid_var_0 - x_grid_var_6
   + 276 p_left_0_6 <= 276
 non_overlap_left_rev_0_6: - w_var_0 - x_grid_var_0 + x_grid_var_6
   - 276 p_left_0_6 <= 0
 non_overlap_right_0_6: w_var_6 - x_grid_var_0 + x_grid_var_6
   + 276 p_right_0_6 <= 276
 non_overlap_right_rev_0_6: - w_var_6 + x_grid_var_0 - x_grid_var_6
   - 276 p_right_0_6 <= 0
 non_overlap_down_0_6: h_var_0 + y_grid_var_0 - y_grid_var_6
   + 276 p_down_0_6 <= 276
 non_overlap_down_rev_0_6: - h_var_0 - y_grid_var_0 + y_grid_var_6
   - 276 p_down_0_6 <= 0
 non_overlap_up_0_6: h_var_6 - y_grid_var_0 + y_grid_var_6 + 276 p_up_0_6
   <= 276
 non_overlap_up_rev_0_6: - h_var_6 + y_grid_var_0 - y_grid_var_6
   - 276 p_up_0_6 <= 0
 non_overlap_any_1_2: p_left_1_2 + p_right_1_2 + p_down_1_2 + p_up_1_2
   >= 1
 non_overlap_left_1_2: w_var_1 + x_grid_var_1 - x_grid_var_2
   + 276 p_left_1_2 <= 276
 non_overlap_left_rev_1_2: - w_var_1 - x_grid_var_1 + x_grid_var_2
   - 276 p_left_1_2 <= 0
 non_overlap_right_1_2: w_var_2 - x_grid_var_1 + x_grid_var_2
   + 276 p_right_1_2 <= 276
 non_overlap_right_rev_1_2: - w_var_2 + x_grid_var_1 - x_grid_var_2
   - 276 p_right_1_2 <= 0
 non_overlap_down_1_2: h_var_1 + y_grid_var_1 - y_grid_var_2
   + 276 p_down_1_2 <= 276
 non_overlap_down_rev_1_2: - h_var_1 - y_grid_var_1 + y_grid_var_2
   - 276 p_down_1_2 <= 0
 non_overlap_up_1_2: h_var_2 - y_grid_var_1 + y_grid_var_2 + 276 p_up_1_2
   <= 276
 non_overlap_up_rev_1_2: - h_var_2 + y_grid_var_1 - y_grid_var_2
   - 276 p_up_1_2 <= 0
 non_overlap_any_1_3: p_left_1_3 + p_right_1_3 + p_down_1_3 + p_up_1_3
   >= 1
 non_overlap_left_1_3: w_var_1 + x_grid_var_1 - x_grid_var_3
   + 276 p_left_1_3 <= 276
 non_overlap_left_rev_1_3: - w_var_1 - x_grid_var_1 + x_grid_var_3
   - 276 p_left_1_3 <= 0
 non_overlap_right_1_3: w_var_3 - x_grid_var_1 + x_grid_var_3
   + 276 p_right_1_3 <= 276
 non_overlap_right_rev_1_3: - w_var_3 + x_grid_var_1 - x_grid_var_3
   - 276 p_right_1_3 <= 0
 non_overlap_down_1_3: h_var_1 + y_grid_var_1 - y_grid_var_3
   + 276 p_down_1_3 <= 276
 non_overlap_down_rev_1_3: - h_var_1 - y_grid_var_1 + y_grid_var_3
   - 276 p_down_1_3 <= 0
 non_overlap_up_1_3: h_var_3 - y_grid_var_1 + y_grid_var_3 + 276 p_up_1_3
   <= 276
 non_overlap_up_rev_1_3: - h_var_3 + y_grid_var_1 - y_grid_var_3
   - 276 p_up_1_3 <= 0
 non_overlap_any_1_4: p_left_1_4 + p_right_1_4 + p_down_1_4 + p_up_1_4
   >= 1
 non_overlap_left_1_4: w_var_1 + x_grid_var_1 - x_grid_var_4
   + 276 p_left_1_4 <= 276
 non_overlap_left_rev_1_4: - w_var_1 - x_grid_var_1 + x_grid_var_4
   - 276 p_left_1_4 <= 0
 non_overlap_right_1_4: w_var_4 - x_grid_var_1 + x_grid_var_4
   + 276 p_right_1_4 <= 276
 non_overlap_right_rev_1_4: - w_var_4 + x_grid_var_1 - x_grid_var_4
   - 276 p_right_1_4 <= 0
 non_overlap_down_1_4: h_var_1 + y_grid_var_1 - y_grid_var_4
   + 276 p_down_1_4 <= 276
 non_overlap_down_rev_1_4: - h_var_1 - y_grid_var_1 + y_grid_var_4
   - 276 p_down_1_4 <= 0
 non_overlap_up_1_4: h_var_4 - y_grid_var_1 + y_grid_var_4 + 276 p_up_1_4
   <= 276
 non_overlap_up_rev_1_4: - h_var_4 + y_grid_var_1 - y_grid_var_4
   - 276 p_up_1_4 <= 0
 non_overlap_any_1_5: p_left_1_5 + p_right_1_5 + p_down_1_5 + p_up_1_5
   >= 1
 non_overlap_left_1_5: w_var_1 + x_grid_var_1 - x_grid_var_5
   + 276 p_left_1_5 <= 276
 non_overlap_left_rev_1_5: - w_var_1 - x_grid_var_1 + x_grid_var_5
   - 276 p_left_1_5 <= 0
 non_overlap_right_1_5: w_var_5 - x_grid_var_1 + x_grid_var_5
   + 276 p_right_1_5 <= 276
 non_overlap_right_rev_1_5: - w_var_5 + x_grid_var_1 - x_grid_var_5
   - 276 p_right_1_5 <= 0
 non_overlap_down_1_5: h_var_1 + y_grid_var_1 - y_grid_var_5
   + 276 p_down_1_5 <= 276
 non_overlap_down_rev_1_5: - h_var_1 - y_grid_var_1 + y_grid_var_5
   - 276 p_down_1_5 <= 0
 non_overlap_up_1_5: h_var_5 - y_grid_var_1 + y_grid_var_5 + 276 p_up_1_5
   <= 276
 non_overlap_up_rev_1_5: - h_var_5 + y_grid_var_1 - y_grid_var_5
   - 276 p_up_1_5 <= 0
 non_overlap_any_1_6: p_left_1_6 + p_right_1_6 + p_down_1_6 + p_up_1_6
   >= 1
 non_overlap_left_1_6: w_var_1 + x_grid_var_1 - x_grid_var_6
   + 276 p_left_1_6 <= 276
 non_overlap_left_rev_1_6: - w_var_1 - x_grid_var_1 + x_grid_var_6
   - 276 p_left_1_6 <= 0
 non_overlap_right_1_6: w_var_6 - x_grid_var_1 + x_grid_var_6
   + 276 p_right_1_6 <= 276
 non_overlap_right_rev_1_6: - w_var_6 + x_grid_var_1 - x_grid_var_6
   - 276 p_right_1_6 <= 0
 non_overlap_down_1_6: h_var_1 + y_grid_var_1 - y_grid_var_6
   + 276 p_down_1_6 <= 276
 non_overlap_down_rev_1_6: - h_var_1 - y_grid_var_1 + y_grid_var_6
   - 276 p_down_1_6 <= 0
 non_overlap_up_1_6: h_var_6 - y_grid_var_1 + y_grid_var_6 + 276 p_up_1_6
   <= 276
 non_overlap_up_rev_1_6: - h_var_6 + y_grid_var_1 - y_grid_var_6
   - 276 p_up_1_6 <= 0
 non_overlap_any_2_3: p_left_2_3 + p_right_2_3 + p_down_2_3 + p_up_2_3
   >= 1
 non_overlap_left_2_3: w_var_2 + x_grid_var_2 - x_grid_var_3
   + 276 p_left_2_3 <= 276
 non_overlap_left_rev_2_3: - w_var_2 - x_grid_var_2 + x_grid_var_3
   - 276 p_left_2_3 <= 0
 non_overlap_right_2_3: w_var_3 - x_grid_var_2 + x_grid_var_3
   + 276 p_right_2_3 <= 276
 non_overlap_right_rev_2_3: - w_var_3 + x_grid_var_2 - x_grid_var_3
   - 276 p_right_2_3 <= 0
 non_overlap_down_2_3: h_var_2 + y_grid_var_2 - y_grid_var_3
   + 276 p_down_2_3 <= 276
 non_overlap_down_rev_2_3: - h_var_2 - y_grid_var_2 + y_grid_var_3
   - 276 p_down_2_3 <= 0
 non_overlap_up_2_3: h_var_3 - y_grid_var_2 + y_grid_var_3 + 276 p_up_2_3
   <= 276
 non_overlap_up_rev_2_3: - h_var_3 + y_grid_var_2 - y_grid_var_3
   - 276 p_up_2_3 <= 0
 non_overlap_any_2_4: p_left_2_4 + p_right_2_4 + p_down_2_4 + p_up_2_4
   >= 1
 non_overlap_left_2_4: w_var_2 + x_grid_var_2 - x_grid_var_4
   + 276 p_left_2_4 <= 276
 non_overlap_left_rev_2_4: - w_var_2 - x_grid_var_2 + x_grid_var_4
   - 276 p_left_2_4 <= 0
 non_overlap_right_2_4: w_var_4 - x_grid_var_2 + x_grid_var_4
   + 276 p_right_2_4 <= 276
 non_overlap_right_rev_2_4: - w_var_4 + x_grid_var_2 - x_grid_var_4
   - 276 p_right_2_4 <= 0
 non_overlap_down_2_4: h_var_2 + y_grid_var_2 - y_grid_var_4
   + 276 p_down_2_4 <= 276
 non_overlap_down_rev_2_4: - h_var_2 - y_grid_var_2 + y_grid_var_4
   - 276 p_down_2_4 <= 0
 non_overlap_up_2_4: h_var_4 - y_grid_var_2 + y_grid_var_4 + 276 p_up_2_4
   <= 276
 non_overlap_up_rev_2_4: - h_var_4 + y_grid_var_2 - y_grid_var_4
   - 276 p_up_2_4 <= 0
 non_overlap_any_2_5: p_left_2_5 + p_right_2_5 + p_down_2_5 + p_up_2_5
   >= 1
 non_overlap_left_2_5: w_var_2 + x_grid_var_2 - x_grid_var_5
   + 276 p_left_2_5 <= 276
 non_overlap_left_rev_2_5: - w_var_2 - x_grid_var_2 + x_grid_var_5
   - 276 p_left_2_5 <= 0
 non_overlap_right_2_5: w_var_5 - x_grid_var_2 + x_grid_var_5
   + 276 p_right_2_5 <= 276
 non_overlap_right_rev_2_5: - w_var_5 + x_grid_var_2 - x_grid_var_5
   - 276 p_right_2_5 <= 0
 non_overlap_down_2_5: h_var_2 + y_grid_var_2 - y_grid_var_5
   + 276 p_down_2_5 <= 276
 non_overlap_down_rev_2_5: - h_var_2 - y_grid_var_2 + y_grid_var_5
   - 276 p_down_2_5 <= 0
 non_overlap_up_2_5: h_var_5 - y_grid_var_2 + y_grid_var_5 + 276 p_up_2_5
   <= 276
 non_overlap_up_rev_2_5: - h_var_5 + y_grid_var_2 - y_grid_var_5
   - 276 p_up_2_5 <= 0
 non_overlap_any_2_6: p_left_2_6 + p_right_2_6 + p_down_2_6 + p_up_2_6
   >= 1
 non_overlap_left_2_6: w_var_2 + x_grid_var_2 - x_grid_var_6
   + 276 p_left_2_6 <= 276
 non_overlap_left_rev_2_6: - w_var_2 - x_grid_var_2 + x_grid_var_6
   - 276 p_left_2_6 <= 0
 non_overlap_right_2_6: w_var_6 - x_grid_var_2 + x_grid_var_6
   + 276 p_right_2_6 <= 276
 non_overlap_right_rev_2_6: - w_var_6 + x_grid_var_2 - x_grid_var_6
   - 276 p_right_2_6 <= 0
 non_overlap_down_2_6: h_var_2 + y_grid_var_2 - y_grid_var_6
   + 276 p_down_2_6 <= 276
 non_overlap_down_rev_2_6: - h_var_2 - y_grid_var_2 + y_grid_var_6
   - 276 p_down_2_6 <= 0
 non_overlap_up_2_6: h_var_6 - y_grid_var_2 + y_grid_var_6 + 276 p_up_2_6
   <= 276
 non_overlap_up_rev_2_6: - h_var_6 + y_grid_var_2 - y_grid_var_6
   - 276 p_up_2_6 <= 0
 non_overlap_any_3_4: p_left_3_4 + p_right_3_4 + p_down_3_4 + p_up_3_4
   >= 1
 non_overlap_left_3_4: w_var_3 + x_grid_var_3 - x_grid_var_4
   + 276 p_left_3_4 <= 276
 non_overlap_left_rev_3_4: - w_var_3 - x_grid_var_3 + x_grid_var_4
   - 276 p_left_3_4 <= 0
 non_overlap_right_3_4: w_var_4 - x_grid_var_3 + x_grid_var_4
   + 276 p_right_3_4 <= 276
 non_overlap_right_rev_3_4: - w_var_4 + x_grid_var_3 - x_grid_var_4
   - 276 p_right_3_4 <= 0
 non_overlap_down_3_4: h_var_3 + y_grid_var_3 - y_grid_var_4
   + 276 p_down_3_4 <= 276
 non_overlap_down_rev_3_4: - h_var_3 - y_grid_var_3 + y_grid_var_4
   - 276 p_down_3_4 <= 0
 non_overlap_up_3_4: h_var_4 - y_grid_var_3 + y_grid_var_4 + 276 p_up_3_4
   <= 276
 non_overlap_up_rev_3_4: - h_var_4 + y_grid_var_3 - y_grid_var_4
   - 276 p_up_3_4 <= 0
 non_overlap_any_3_5: p_left_3_5 + p_right_3_5 + p_down_3_5 + p_up_3_5
   >= 1
 non_overlap_left_3_5: w_var_3 + x_grid_var_3 - x_grid_var_5
   + 276 p_left_3_5 <= 276
 non_overlap_left_rev_3_5: - w_var_3 - x_grid_var_3 + x_grid_var_5
   - 276 p_left_3_5 <= 0
 non_overlap_right_3_5: w_var_5 - x_grid_var_3 + x_grid_var_5
   + 276 p_right_3_5 <= 276
 non_overlap_right_rev_3_5: - w_var_5 + x_grid_var_3 - x_grid_var_5
   - 276 p_right_3_5 <= 0
 non_overlap_down_3_5: h_var_3 + y_grid_var_3 - y_grid_var_5
   + 276 p_down_3_5 <= 276
 non_overlap_down_rev_3_5: - h_var_3 - y_grid_var_3 + y_grid_var_5
   - 276 p_down_3_5 <= 0
 non_overlap_up_3_5: h_var_5 - y_grid_var_3 + y_grid_var_5 + 276 p_up_3_5
   <= 276
 non_overlap_up_rev_3_5: - h_var_5 + y_grid_var_3 - y_grid_var_5
   - 276 p_up_3_5 <= 0
 non_overlap_any_3_6: p_left_3_6 + p_right_3_6 + p_down_3_6 + p_up_3_6
   >= 1
 non_overlap_left_3_6: w_var_3 + x_grid_var_3 - x_grid_var_6
   + 276 p_left_3_6 <= 276
 non_overlap_left_rev_3_6: - w_var_3 - x_grid_var_3 + x_grid_var_6
   - 276 p_left_3_6 <= 0
 non_overlap_right_3_6: w_var_6 - x_grid_var_3 + x_grid_var_6
   + 276 p_right_3_6 <= 276
 non_overlap_right_rev_3_6: - w_var_6 + x_grid_var_3 - x_grid_var_6
   - 276 p_right_3_6 <= 0
 non_overlap_down_3_6: h_var_3 + y_grid_var_3 - y_grid_var_6
   + 276 p_down_3_6 <= 276
 non_overlap_down_rev_3_6: - h_var_3 - y_grid_var_3 + y_grid_var_6
   - 276 p_down_3_6 <= 0
 non_overlap_up_3_6: h_var_6 - y_grid_var_3 + y_grid_var_6 + 276 p_up_3_6
   <= 276
 non_overlap_up_rev_3_6: - h_var_6 + y_grid_var_3 - y_grid_var_6
   - 276 p_up_3_6 <= 0
 non_overlap_any_4_5: p_left_4_5 + p_right_4_5 + p_down_4_5 + p_up_4_5
   >= 1
 non_overlap_left_4_5: w_var_4 + x_grid_var_4 - x_grid_var_5
   + 276 p_left_4_5 <= 276
 non_overlap_left_rev_4_5: - w_var_4 - x_grid_var_4 + x_grid_var_5
   - 276 p_left_4_5 <= 0
 non_overlap_right_4_5: w_var_5 - x_grid_var_4 + x_grid_var_5
   + 276 p_right_4_5 <= 276
 non_overlap_right_rev_4_5: - w_var_5 + x_grid_var_4 - x_grid_var_5
   - 276 p_right_4_5 <= 0
 non_overlap_down_4_5: h_var_4 + y_grid_var_4 - y_grid_var_5
   + 276 p_down_4_5 <= 276
 non_overlap_down_rev_4_5: - h_var_4 - y_grid_var_4 + y_grid_var_5
   - 276 p_down_4_5 <= 0
 non_overlap_up_4_5: h_var_5 - y_grid_var_4 + y_grid_var_5 + 276 p_up_4_5
   <= 276
 non_overlap_up_rev_4_5: - h_var_5 + y_grid_var_4 - y_grid_var_5
   - 276 p_up_4_5 <= 0
 non_overlap_any_4_6: p_left_4_6 + p_right_4_6 + p_down_4_6 + p_up_4_6
   >= 1
 non_overlap_left_4_6: w_var_4 + x_grid_var_4 - x_grid_var_6
   + 276 p_left_4_6 <= 276
 non_overlap_left_rev_4_6: - w_var_4 - x_grid_var_4 + x_grid_var_6
   - 276 p_left_4_6 <= 0
 non_overlap_right_4_6: w_var_6 - x_grid_var_4 + x_grid_var_6
   + 276 p_right_4_6 <= 276
 non_overlap_right_rev_4_6: - w_var_6 + x_grid_var_4 - x_grid_var_6
   - 276 p_right_4_6 <= 0
 non_overlap_down_4_6: h_var_4 + y_grid_var_4 - y_grid_var_6
   + 276 p_down_4_6 <= 276
 non_overlap_down_rev_4_6: - h_var_4 - y_grid_var_4 + y_grid_var_6
   - 276 p_down_4_6 <= 0
 non_overlap_up_4_6: h_var_6 - y_grid_var_4 + y_grid_var_6 + 276 p_up_4_6
   <= 276
 non_overlap_up_rev_4_6: - h_var_6 + y_grid_var_4 - y_grid_var_6
   - 276 p_up_4_6 <= 0
 non_overlap_any_5_6: p_left_5_6 + p_right_5_6 + p_down_5_6 + p_up_5_6
   >= 1
 non_overlap_left_5_6: w_var_5 + x_grid_var_5 - x_grid_var_6
   + 276 p_left_5_6 <= 276
 non_overlap_left_rev_5_6: - w_var_5 - x_grid_var_5 + x_grid_var_6
   - 276 p_left_5_6 <= 0
 non_overlap_right_5_6: w_var_6 - x_grid_var_5 + x_grid_var_6
   + 276 p_right_5_6 <= 276
 non_overlap_right_rev_5_6: - w_var_6 + x_grid_var_5 - x_grid_var_6
   - 276 p_right_5_6 <= 0
 non_overlap_down_5_6: h_var_5 + y_grid_var_5 - y_grid_var_6
   + 276 p_down_5_6 <= 276
 non_overlap_down_rev_5_6: - h_var_5 - y_grid_var_5 + y_grid_var_6
   - 276 p_down_5_6 <= 0
 non_overlap_up_5_6: h_var_6 - y_grid_var_5 + y_grid_var_6 + 276 p_up_5_6
   <= 276
 non_overlap_up_rev_5_6: - h_var_6 + y_grid_var_5 - y_grid_var_6
   - 276 p_up_5_6 <= 0
 EMIB_non_overlap_any_0_4_0_5: p_EMIB_left_0_4_0_5 + p_EMIB_right_0_4_0_5
   + p_EMIB_down_0_4_0_5 + p_EMIB_up_0_4_0_5 >= 1
 EMIB_non_overlap_left_0_4_0_5: EMIB_w_var_0_4 + EMIB_x_grid_var_0_4
   - EMIB_x_grid_var_0_5 + 276 p_EMIB_left_0_4_0_5 <= 276
 EMIB_non_overlap_left_rev_0_4_0_5: - EMIB_w_var_0_4 - EMIB_x_grid_var_0_4
   + EMIB_x_grid_var_0_5 - 276 p_EMIB_left_0_4_0_5 <= 0
 EMIB_non_overlap_right_0_4_0_5: EMIB_w_var_0_5 - EMIB_x_grid_var_0_4
   + EMIB_x_grid_var_0_5 + 276 p_EMIB_right_0_4_0_5 <= 276
 EMIB_non_overlap_right_rev_0_4_0_5: - EMIB_w_var_0_5 + EMIB_x_grid_var_0_4
   - EMIB_x_grid_var_0_5 - 276 p_EMIB_right_0_4_0_5 <= 0
 EMIB_non_overlap_down_0_4_0_5: EMIB_h_var_0_4 + EMIB_y_grid_var_0_4
   - EMIB_y_grid_var_0_5 + 276 p_EMIB_down_0_4_0_5 <= 276
 EMIB_non_overlap_down_rev_0_4_0_5: - EMIB_h_var_0_4 - EMIB_y_grid_var_0_4
   + EMIB_y_grid_var_0_5 - 276 p_EMIB_down_0_4_0_5 <= 0
 EMIB_non_overlap_up_0_4_0_5: EMIB_h_var_0_5 - EMIB_y_grid_var_0_4
   + EMIB_y_grid_var_0_5 + 276 p_EMIB_up_0_4_0_5 <= 276
 EMIB_non_overlap_up_rev_0_4_0_5: - EMIB_h_var_0_5 + EMIB_y_grid_var_0_4
   - EMIB_y_grid_var_0_5 - 276 p_EMIB_up_0_4_0_5 <= 0
 EMIB_non_overlap_any_0_4_0_6: p_EMIB_left_0_4_0_6 + p_EMIB_right_0_4_0_6
   + p_EMIB_down_0_4_0_6 + p_EMIB_up_0_4_0_6 >= 1
 EMIB_non_overlap_left_0_4_0_6: EMIB_w_var_0_4 + EMIB_x_grid_var_0_4
   - EMIB_x_grid_var_0_6 + 276 p_EMIB_left_0_4_0_6 <= 276
 EMIB_non_overlap_left_rev_0_4_0_6: - EMIB_w_var_0_4 - EMIB_x_grid_var_0_4
   + EMIB_x_grid_var_0_6 - 276 p_EMIB_left_0_4_0_6 <= 0
 EMIB_non_overlap_right_0_4_0_6: EMIB_w_var_0_6 - EMIB_x_grid_var_0_4
   + EMIB_x_grid_var_0_6 + 276 p_EMIB_right_0_4_0_6 <= 276
 EMIB_non_overlap_right_rev_0_4_0_6: - EMIB_w_var_0_6 + EMIB_x_grid_var_0_4
   - EMIB_x_grid_var_0_6 - 276 p_EMIB_right_0_4_0_6 <= 0
 EMIB_non_overlap_down_0_4_0_6: EMIB_h_var_0_4 + EMIB_y_grid_var_0_4
   - EMIB_y_grid_var_0_6 + 276 p_EMIB_down_0_4_0_6 <= 276
 EMIB_non_overlap_down_rev_0_4_0_6: - EMIB_h_var_0_4 - EMIB_y_grid_var_0_4
   + EMIB_y_grid_var_0_6 - 276 p_EMIB_down_0_4_0_6 <= 0
 EMIB_non_overlap_up_0_4_0_6: EMIB_h_var_0_6 - EMIB_y_grid_var_0_4
   + EMIB_y_grid_var_0_6 + 276 p_EMIB_up_0_4_0_6 <= 276
 EMIB_non_overlap_up_rev_0_4_0_6: - EMIB_h_var_0_6 + EMIB_y_grid_var_0_4
   - EMIB_y_grid_var_0_6 - 276 p_EMIB_up_0_4_0_6 <= 0
 EMIB_non_overlap_any_0_4_2_4: p_EMIB_left_0_4_2_4 + p_EMIB_right_0_4_2_4
   + p_EMIB_down_0_4_2_4 + p_EMIB_up_0_4_2_4 >= 1
 EMIB_non_overlap_left_0_4_2_4: EMIB_w_var_0_4 + EMIB_x_grid_var_0_4
   - EMIB_x_grid_var_2_4 + 276 p_EMIB_left_0_4_2_4 <= 276
 EMIB_non_overlap_left_rev_0_4_2_4: - EMIB_w_var_0_4 - EMIB_x_grid_var_0_4
   + EMIB_x_grid_var_2_4 - 276 p_EMIB_left_0_4_2_4 <= 0
 EMIB_non_overlap_right_0_4_2_4: EMIB_w_var_2_4 - EMIB_x_grid_var_0_4
   + EMIB_x_grid_var_2_4 + 276 p_EMIB_right_0_4_2_4 <= 276
 EMIB_non_overlap_right_rev_0_4_2_4: - EMIB_w_var_2_4 + EMIB_x_grid_var_0_4
   - EMIB_x_grid_var_2_4 - 276 p_EMIB_right_0_4_2_4 <= 0
 EMIB_non_overlap_down_0_4_2_4: EMIB_h_var_0_4 + EMIB_y_grid_var_0_4
   - EMIB_y_grid_var_2_4 + 276 p_EMIB_down_0_4_2_4 <= 276
 EMIB_non_overlap_down_rev_0_4_2_4: - EMIB_h_var_0_4 - EMIB_y_grid_var_0_4
   + EMIB_y_grid_var_2_4 - 276 p_EMIB_down_0_4_2_4 <= 0
 EMIB_non_overlap_up_0_4_2_4: EMIB_h_var_2_4 - EMIB_y_grid_var_0_4
   + EMIB_y_grid_var_2_4 + 276 p_EMIB_up_0_4_2_4 <= 276
 EMIB_non_overlap_up_rev_0_4_2_4: - EMIB_h_var_2_4 + EMIB_y_grid_var_0_4
   - EMIB_y_grid_var_2_4 - 276 p_EMIB_up_0_4_2_4 <= 0
 EMIB_non_overlap_any_0_4_3_4: p_EMIB_left_0_4_3_4 + p_EMIB_right_0_4_3_4
   + p_EMIB_down_0_4_3_4 + p_EMIB_up_0_4_3_4 >= 1
 EMIB_non_overlap_left_0_4_3_4: EMIB_w_var_0_4 + EMIB_x_grid_var_0_4
   - EMIB_x_grid_var_3_4 + 276 p_EMIB_left_0_4_3_4 <= 276
 EMIB_non_overlap_left_rev_0_4_3_4: - EMIB_w_var_0_4 - EMIB_x_grid_var_0_4
   + EMIB_x_grid_var_3_4 - 276 p_EMIB_left_0_4_3_4 <= 0
 EMIB_non_overlap_right_0_4_3_4: EMIB_w_var_3_4 - EMIB_x_grid_var_0_4
   + EMIB_x_grid_var_3_4 + 276 p_EMIB_right_0_4_3_4 <= 276
 EMIB_non_overlap_right_rev_0_4_3_4: - EMIB_w_var_3_4 + EMIB_x_grid_var_0_4
   - EMIB_x_grid_var_3_4 - 276 p_EMIB_right_0_4_3_4 <= 0
 EMIB_non_overlap_down_0_4_3_4: EMIB_h_var_0_4 + EMIB_y_grid_var_0_4
   - EMIB_y_grid_var_3_4 + 276 p_EMIB_down_0_4_3_4 <= 276
 EMIB_non_overlap_down_rev_0_4_3_4: - EMIB_h_var_0_4 - EMIB_y_grid_var_0_4
   + EMIB_y_grid_var_3_4 - 276 p_EMIB_down_0_4_3_4 <= 0
 EMIB_non_overlap_up_0_4_3_4: EMIB_h_var_3_4 - EMIB_y_grid_var_0_4
   + EMIB_y_grid_var_3_4 + 276 p_EMIB_up_0_4_3_4 <= 276
 EMIB_non_overlap_up_rev_0_4_3_4: - EMIB_h_var_3_4 + EMIB_y_grid_var_0_4
   - EMIB_y_grid_var_3_4 - 276 p_EMIB_up_0_4_3_4 <= 0
 EMIB_non_overlap_any_0_4_4_5: p_EMIB_left_0_4_4_5 + p_EMIB_right_0_4_4_5
   + p_EMIB_down_0_4_4_5 + p_EMIB_up_0_4_4_5 >= 1
 EMIB_non_overlap_left_0_4_4_5: EMIB_w_var_0_4 + EMIB_x_grid_var_0_4
   - EMIB_x_grid_var_4_5 + 276 p_EMIB_left_0_4_4_5 <= 276
 EMIB_non_overlap_left_rev_0_4_4_5: - EMIB_w_var_0_4 - EMIB_x_grid_var_0_4
   + EMIB_x_grid_var_4_5 - 276 p_EMIB_left_0_4_4_5 <= 0
 EMIB_non_overlap_right_0_4_4_5: EMIB_w_var_4_5 - EMIB_x_grid_var_0_4
   + EMIB_x_grid_var_4_5 + 276 p_EMIB_right_0_4_4_5 <= 276
 EMIB_non_overlap_right_rev_0_4_4_5: - EMIB_w_var_4_5 + EMIB_x_grid_var_0_4
   - EMIB_x_grid_var_4_5 - 276 p_EMIB_right_0_4_4_5 <= 0
 EMIB_non_overlap_down_0_4_4_5: EMIB_h_var_0_4 + EMIB_y_grid_var_0_4
   - EMIB_y_grid_var_4_5 + 276 p_EMIB_down_0_4_4_5 <= 276
 EMIB_non_overlap_down_rev_0_4_4_5: - EMIB_h_var_0_4 - EMIB_y_grid_var_0_4
   + EMIB_y_grid_var_4_5 - 276 p_EMIB_down_0_4_4_5 <= 0
 EMIB_non_overlap_up_0_4_4_5: EMIB_h_var_4_5 - EMIB_y_grid_var_0_4
   + EMIB_y_grid_var_4_5 + 276 p_EMIB_up_0_4_4_5 <= 276
 EMIB_non_overlap_up_rev_0_4_4_5: - EMIB_h_var_4_5 + EMIB_y_grid_var_0_4
   - EMIB_y_grid_var_4_5 - 276 p_EMIB_up_0_4_4_5 <= 0
 EMIB_non_overlap_any_0_4_4_6: p_EMIB_left_0_4_4_6 + p_EMIB_right_0_4_4_6
   + p_EMIB_down_0_4_4_6 + p_EMIB_up_0_4_4_6 >= 1
 EMIB_non_overlap_left_0_4_4_6: EMIB_w_var_0_4 + EMIB_x_grid_var_0_4
   - EMIB_x_grid_var_4_6 + 276 p_EMIB_left_0_4_4_6 <= 276
 EMIB_non_overlap_left_rev_0_4_4_6: - EMIB_w_var_0_4 - EMIB_x_grid_var_0_4
   + EMIB_x_grid_var_4_6 - 276 p_EMIB_left_0_4_4_6 <= 0
 EMIB_non_overlap_right_0_4_4_6: EMIB_w_var_4_6 - EMIB_x_grid_var_0_4
   + EMIB_x_grid_var_4_6 + 276 p_EMIB_right_0_4_4_6 <= 276
 EMIB_non_overlap_right_rev_0_4_4_6: - EMIB_w_var_4_6 + EMIB_x_grid_var_0_4
   - EMIB_x_grid_var_4_6 - 276 p_EMIB_right_0_4_4_6 <= 0
 EMIB_non_overlap_down_0_4_4_6: EMIB_h_var_0_4 + EMIB_y_grid_var_0_4
   - EMIB_y_grid_var_4_6 + 276 p_EMIB_down_0_4_4_6 <= 276
 EMIB_non_overlap_down_rev_0_4_4_6: - EMIB_h_var_0_4 - EMIB_y_grid_var_0_4
   + EMIB_y_grid_var_4_6 - 276 p_EMIB_down_0_4_4_6 <= 0
 EMIB_non_overlap_up_0_4_4_6: EMIB_h_var_4_6 - EMIB_y_grid_var_0_4
   + EMIB_y_grid_var_4_6 + 276 p_EMIB_up_0_4_4_6 <= 276
 EMIB_non_overlap_up_rev_0_4_4_6: - EMIB_h_var_4_6 + EMIB_y_grid_var_0_4
   - EMIB_y_grid_var_4_6 - 276 p_EMIB_up_0_4_4_6 <= 0
 EMIB_non_overlap_any_0_5_0_6: p_EMIB_left_0_5_0_6 + p_EMIB_right_0_5_0_6
   + p_EMIB_down_0_5_0_6 + p_EMIB_up_0_5_0_6 >= 1
 EMIB_non_overlap_left_0_5_0_6: EMIB_w_var_0_5 + EMIB_x_grid_var_0_5
   - EMIB_x_grid_var_0_6 + 276 p_EMIB_left_0_5_0_6 <= 276
 EMIB_non_overlap_left_rev_0_5_0_6: - EMIB_w_var_0_5 - EMIB_x_grid_var_0_5
   + EMIB_x_grid_var_0_6 - 276 p_EMIB_left_0_5_0_6 <= 0
 EMIB_non_overlap_right_0_5_0_6: EMIB_w_var_0_6 - EMIB_x_grid_var_0_5
   + EMIB_x_grid_var_0_6 + 276 p_EMIB_right_0_5_0_6 <= 276
 EMIB_non_overlap_right_rev_0_5_0_6: - EMIB_w_var_0_6 + EMIB_x_grid_var_0_5
   - EMIB_x_grid_var_0_6 - 276 p_EMIB_right_0_5_0_6 <= 0
 EMIB_non_overlap_down_0_5_0_6: EMIB_h_var_0_5 + EMIB_y_grid_var_0_5
   - EMIB_y_grid_var_0_6 + 276 p_EMIB_down_0_5_0_6 <= 276
 EMIB_non_overlap_down_rev_0_5_0_6: - EMIB_h_var_0_5 - EMIB_y_grid_var_0_5
   + EMIB_y_grid_var_0_6 - 276 p_EMIB_down_0_5_0_6 <= 0
 EMIB_non_overlap_up_0_5_0_6: EMIB_h_var_0_6 - EMIB_y_grid_var_0_5
   + EMIB_y_grid_var_0_6 + 276 p_EMIB_up_0_5_0_6 <= 276
 EMIB_non_overlap_up_rev_0_5_0_6: - EMIB_h_var_0_6 + EMIB_y_grid_var_0_5
   - EMIB_y_grid_var_0_6 - 276 p_EMIB_up_0_5_0_6 <= 0
 EMIB_non_overlap_any_0_5_2_5: p_EMIB_left_0_5_2_5 + p_EMIB_right_0_5_2_5
   + p_EMIB_down_0_5_2_5 + p_EMIB_up_0_5_2_5 >= 1
 EMIB_non_overlap_left_0_5_2_5: EMIB_w_var_0_5 + EMIB_x_grid_var_0_5
   - EMIB_x_grid_var_2_5 + 276 p_EMIB_left_0_5_2_5 <= 276
 EMIB_non_overlap_left_rev_0_5_2_5: - EMIB_w_var_0_5 - EMIB_x_grid_var_0_5
   + EMIB_x_grid_var_2_5 - 276 p_EMIB_left_0_5_2_5 <= 0
 EMIB_non_overlap_right_0_5_2_5: EMIB_w_var_2_5 - EMIB_x_grid_var_0_5
   + EMIB_x_grid_var_2_5 + 276 p_EMIB_right_0_5_2_5 <= 276
 EMIB_non_overlap_right_rev_0_5_2_5: - EMIB_w_var_2_5 + EMIB_x_grid_var_0_5
   - EMIB_x_grid_var_2_5 - 276 p_EMIB_right_0_5_2_5 <= 0
 EMIB_non_overlap_down_0_5_2_5: EMIB_h_var_0_5 + EMIB_y_grid_var_0_5
   - EMIB_y_grid_var_2_5 + 276 p_EMIB_down_0_5_2_5 <= 276
 EMIB_non_overlap_down_rev_0_5_2_5: - EMIB_h_var_0_5 - EMIB_y_grid_var_0_5
   + EMIB_y_grid_var_2_5 - 276 p_EMIB_down_0_5_2_5 <= 0
 EMIB_non_overlap_up_0_5_2_5: EMIB_h_var_2_5 - EMIB_y_grid_var_0_5
   + EMIB_y_grid_var_2_5 + 276 p_EMIB_up_0_5_2_5 <= 276
 EMIB_non_overlap_up_rev_0_5_2_5: - EMIB_h_var_2_5 + EMIB_y_grid_var_0_5
   - EMIB_y_grid_var_2_5 - 276 p_EMIB_up_0_5_2_5 <= 0
 EMIB_non_overlap_any_0_5_3_5: p_EMIB_left_0_5_3_5 + p_EMIB_right_0_5_3_5
   + p_EMIB_down_0_5_3_5 + p_EMIB_up_0_5_3_5 >= 1
 EMIB_non_overlap_left_0_5_3_5: EMIB_w_var_0_5 + EMIB_x_grid_var_0_5
   - EMIB_x_grid_var_3_5 + 276 p_EMIB_left_0_5_3_5 <= 276
 EMIB_non_overlap_left_rev_0_5_3_5: - EMIB_w_var_0_5 - EMIB_x_grid_var_0_5
   + EMIB_x_grid_var_3_5 - 276 p_EMIB_left_0_5_3_5 <= 0
 EMIB_non_overlap_right_0_5_3_5: EMIB_w_var_3_5 - EMIB_x_grid_var_0_5
   + EMIB_x_grid_var_3_5 + 276 p_EMIB_right_0_5_3_5 <= 276
 EMIB_non_overlap_right_rev_0_5_3_5: - EMIB_w_var_3_5 + EMIB_x_grid_var_0_5
   - EMIB_x_grid_var_3_5 - 276 p_EMIB_right_0_5_3_5 <= 0
 EMIB_non_overlap_down_0_5_3_5: EMIB_h_var_0_5 + EMIB_y_grid_var_0_5
   - EMIB_y_grid_var_3_5 + 276 p_EMIB_down_0_5_3_5 <= 276
 EMIB_non_overlap_down_rev_0_5_3_5: - EMIB_h_var_0_5 - EMIB_y_grid_var_0_5
   + EMIB_y_grid_var_3_5 - 276 p_EMIB_down_0_5_3_5 <= 0
 EMIB_non_overlap_up_0_5_3_5: EMIB_h_var_3_5 - EMIB_y_grid_var_0_5
   + EMIB_y_grid_var_3_5 + 276 p_EMIB_up_0_5_3_5 <= 276
 EMIB_non_overlap_up_rev_0_5_3_5: - EMIB_h_var_3_5 + EMIB_y_grid_var_0_5
   - EMIB_y_grid_var_3_5 - 276 p_EMIB_up_0_5_3_5 <= 0
 EMIB_non_overlap_any_0_5_4_5: p_EMIB_left_0_5_4_5 + p_EMIB_right_0_5_4_5
   + p_EMIB_down_0_5_4_5 + p_EMIB_up_0_5_4_5 >= 1
 EMIB_non_overlap_left_0_5_4_5: EMIB_w_var_0_5 + EMIB_x_grid_var_0_5
   - EMIB_x_grid_var_4_5 + 276 p_EMIB_left_0_5_4_5 <= 276
 EMIB_non_overlap_left_rev_0_5_4_5: - EMIB_w_var_0_5 - EMIB_x_grid_var_0_5
   + EMIB_x_grid_var_4_5 - 276 p_EMIB_left_0_5_4_5 <= 0
 EMIB_non_overlap_right_0_5_4_5: EMIB_w_var_4_5 - EMIB_x_grid_var_0_5
   + EMIB_x_grid_var_4_5 + 276 p_EMIB_right_0_5_4_5 <= 276
 EMIB_non_overlap_right_rev_0_5_4_5: - EMIB_w_var_4_5 + EMIB_x_grid_var_0_5
   - EMIB_x_grid_var_4_5 - 276 p_EMIB_right_0_5_4_5 <= 0
 EMIB_non_overlap_down_0_5_4_5: EMIB_h_var_0_5 + EMIB_y_grid_var_0_5
   - EMIB_y_grid_var_4_5 + 276 p_EMIB_down_0_5_4_5 <= 276
 EMIB_non_overlap_down_rev_0_5_4_5: - EMIB_h_var_0_5 - EMIB_y_grid_var_0_5
   + EMIB_y_grid_var_4_5 - 276 p_EMIB_down_0_5_4_5 <= 0
 EMIB_non_overlap_up_0_5_4_5: EMIB_h_var_4_5 - EMIB_y_grid_var_0_5
   + EMIB_y_grid_var_4_5 + 276 p_EMIB_up_0_5_4_5 <= 276
 EMIB_non_overlap_up_rev_0_5_4_5: - EMIB_h_var_4_5 + EMIB_y_grid_var_0_5
   - EMIB_y_grid_var_4_5 - 276 p_EMIB_up_0_5_4_5 <= 0
 EMIB_non_overlap_any_0_6_4_6: p_EMIB_left_0_6_4_6 + p_EMIB_right_0_6_4_6
   + p_EMIB_down_0_6_4_6 + p_EMIB_up_0_6_4_6 >= 1
 EMIB_non_overlap_left_0_6_4_6: EMIB_w_var_0_6 + EMIB_x_grid_var_0_6
   - EMIB_x_grid_var_4_6 + 276 p_EMIB_left_0_6_4_6 <= 276
 EMIB_non_overlap_left_rev_0_6_4_6: - EMIB_w_var_0_6 - EMIB_x_grid_var_0_6
   + EMIB_x_grid_var_4_6 - 276 p_EMIB_left_0_6_4_6 <= 0
 EMIB_non_overlap_right_0_6_4_6: EMIB_w_var_4_6 - EMIB_x_grid_var_0_6
   + EMIB_x_grid_var_4_6 + 276 p_EMIB_right_0_6_4_6 <= 276
 EMIB_non_overlap_right_rev_0_6_4_6: - EMIB_w_var_4_6 + EMIB_x_grid_var_0_6
   - EMIB_x_grid_var_4_6 - 276 p_EMIB_right_0_6_4_6 <= 0
 EMIB_non_overlap_down_0_6_4_6: EMIB_h_var_0_6 + EMIB_y_grid_var_0_6
   - EMIB_y_grid_var_4_6 + 276 p_EMIB_down_0_6_4_6 <= 276
 EMIB_non_overlap_down_rev_0_6_4_6: - EMIB_h_var_0_6 - EMIB_y_grid_var_0_6
   + EMIB_y_grid_var_4_6 - 276 p_EMIB_down_0_6_4_6 <= 0
 EMIB_non_overlap_up_0_6_4_6: EMIB_h_var_4_6 - EMIB_y_grid_var_0_6
   + EMIB_y_grid_var_4_6 + 276 p_EMIB_up_0_6_4_6 <= 276
 EMIB_non_overlap_up_rev_0_6_4_6: - EMIB_h_var_4_6 + EMIB_y_grid_var_0_6
   - EMIB_y_grid_var_4_6 - 276 p_EMIB_up_0_6_4_6 <= 0
 EMIB_non_overlap_any_1_2_2_4: p_EMIB_left_1_2_2_4 + p_EMIB_right_1_2_2_4
   + p_EMIB_down_1_2_2_4 + p_EMIB_up_1_2_2_4 >= 1
 EMIB_non_overlap_left_1_2_2_4: EMIB_w_var_1_2 + EMIB_x_grid_var_1_2
   - EMIB_x_grid_var_2_4 + 276 p_EMIB_left_1_2_2_4 <= 276
 EMIB_non_overlap_left_rev_1_2_2_4: - EMIB_w_var_1_2 - EMIB_x_grid_var_1_2
   + EMIB_x_grid_var_2_4 - 276 p_EMIB_left_1_2_2_4 <= 0
 EMIB_non_overlap_right_1_2_2_4: EMIB_w_var_2_4 - EMIB_x_grid_var_1_2
   + EMIB_x_grid_var_2_4 + 276 p_EMIB_right_1_2_2_4 <= 276
 EMIB_non_overlap_right_rev_1_2_2_4: - EMIB_w_var_2_4 + EMIB_x_grid_var_1_2
   - EMIB_x_grid_var_2_4 - 276 p_EMIB_right_1_2_2_4 <= 0
 EMIB_non_overlap_down_1_2_2_4: EMIB_h_var_1_2 + EMIB_y_grid_var_1_2
   - EMIB_y_grid_var_2_4 + 276 p_EMIB_down_1_2_2_4 <= 276
 EMIB_non_overlap_down_rev_1_2_2_4: - EMIB_h_var_1_2 - EMIB_y_grid_var_1_2
   + EMIB_y_grid_var_2_4 - 276 p_EMIB_down_1_2_2_4 <= 0
 EMIB_non_overlap_up_1_2_2_4: EMIB_h_var_2_4 - EMIB_y_grid_var_1_2
   + EMIB_y_grid_var_2_4 + 276 p_EMIB_up_1_2_2_4 <= 276
 EMIB_non_overlap_up_rev_1_2_2_4: - EMIB_h_var_2_4 + EMIB_y_grid_var_1_2
   - EMIB_y_grid_var_2_4 - 276 p_EMIB_up_1_2_2_4 <= 0
 EMIB_non_overlap_any_1_2_2_5: p_EMIB_left_1_2_2_5 + p_EMIB_right_1_2_2_5
   + p_EMIB_down_1_2_2_5 + p_EMIB_up_1_2_2_5 >= 1
 EMIB_non_overlap_left_1_2_2_5: EMIB_w_var_1_2 + EMIB_x_grid_var_1_2
   - EMIB_x_grid_var_2_5 + 276 p_EMIB_left_1_2_2_5 <= 276
 EMIB_non_overlap_left_rev_1_2_2_5: - EMIB_w_var_1_2 - EMIB_x_grid_var_1_2
   + EMIB_x_grid_var_2_5 - 276 p_EMIB_left_1_2_2_5 <= 0
 EMIB_non_overlap_right_1_2_2_5: EMIB_w_var_2_5 - EMIB_x_grid_var_1_2
   + EMIB_x_grid_var_2_5 + 276 p_EMIB_right_1_2_2_5 <= 276
 EMIB_non_overlap_right_rev_1_2_2_5: - EMIB_w_var_2_5 + EMIB_x_grid_var_1_2
   - EMIB_x_grid_var_2_5 - 276 p_EMIB_right_1_2_2_5 <= 0
 EMIB_non_overlap_down_1_2_2_5: EMIB_h_var_1_2 + EMIB_y_grid_var_1_2
   - EMIB_y_grid_var_2_5 + 276 p_EMIB_down_1_2_2_5 <= 276
 EMIB_non_overlap_down_rev_1_2_2_5: - EMIB_h_var_1_2 - EMIB_y_grid_var_1_2
   + EMIB_y_grid_var_2_5 - 276 p_EMIB_down_1_2_2_5 <= 0
 EMIB_non_overlap_up_1_2_2_5: EMIB_h_var_2_5 - EMIB_y_grid_var_1_2
   + EMIB_y_grid_var_2_5 + 276 p_EMIB_up_1_2_2_5 <= 276
 EMIB_non_overlap_up_rev_1_2_2_5: - EMIB_h_var_2_5 + EMIB_y_grid_var_1_2
   - EMIB_y_grid_var_2_5 - 276 p_EMIB_up_1_2_2_5 <= 0
 EMIB_non_overlap_any_2_4_2_5: p_EMIB_left_2_4_2_5 + p_EMIB_right_2_4_2_5
   + p_EMIB_down_2_4_2_5 + p_EMIB_up_2_4_2_5 >= 1
 EMIB_non_overlap_left_2_4_2_5: EMIB_w_var_2_4 + EMIB_x_grid_var_2_4
   - EMIB_x_grid_var_2_5 + 276 p_EMIB_left_2_4_2_5 <= 276
 EMIB_non_overlap_left_rev_2_4_2_5: - EMIB_w_var_2_4 - EMIB_x_grid_var_2_4
   + EMIB_x_grid_var_2_5 - 276 p_EMIB_left_2_4_2_5 <= 0
 EMIB_non_overlap_right_2_4_2_5: EMIB_w_var_2_5 - EMIB_x_grid_var_2_4
   + EMIB_x_grid_var_2_5 + 276 p_EMIB_right_2_4_2_5 <= 276
 EMIB_non_overlap_right_rev_2_4_2_5: - EMIB_w_var_2_5 + EMIB_x_grid_var_2_4
   - EMIB_x_grid_var_2_5 - 276 p_EMIB_right_2_4_2_5 <= 0
 EMIB_non_overlap_down_2_4_2_5: EMIB_h_var_2_4 + EMIB_y_grid_var_2_4
   - EMIB_y_grid_var_2_5 + 276 p_EMIB_down_2_4_2_5 <= 276
 EMIB_non_overlap_down_rev_2_4_2_5: - EMIB_h_var_2_4 - EMIB_y_grid_var_2_4
   + EMIB_y_grid_var_2_5 - 276 p_EMIB_down_2_4_2_5 <= 0
 EMIB_non_overlap_up_2_4_2_5: EMIB_h_var_2_5 - EMIB_y_grid_var_2_4
   + EMIB_y_grid_var_2_5 + 276 p_EMIB_up_2_4_2_5 <= 276
 EMIB_non_overlap_up_rev_2_4_2_5: - EMIB_h_var_2_5 + EMIB_y_grid_var_2_4
   - EMIB_y_grid_var_2_5 - 276 p_EMIB_up_2_4_2_5 <= 0
 EMIB_non_overlap_any_2_4_3_4: p_EMIB_left_2_4_3_4 + p_EMIB_right_2_4_3_4
   + p_EMIB_down_2_4_3_4 + p_EMIB_up_2_4_3_4 >= 1
 EMIB_non_overlap_left_2_4_3_4: EMIB_w_var_2_4 + EMIB_x_grid_var_2_4
   - EMIB_x_grid_var_3_4 + 276 p_EMIB_left_2_4_3_4 <= 276
 EMIB_non_overlap_left_rev_2_4_3_4: - EMIB_w_var_2_4 - EMIB_x_grid_var_2_4
   + EMIB_x_grid_var_3_4 - 276 p_EMIB_left_2_4_3_4 <= 0
 EMIB_non_overlap_right_2_4_3_4: EMIB_w_var_3_4 - EMIB_x_grid_var_2_4
   + EMIB_x_grid_var_3_4 + 276 p_EMIB_right_2_4_3_4 <= 276
 EMIB_non_overlap_right_rev_2_4_3_4: - EMIB_w_var_3_4 + EMIB_x_grid_var_2_4
   - EMIB_x_grid_var_3_4 - 276 p_EMIB_right_2_4_3_4 <= 0
 EMIB_non_overlap_down_2_4_3_4: EMIB_h_var_2_4 + EMIB_y_grid_var_2_4
   - EMIB_y_grid_var_3_4 + 276 p_EMIB_down_2_4_3_4 <= 276
 EMIB_non_overlap_down_rev_2_4_3_4: - EMIB_h_var_2_4 - EMIB_y_grid_var_2_4
   + EMIB_y_grid_var_3_4 - 276 p_EMIB_down_2_4_3_4 <= 0
 EMIB_non_overlap_up_2_4_3_4: EMIB_h_var_3_4 - EMIB_y_grid_var_2_4
   + EMIB_y_grid_var_3_4 + 276 p_EMIB_up_2_4_3_4 <= 276
 EMIB_non_overlap_up_rev_2_4_3_4: - EMIB_h_var_3_4 + EMIB_y_grid_var_2_4
   - EMIB_y_grid_var_3_4 - 276 p_EMIB_up_2_4_3_4 <= 0
 EMIB_non_overlap_any_2_4_4_5: p_EMIB_left_2_4_4_5 + p_EMIB_right_2_4_4_5
   + p_EMIB_down_2_4_4_5 + p_EMIB_up_2_4_4_5 >= 1
 EMIB_non_overlap_left_2_4_4_5: EMIB_w_var_2_4 + EMIB_x_grid_var_2_4
   - EMIB_x_grid_var_4_5 + 276 p_EMIB_left_2_4_4_5 <= 276
 EMIB_non_overlap_left_rev_2_4_4_5: - EMIB_w_var_2_4 - EMIB_x_grid_var_2_4
   + EMIB_x_grid_var_4_5 - 276 p_EMIB_left_2_4_4_5 <= 0
 EMIB_non_overlap_right_2_4_4_5: EMIB_w_var_4_5 - EMIB_x_grid_var_2_4
   + EMIB_x_grid_var_4_5 + 276 p_EMIB_right_2_4_4_5 <= 276
 EMIB_non_overlap_right_rev_2_4_4_5: - EMIB_w_var_4_5 + EMIB_x_grid_var_2_4
   - EMIB_x_grid_var_4_5 - 276 p_EMIB_right_2_4_4_5 <= 0
 EMIB_non_overlap_down_2_4_4_5: EMIB_h_var_2_4 + EMIB_y_grid_var_2_4
   - EMIB_y_grid_var_4_5 + 276 p_EMIB_down_2_4_4_5 <= 276
 EMIB_non_overlap_down_rev_2_4_4_5: - EMIB_h_var_2_4 - EMIB_y_grid_var_2_4
   + EMIB_y_grid_var_4_5 - 276 p_EMIB_down_2_4_4_5 <= 0
 EMIB_non_overlap_up_2_4_4_5: EMIB_h_var_4_5 - EMIB_y_grid_var_2_4
   + EMIB_y_grid_var_4_5 + 276 p_EMIB_up_2_4_4_5 <= 276
 EMIB_non_overlap_up_rev_2_4_4_5: - EMIB_h_var_4_5 + EMIB_y_grid_var_2_4
   - EMIB_y_grid_var_4_5 - 276 p_EMIB_up_2_4_4_5 <= 0
 EMIB_non_overlap_any_2_4_4_6: p_EMIB_left_2_4_4_6 + p_EMIB_right_2_4_4_6
   + p_EMIB_down_2_4_4_6 + p_EMIB_up_2_4_4_6 >= 1
 EMIB_non_overlap_left_2_4_4_6: EMIB_w_var_2_4 + EMIB_x_grid_var_2_4
   - EMIB_x_grid_var_4_6 + 276 p_EMIB_left_2_4_4_6 <= 276
 EMIB_non_overlap_left_rev_2_4_4_6: - EMIB_w_var_2_4 - EMIB_x_grid_var_2_4
   + EMIB_x_grid_var_4_6 - 276 p_EMIB_left_2_4_4_6 <= 0
 EMIB_non_overlap_right_2_4_4_6: EMIB_w_var_4_6 - EMIB_x_grid_var_2_4
   + EMIB_x_grid_var_4_6 + 276 p_EMIB_right_2_4_4_6 <= 276
 EMIB_non_overlap_right_rev_2_4_4_6: - EMIB_w_var_4_6 + EMIB_x_grid_var_2_4
   - EMIB_x_grid_var_4_6 - 276 p_EMIB_right_2_4_4_6 <= 0
 EMIB_non_overlap_down_2_4_4_6: EMIB_h_var_2_4 + EMIB_y_grid_var_2_4
   - EMIB_y_grid_var_4_6 + 276 p_EMIB_down_2_4_4_6 <= 276
 EMIB_non_overlap_down_rev_2_4_4_6: - EMIB_h_var_2_4 - EMIB_y_grid_var_2_4
   + EMIB_y_grid_var_4_6 - 276 p_EMIB_down_2_4_4_6 <= 0
 EMIB_non_overlap_up_2_4_4_6: EMIB_h_var_4_6 - EMIB_y_grid_var_2_4
   + EMIB_y_grid_var_4_6 + 276 p_EMIB_up_2_4_4_6 <= 276
 EMIB_non_overlap_up_rev_2_4_4_6: - EMIB_h_var_4_6 + EMIB_y_grid_var_2_4
   - EMIB_y_grid_var_4_6 - 276 p_EMIB_up_2_4_4_6 <= 0
 EMIB_non_overlap_any_2_5_3_5: p_EMIB_left_2_5_3_5 + p_EMIB_right_2_5_3_5
   + p_EMIB_down_2_5_3_5 + p_EMIB_up_2_5_3_5 >= 1
 EMIB_non_overlap_left_2_5_3_5: EMIB_w_var_2_5 + EMIB_x_grid_var_2_5
   - EMIB_x_grid_var_3_5 + 276 p_EMIB_left_2_5_3_5 <= 276
 EMIB_non_overlap_left_rev_2_5_3_5: - EMIB_w_var_2_5 - EMIB_x_grid_var_2_5
   + EMIB_x_grid_var_3_5 - 276 p_EMIB_left_2_5_3_5 <= 0
 EMIB_non_overlap_right_2_5_3_5: EMIB_w_var_3_5 - EMIB_x_grid_var_2_5
   + EMIB_x_grid_var_3_5 + 276 p_EMIB_right_2_5_3_5 <= 276
 EMIB_non_overlap_right_rev_2_5_3_5: - EMIB_w_var_3_5 + EMIB_x_grid_var_2_5
   - EMIB_x_grid_var_3_5 - 276 p_EMIB_right_2_5_3_5 <= 0
 EMIB_non_overlap_down_2_5_3_5: EMIB_h_var_2_5 + EMIB_y_grid_var_2_5
   - EMIB_y_grid_var_3_5 + 276 p_EMIB_down_2_5_3_5 <= 276
 EMIB_non_overlap_down_rev_2_5_3_5: - EMIB_h_var_2_5 - EMIB_y_grid_var_2_5
   + EMIB_y_grid_var_3_5 - 276 p_EMIB_down_2_5_3_5 <= 0
 EMIB_non_overlap_up_2_5_3_5: EMIB_h_var_3_5 - EMIB_y_grid_var_2_5
   + EMIB_y_grid_var_3_5 + 276 p_EMIB_up_2_5_3_5 <= 276
 EMIB_non_overlap_up_rev_2_5_3_5: - EMIB_h_var_3_5 + EMIB_y_grid_var_2_5
   - EMIB_y_grid_var_3_5 - 276 p_EMIB_up_2_5_3_5 <= 0
 EMIB_non_overlap_any_2_5_4_5: p_EMIB_left_2_5_4_5 + p_EMIB_right_2_5_4_5
   + p_EMIB_down_2_5_4_5 + p_EMIB_up_2_5_4_5 >= 1
 EMIB_non_overlap_left_2_5_4_5: EMIB_w_var_2_5 + EMIB_x_grid_var_2_5
   - EMIB_x_grid_var_4_5 + 276 p_EMIB_left_2_5_4_5 <= 276
 EMIB_non_overlap_left_rev_2_5_4_5: - EMIB_w_var_2_5 - EMIB_x_grid_var_2_5
   + EMIB_x_grid_var_4_5 - 276 p_EMIB_left_2_5_4_5 <= 0
 EMIB_non_overlap_right_2_5_4_5: EMIB_w_var_4_5 - EMIB_x_grid_var_2_5
   + EMIB_x_grid_var_4_5 + 276 p_EMIB_right_2_5_4_5 <= 276
 EMIB_non_overlap_right_rev_2_5_4_5: - EMIB_w_var_4_5 + EMIB_x_grid_var_2_5
   - EMIB_x_grid_var_4_5 - 276 p_EMIB_right_2_5_4_5 <= 0
 EMIB_non_overlap_down_2_5_4_5: EMIB_h_var_2_5 + EMIB_y_grid_var_2_5
   - EMIB_y_grid_var_4_5 + 276 p_EMIB_down_2_5_4_5 <= 276
 EMIB_non_overlap_down_rev_2_5_4_5: - EMIB_h_var_2_5 - EMIB_y_grid_var_2_5
   + EMIB_y_grid_var_4_5 - 276 p_EMIB_down_2_5_4_5 <= 0
 EMIB_non_overlap_up_2_5_4_5: EMIB_h_var_4_5 - EMIB_y_grid_var_2_5
   + EMIB_y_grid_var_4_5 + 276 p_EMIB_up_2_5_4_5 <= 276
 EMIB_non_overlap_up_rev_2_5_4_5: - EMIB_h_var_4_5 + EMIB_y_grid_var_2_5
   - EMIB_y_grid_var_4_5 - 276 p_EMIB_up_2_5_4_5 <= 0
 EMIB_non_overlap_any_3_4_3_5: p_EMIB_left_3_4_3_5 + p_EMIB_right_3_4_3_5
   + p_EMIB_down_3_4_3_5 + p_EMIB_up_3_4_3_5 >= 1
 EMIB_non_overlap_left_3_4_3_5: EMIB_w_var_3_4 + EMIB_x_grid_var_3_4
   - EMIB_x_grid_var_3_5 + 276 p_EMIB_left_3_4_3_5 <= 276
 EMIB_non_overlap_left_rev_3_4_3_5: - EMIB_w_var_3_4 - EMIB_x_grid_var_3_4
   + EMIB_x_grid_var_3_5 - 276 p_EMIB_left_3_4_3_5 <= 0
 EMIB_non_overlap_right_3_4_3_5: EMIB_w_var_3_5 - EMIB_x_grid_var_3_4
   + EMIB_x_grid_var_3_5 + 276 p_EMIB_right_3_4_3_5 <= 276
 EMIB_non_overlap_right_rev_3_4_3_5: - EMIB_w_var_3_5 + EMIB_x_grid_var_3_4
   - EMIB_x_grid_var_3_5 - 276 p_EMIB_right_3_4_3_5 <= 0
 EMIB_non_overlap_down_3_4_3_5: EMIB_h_var_3_4 + EMIB_y_grid_var_3_4
   - EMIB_y_grid_var_3_5 + 276 p_EMIB_down_3_4_3_5 <= 276
 EMIB_non_overlap_down_rev_3_4_3_5: - EMIB_h_var_3_4 - EMIB_y_grid_var_3_4
   + EMIB_y_grid_var_3_5 - 276 p_EMIB_down_3_4_3_5 <= 0
 EMIB_non_overlap_up_3_4_3_5: EMIB_h_var_3_5 - EMIB_y_grid_var_3_4
   + EMIB_y_grid_var_3_5 + 276 p_EMIB_up_3_4_3_5 <= 276
 EMIB_non_overlap_up_rev_3_4_3_5: - EMIB_h_var_3_5 + EMIB_y_grid_var_3_4
   - EMIB_y_grid_var_3_5 - 276 p_EMIB_up_3_4_3_5 <= 0
 EMIB_non_overlap_any_3_4_4_5: p_EMIB_left_3_4_4_5 + p_EMIB_right_3_4_4_5
   + p_EMIB_down_3_4_4_5 + p_EMIB_up_3_4_4_5 >= 1
 EMIB_non_overlap_left_3_4_4_5: EMIB_w_var_3_4 + EMIB_x_grid_var_3_4
   - EMIB_x_grid_var_4_5 + 276 p_EMIB_left_3_4_4_5 <= 276
 EMIB_non_overlap_left_rev_3_4_4_5: - EMIB_w_var_3_4 - EMIB_x_grid_var_3_4
   + EMIB_x_grid_var_4_5 - 276 p_EMIB_left_3_4_4_5 <= 0
 EMIB_non_overlap_right_3_4_4_5: EMIB_w_var_4_5 - EMIB_x_grid_var_3_4
   + EMIB_x_grid_var_4_5 + 276 p_EMIB_right_3_4_4_5 <= 276
 EMIB_non_overlap_right_rev_3_4_4_5: - EMIB_w_var_4_5 + EMIB_x_grid_var_3_4
   - EMIB_x_grid_var_4_5 - 276 p_EMIB_right_3_4_4_5 <= 0
 EMIB_non_overlap_down_3_4_4_5: EMIB_h_var_3_4 + EMIB_y_grid_var_3_4
   - EMIB_y_grid_var_4_5 + 276 p_EMIB_down_3_4_4_5 <= 276
 EMIB_non_overlap_down_rev_3_4_4_5: - EMIB_h_var_3_4 - EMIB_y_grid_var_3_4
   + EMIB_y_grid_var_4_5 - 276 p_EMIB_down_3_4_4_5 <= 0
 EMIB_non_overlap_up_3_4_4_5: EMIB_h_var_4_5 - EMIB_y_grid_var_3_4
   + EMIB_y_grid_var_4_5 + 276 p_EMIB_up_3_4_4_5 <= 276
 EMIB_non_overlap_up_rev_3_4_4_5: - EMIB_h_var_4_5 + EMIB_y_grid_var_3_4
   - EMIB_y_grid_var_4_5 - 276 p_EMIB_up_3_4_4_5 <= 0
 EMIB_non_overlap_any_3_4_4_6: p_EMIB_left_3_4_4_6 + p_EMIB_right_3_4_4_6
   + p_EMIB_down_3_4_4_6 + p_EMIB_up_3_4_4_6 >= 1
 EMIB_non_overlap_left_3_4_4_6: EMIB_w_var_3_4 + EMIB_x_grid_var_3_4
   - EMIB_x_grid_var_4_6 + 276 p_EMIB_left_3_4_4_6 <= 276
 EMIB_non_overlap_left_rev_3_4_4_6: - EMIB_w_var_3_4 - EMIB_x_grid_var_3_4
   + EMIB_x_grid_var_4_6 - 276 p_EMIB_left_3_4_4_6 <= 0
 EMIB_non_overlap_right_3_4_4_6: EMIB_w_var_4_6 - EMIB_x_grid_var_3_4
   + EMIB_x_grid_var_4_6 + 276 p_EMIB_right_3_4_4_6 <= 276
 EMIB_non_overlap_right_rev_3_4_4_6: - EMIB_w_var_4_6 + EMIB_x_grid_var_3_4
   - EMIB_x_grid_var_4_6 - 276 p_EMIB_right_3_4_4_6 <= 0
 EMIB_non_overlap_down_3_4_4_6: EMIB_h_var_3_4 + EMIB_y_grid_var_3_4
   - EMIB_y_grid_var_4_6 + 276 p_EMIB_down_3_4_4_6 <= 276
 EMIB_non_overlap_down_rev_3_4_4_6: - EMIB_h_var_3_4 - EMIB_y_grid_var_3_4
   + EMIB_y_grid_var_4_6 - 276 p_EMIB_down_3_4_4_6 <= 0
 EMIB_non_overlap_up_3_4_4_6: EMIB_h_var_4_6 - EMIB_y_grid_var_3_4
   + EMIB_y_grid_var_4_6 + 276 p_EMIB_up_3_4_4_6 <= 276
 EMIB_non_overlap_up_rev_3_4_4_6: - EMIB_h_var_4_6 + EMIB_y_grid_var_3_4
   - EMIB_y_grid_var_4_6 - 276 p_EMIB_up_3_4_4_6 <= 0
 EMIB_non_overlap_any_3_5_4_5: p_EMIB_left_3_5_4_5 + p_EMIB_right_3_5_4_5
   + p_EMIB_down_3_5_4_5 + p_EMIB_up_3_5_4_5 >= 1
 EMIB_non_overlap_left_3_5_4_5: EMIB_w_var_3_5 + EMIB_x_grid_var_3_5
   - EMIB_x_grid_var_4_5 + 276 p_EMIB_left_3_5_4_5 <= 276
 EMIB_non_overlap_left_rev_3_5_4_5: - EMIB_w_var_3_5 - EMIB_x_grid_var_3_5
   + EMIB_x_grid_var_4_5 - 276 p_EMIB_left_3_5_4_5 <= 0
 EMIB_non_overlap_right_3_5_4_5: EMIB_w_var_4_5 - EMIB_x_grid_var_3_5
   + EMIB_x_grid_var_4_5 + 276 p_EMIB_right_3_5_4_5 <= 276
 EMIB_non_overlap_right_rev_3_5_4_5: - EMIB_w_var_4_5 + EMIB_x_grid_var_3_5
   - EMIB_x_grid_var_4_5 - 276 p_EMIB_right_3_5_4_5 <= 0
 EMIB_non_overlap_down_3_5_4_5: EMIB_h_var_3_5 + EMIB_y_grid_var_3_5
   - EMIB_y_grid_var_4_5 + 276 p_EMIB_down_3_5_4_5 <= 276
 EMIB_non_overlap_down_rev_3_5_4_5: - EMIB_h_var_3_5 - EMIB_y_grid_var_3_5
   + EMIB_y_grid_var_4_5 - 276 p_EMIB_down_3_5_4_5 <= 0
 EMIB_non_overlap_up_3_5_4_5: EMIB_h_var_4_5 - EMIB_y_grid_var_3_5
   + EMIB_y_grid_var_4_5 + 276 p_EMIB_up_3_5_4_5 <= 276
 EMIB_non_overlap_up_rev_3_5_4_5: - EMIB_h_var_4_5 + EMIB_y_grid_var_3_5
   - EMIB_y_grid_var_4_5 - 276 p_EMIB_up_3_5_4_5 <= 0
 EMIB_non_overlap_any_4_5_4_6: p_EMIB_left_4_5_4_6 + p_EMIB_right_4_5_4_6
   + p_EMIB_down_4_5_4_6 + p_EMIB_up_4_5_4_6 >= 1
 EMIB_non_overlap_left_4_5_4_6: EMIB_w_var_4_5 + EMIB_x_grid_var_4_5
   - EMIB_x_grid_var_4_6 + 276 p_EMIB_left_4_5_4_6 <= 276
 EMIB_non_overlap_left_rev_4_5_4_6: - EMIB_w_var_4_5 - EMIB_x_grid_var_4_5
   + EMIB_x_grid_var_4_6 - 276 p_EMIB_left_4_5_4_6 <= 0
 EMIB_non_overlap_right_4_5_4_6: EMIB_w_var_4_6 - EMIB_x_grid_var_4_5
   + EMIB_x_grid_var_4_6 + 276 p_EMIB_right_4_5_4_6 <= 276
 EMIB_non_overlap_right_rev_4_5_4_6: - EMIB_w_var_4_6 + EMIB_x_grid_var_4_5
   - EMIB_x_grid_var_4_6 - 276 p_EMIB_right_4_5_4_6 <= 0
 EMIB_non_overlap_down_4_5_4_6: EMIB_h_var_4_5 + EMIB_y_grid_var_4_5
   - EMIB_y_grid_var_4_6 + 276 p_EMIB_down_4_5_4_6 <= 276
 EMIB_non_overlap_down_rev_4_5_4_6: - EMIB_h_var_4_5 - EMIB_y_grid_var_4_5
   + EMIB_y_grid_var_4_6 - 276 p_EMIB_down_4_5_4_6 <= 0
 EMIB_non_overlap_up_4_5_4_6: EMIB_h_var_4_6 - EMIB_y_grid_var_4_5
   + EMIB_y_grid_var_4_6 + 276 p_EMIB_up_4_5_4_6 <= 276
 EMIB_non_overlap_up_rev_4_5_4_6: - EMIB_h_var_4_6 + EMIB_y_grid_var_4_5
   - EMIB_y_grid_var_4_6 - 276 p_EMIB_up_4_5_4_6 <= 0
 bbox_min_x_0: - x_grid_var_0 + bbox_min_x <= 0
 bbox_max_x_0: - w_var_0 - x_grid_var_0 + bbox_max_x >= 0
 bbox_min_y_0: - y_grid_var_0 + bbox_min_y <= 0
 bbox_max_y_0: - h_var_0 - y_grid_var_0 + bbox_max_y >= 0
 bbox_min_x_1: - x_grid_var_1 + bbox_min_x <= 0
 bbox_max_x_1: - w_var_1 - x_grid_var_1 + bbox_max_x >= 0
 bbox_min_y_1: - y_grid_var_1 + bbox_min_y <= 0
 bbox_max_y_1: - h_var_1 - y_grid_var_1 + bbox_max_y >= 0
 bbox_min_x_2: - x_grid_var_2 + bbox_min_x <= 0
 bbox_max_x_2: - w_var_2 - x_grid_var_2 + bbox_max_x >= 0
 bbox_min_y_2: - y_grid_var_2 + bbox_min_y <= 0
 bbox_max_y_2: - h_var_2 - y_grid_var_2 + bbox_max_y >= 0
 bbox_min_x_3: - x_grid_var_3 + bbox_min_x <= 0
 bbox_max_x_3: - w_var_3 - x_grid_var_3 + bbox_max_x >= 0
 bbox_min_y_3: - y_grid_var_3 + bbox_min_y <= 0
 bbox_max_y_3: - h_var_3 - y_grid_var_3 + bbox_max_y >= 0
 bbox_min_x_4: - x_grid_var_4 + bbox_min_x <= 0
 bbox_max_x_4: - w_var_4 - x_grid_var_4 + bbox_max_x >= 0
 bbox_min_y_4: - y_grid_var_4 + bbox_min_y <= 0
 bbox_max_y_4: - h_var_4 - y_grid_var_4 + bbox_max_y >= 0
 bbox_min_x_5: - x_grid_var_5 + bbox_min_x <= 0
 bbox_max_x_5: - w_var_5 - x_grid_var_5 + bbox_max_x >= 0
 bbox_min_y_5: - y_grid_var_5 + bbox_min_y <= 0
 bbox_max_y_5: - h_var_5 - y_grid_var_5 + bbox_max_y >= 0
 bbox_min_x_6: - x_grid_var_6 + bbox_min_x <= 0
 bbox_max_x_6: - w_var_6 - x_grid_var_6 + bbox_max_x >= 0
 bbox_min_y_6: - y_grid_var_6 + bbox_min_y <= 0
 bbox_max_y_6: - h_var_6 - y_grid_var_6 + bbox_max_y >= 0
 bbox_w_def: bbox_min_x - bbox_max_x + bbox_w = 0
 bbox_h_def: bbox_min_y - bbox_max_y + bbox_h = 0
 cx_center_def: cx_center - 0.5 bbox_min_x - 0.5 bbox_max_x = 0
 cy_center_def: cy_center - 0.5 bbox_min_y - 0.5 bbox_max_y = 0
 aspect_ratio_diff_ge_w_minus_h: - bbox_w + bbox_h + aspect_ratio_penalty
   >= 0
 aspect_ratio_diff_ge_h_minus_w: bbox_w - bbox_h + aspect_ratio_penalty
   >= 0
 dx_grid_diff_def_0_1: - cx_grid_var_0 + cx_grid_var_1 + dx_grid_diff_0_1
   = 0
 dx_grid_abs_pair_0_1_abs_ge_orig: dx_grid_abs_pair_0_1 - dx_grid_diff_0_1
   - 276 dx_grid_abs_pair_0_1_is_positive >= -276
 dx_grid_abs_pair_0_1_abs_le_orig: dx_grid_abs_pair_0_1 - dx_grid_diff_0_1
   + 276 dx_grid_abs_pair_0_1_is_positive <= 276
 dx_grid_abs_pair_0_1_abs_ge_neg_orig: dx_grid_abs_pair_0_1
   + dx_grid_diff_0_1 + 276 dx_grid_abs_pair_0_1_is_positive >= 0
 dx_grid_abs_pair_0_1_abs_le_neg_orig: dx_grid_abs_pair_0_1
   + dx_grid_diff_0_1 - 276 dx_grid_abs_pair_0_1_is_positive <= 0
 dx_grid_abs_pair_0_1_force_positive: dx_grid_diff_0_1
   - 276 dx_grid_abs_pair_0_1_is_positive >= -276
 dx_grid_abs_pair_0_1_force_negative: dx_grid_diff_0_1
   - 276 dx_grid_abs_pair_0_1_is_positive <= 0
 dy_grid_diff_def_0_1: - cy_grid_var_0 + cy_grid_var_1 + dy_grid_diff_0_1
   = 0
 dy_grid_abs_pair_0_1_abs_ge_orig: dy_grid_abs_pair_0_1 - dy_grid_diff_0_1
   - 276 dy_grid_abs_pair_0_1_is_positive >= -276
 dy_grid_abs_pair_0_1_abs_le_orig: dy_grid_abs_pair_0_1 - dy_grid_diff_0_1
   + 276 dy_grid_abs_pair_0_1_is_positive <= 276
 dy_grid_abs_pair_0_1_abs_ge_neg_orig: dy_grid_abs_pair_0_1
   + dy_grid_diff_0_1 + 276 dy_grid_abs_pair_0_1_is_positive >= 0
 dy_grid_abs_pair_0_1_abs_le_neg_orig: dy_grid_abs_pair_0_1
   + dy_grid_diff_0_1 - 276 dy_grid_abs_pair_0_1_is_positive <= 0
 dy_grid_abs_pair_0_1_force_positive: dy_grid_diff_0_1
   - 276 dy_grid_abs_pair_0_1_is_positive >= -276
 dy_grid_abs_pair_0_1_force_negative: dy_grid_diff_0_1
   - 276 dy_grid_abs_pair_0_1_is_positive <= 0
 dist_curr_pair_def_0_1: - dx_grid_abs_pair_0_1 - dy_grid_abs_pair_0_1
   + dist_curr_pair_0_1 = 0
 dx_center_diff_def_0: - cx_grid_var_0 + cx_center + dx_center_diff_0 = 0
 dx_center_abs_0_abs_ge_orig: - dx_center_diff_0 + dx_center_abs_0
   - 276 dx_center_abs_0_is_positive >= -276
 dx_center_abs_0_abs_le_orig: - dx_center_diff_0 + dx_center_abs_0
   + 276 dx_center_abs_0_is_positive <= 276
 dx_center_abs_0_abs_ge_neg_orig: dx_center_diff_0 + dx_center_abs_0
   + 276 dx_center_abs_0_is_positive >= 0
 dx_center_abs_0_abs_le_neg_orig: dx_center_diff_0 + dx_center_abs_0
   - 276 dx_center_abs_0_is_positive <= 0
 dx_center_abs_0_force_positive: dx_center_diff_0
   - 276 dx_center_abs_0_is_positive >= -276
 dx_center_abs_0_force_negative: dx_center_diff_0
   - 276 dx_center_abs_0_is_positive <= 0
 dy_center_diff_def_0: - cy_grid_var_0 + cy_center + dy_center_diff_0 = 0
 dy_center_abs_0_abs_ge_orig: - dy_center_diff_0 + dy_center_abs_0
   - 276 dy_center_abs_0_is_positive >= -276
 dy_center_abs_0_abs_le_orig: - dy_center_diff_0 + dy_center_abs_0
   + 276 dy_center_abs_0_is_positive <= 276
 dy_center_abs_0_abs_ge_neg_orig: dy_center_diff_0 + dy_center_abs_0
   + 276 dy_center_abs_0_is_positive >= 0
 dy_center_abs_0_abs_le_neg_orig: dy_center_diff_0 + dy_center_abs_0
   - 276 dy_center_abs_0_is_positive <= 0
 dy_center_abs_0_force_positive: dy_center_diff_0
   - 276 dy_center_abs_0_is_positive >= -276
 dy_center_abs_0_force_negative: dy_center_diff_0
   - 276 dy_center_abs_0_is_positive <= 0
 dist_center_def_0: - dx_center_abs_0 - dy_center_abs_0 + dist_center_0
   = 0
 dx_center_diff_def_1: - cx_grid_var_1 + cx_center + dx_center_diff_1 = 0
 dx_center_abs_1_abs_ge_orig: - dx_center_diff_1 + dx_center_abs_1
   - 276 dx_center_abs_1_is_positive >= -276
 dx_center_abs_1_abs_le_orig: - dx_center_diff_1 + dx_center_abs_1
   + 276 dx_center_abs_1_is_positive <= 276
 dx_center_abs_1_abs_ge_neg_orig: dx_center_diff_1 + dx_center_abs_1
   + 276 dx_center_abs_1_is_positive >= 0
 dx_center_abs_1_abs_le_neg_orig: dx_center_diff_1 + dx_center_abs_1
   - 276 dx_center_abs_1_is_positive <= 0
 dx_center_abs_1_force_positive: dx_center_diff_1
   - 276 dx_center_abs_1_is_positive >= -276
 dx_center_abs_1_force_negative: dx_center_diff_1
   - 276 dx_center_abs_1_is_positive <= 0
 dy_center_diff_def_1: - cy_grid_var_1 + cy_center + dy_center_diff_1 = 0
 dy_center_abs_1_abs_ge_orig: - dy_center_diff_1 + dy_center_abs_1
   - 276 dy_center_abs_1_is_positive >= -276
 dy_center_abs_1_abs_le_orig: - dy_center_diff_1 + dy_center_abs_1
   + 276 dy_center_abs_1_is_positive <= 276
 dy_center_abs_1_abs_ge_neg_orig: dy_center_diff_1 + dy_center_abs_1
   + 276 dy_center_abs_1_is_positive >= 0
 dy_center_abs_1_abs_le_neg_orig: dy_center_diff_1 + dy_center_abs_1
   - 276 dy_center_abs_1_is_positive <= 0
 dy_center_abs_1_force_positive: dy_center_diff_1
   - 276 dy_center_abs_1_is_positive >= -276
 dy_center_abs_1_force_negative: dy_center_diff_1
   - 276 dy_center_abs_1_is_positive <= 0
 dist_center_def_1: - dx_center_abs_1 - dy_center_abs_1 + dist_center_1
   = 0
 power_aware_penalty_def: power_aware_penalty - 4416 dist_curr_pair_0_1
   - 2304 dist_center_0 - 8464 dist_center_1 = 0
 dx_diff_def_3_6: - cx_grid_var_3 + cx_grid_var_6 + dx_diff_3_6 = 0
 dy_diff_def_3_6: - cy_grid_var_3 + cy_grid_var_6 + dy_diff_3_6 = 0
 dx_abs_3_6_abs_ge_orig: dx_abs_3_6 - dx_diff_3_6
   - 276 dx_abs_3_6_is_positive >= -276
 dx_abs_3_6_abs_le_orig: dx_abs_3_6 - dx_diff_3_6
   + 276 dx_abs_3_6_is_positive <= 276
 dx_abs_3_6_abs_ge_neg_orig: dx_abs_3_6 + dx_diff_3_6
   + 276 dx_abs_3_6_is_positive >= 0
 dx_abs_3_6_abs_le_neg_orig: dx_abs_3_6 + dx_diff_3_6
   - 276 dx_abs_3_6_is_positive <= 0
 dx_abs_3_6_force_positive: dx_diff_3_6 - 276 dx_abs_3_6_is_positive
   >= -276
 dx_abs_3_6_force_negative: dx_diff_3_6 - 276 dx_abs_3_6_is_positive <= 0
 dy_abs_3_6_abs_ge_orig: dy_abs_3_6 - dy_diff_3_6
   - 276 dy_abs_3_6_is_positive >= -276
 dy_abs_3_6_abs_le_orig: dy_abs_3_6 - dy_diff_3_6
   + 276 dy_abs_3_6_is_positive <= 276
 dy_abs_3_6_abs_ge_neg_orig: dy_abs_3_6 + dy_diff_3_6
   + 276 dy_abs_3_6_is_positive >= 0
 dy_abs_3_6_abs_le_neg_orig: dy_abs_3_6 + dy_diff_3_6
   - 276 dy_abs_3_6_is_positive <= 0
 dy_abs_3_6_force_positive: dy_diff_3_6 - 276 dy_abs_3_6_is_positive
   >= -276
 dy_abs_3_6_force_negative: dy_diff_3_6 - 276 dy_abs_3_6_is_positive <= 0
 dx_diff_def_5_6: - cx_grid_var_5 + cx_grid_var_6 + dx_diff_5_6 = 0
 dy_diff_def_5_6: - cy_grid_var_5 + cy_grid_var_6 + dy_diff_5_6 = 0
 dx_abs_5_6_abs_ge_orig: dx_abs_5_6 - dx_diff_5_6
   - 276 dx_abs_5_6_is_positive >= -276
 dx_abs_5_6_abs_le_orig: dx_abs_5_6 - dx_diff_5_6
   + 276 dx_abs_5_6_is_positive <= 276
 dx_abs_5_6_abs_ge_neg_orig: dx_abs_5_6 + dx_diff_5_6
   + 276 dx_abs_5_6_is_positive >= 0
 dx_abs_5_6_abs_le_neg_orig: dx_abs_5_6 + dx_diff_5_6
   - 276 dx_abs_5_6_is_positive <= 0
 dx_abs_5_6_force_positive: dx_diff_5_6 - 276 dx_abs_5_6_is_positive
   >= -276
 dx_abs_5_6_force_negative: dx_diff_5_6 - 276 dx_abs_5_6_is_positive <= 0
 dy_abs_5_6_abs_ge_orig: dy_abs_5_6 - dy_diff_5_6
   - 276 dy_abs_5_6_is_positive >= -276
 dy_abs_5_6_abs_le_orig: dy_abs_5_6 - dy_diff_5_6
   + 276 dy_abs_5_6_is_positive <= 276
 dy_abs_5_6_abs_ge_neg_orig: dy_abs_5_6 + dy_diff_5_6
   + 276 dy_abs_5_6_is_positive >= 0
 dy_abs_5_6_abs_le_neg_orig: dy_abs_5_6 + dy_diff_5_6
   - 276 dy_abs_5_6_is_positive <= 0
 dy_abs_5_6_force_positive: dy_diff_5_6 - 276 dy_abs_5_6_is_positive
   >= -276
 dy_abs_5_6_force_negative: dy_diff_5_6 - 276 dy_abs_5_6_is_positive <= 0
 dx_diff_def_i_0_4: EMIB_cx_grid_var_0_4 - cx_grid_var_0 + dx_diff_i_0_4
   = 0
 dx_diff_def_j_0_4: EMIB_cx_grid_var_0_4 - cx_grid_var_4 + dx_diff_j_0_4
   = 0
 dy_diff_def_i_0_4: EMIB_cy_grid_var_0_4 - cy_grid_var_0 + dy_diff_i_0_4
   = 0
 dy_diff_def_j_0_4: EMIB_cy_grid_var_0_4 - cy_grid_var_4 + dy_diff_j_0_4
   = 0
 dx_abs_i_0_4_abs_ge_orig: dx_abs_i_0_4 - dx_diff_i_0_4
   - 276 dx_abs_i_0_4_is_positive >= -276
 dx_abs_i_0_4_abs_le_orig: dx_abs_i_0_4 - dx_diff_i_0_4
   + 276 dx_abs_i_0_4_is_positive <= 276
 dx_abs_i_0_4_abs_ge_neg_orig: dx_abs_i_0_4 + dx_diff_i_0_4
   + 276 dx_abs_i_0_4_is_positive >= 0
 dx_abs_i_0_4_abs_le_neg_orig: dx_abs_i_0_4 + dx_diff_i_0_4
   - 276 dx_abs_i_0_4_is_positive <= 0
 dx_abs_i_0_4_force_positive: dx_diff_i_0_4 - 276 dx_abs_i_0_4_is_positive
   >= -276
 dx_abs_i_0_4_force_negative: dx_diff_i_0_4 - 276 dx_abs_i_0_4_is_positive
   <= 0
 dy_abs_i_0_4_abs_ge_orig: dy_abs_i_0_4 - dy_diff_i_0_4
   - 276 dy_abs_i_0_4_is_positive >= -276
 dy_abs_i_0_4_abs_le_orig: dy_abs_i_0_4 - dy_diff_i_0_4
   + 276 dy_abs_i_0_4_is_positive <= 276
 dy_abs_i_0_4_abs_ge_neg_orig: dy_abs_i_0_4 + dy_diff_i_0_4
   + 276 dy_abs_i_0_4_is_positive >= 0
 dy_abs_i_0_4_abs_le_neg_orig: dy_abs_i_0_4 + dy_diff_i_0_4
   - 276 dy_abs_i_0_4_is_positive <= 0
 dy_abs_i_0_4_force_positive: dy_diff_i_0_4 - 276 dy_abs_i_0_4_is_positive
   >= -276
 dy_abs_i_0_4_force_negative: dy_diff_i_0_4 - 276 dy_abs_i_0_4_is_positive
   <= 0
 dx_abs_j_0_4_abs_ge_orig: dx_abs_j_0_4 - dx_diff_j_0_4
   - 276 dx_abs_j_0_4_is_positive >= -276
 dx_abs_j_0_4_abs_le_orig: dx_abs_j_0_4 - dx_diff_j_0_4
   + 276 dx_abs_j_0_4_is_positive <= 276
 dx_abs_j_0_4_abs_ge_neg_orig: dx_abs_j_0_4 + dx_diff_j_0_4
   + 276 dx_abs_j_0_4_is_positive >= 0
 dx_abs_j_0_4_abs_le_neg_orig: dx_abs_j_0_4 + dx_diff_j_0_4
   - 276 dx_abs_j_0_4_is_positive <= 0
 dx_abs_j_0_4_force_positive: dx_diff_j_0_4 - 276 dx_abs_j_0_4_is_positive
   >= -276
 dx_abs_j_0_4_force_negative: dx_diff_j_0_4 - 276 dx_abs_j_0_4_is_positive
   <= 0
 dy_abs_j_0_4_abs_ge_orig: dy_abs_j_0_4 - dy_diff_j_0_4
   - 276 dy_abs_j_0_4_is_positive >= -276
 dy_abs_j_0_4_abs_le_orig: dy_abs_j_0_4 - dy_diff_j_0_4
   + 276 dy_abs_j_0_4_is_positive <= 276
 dy_abs_j_0_4_abs_ge_neg_orig: dy_abs_j_0_4 + dy_diff_j_0_4
   + 276 dy_abs_j_0_4_is_positive >= 0
 dy_abs_j_0_4_abs_le_neg_orig: dy_abs_j_0_4 + dy_diff_j_0_4
   - 276 dy_abs_j_0_4_is_positive <= 0
 dy_abs_j_0_4_force_positive: dy_diff_j_0_4 - 276 dy_abs_j_0_4_is_positive
   >= -276
 dy_abs_j_0_4_force_negative: dy_diff_j_0_4 - 276 dy_abs_j_0_4_is_positive
   <= 0
 dx_diff_def_i_0_5: EMIB_cx_grid_var_0_5 - cx_grid_var_0 + dx_diff_i_0_5
   = 0
 dx_diff_def_j_0_5: EMIB_cx_grid_var_0_5 - cx_grid_var_5 + dx_diff_j_0_5
   = 0
 dy_diff_def_i_0_5: EMIB_cy_grid_var_0_5 - cy_grid_var_0 + dy_diff_i_0_5
   = 0
 dy_diff_def_j_0_5: EMIB_cy_grid_var_0_5 - cy_grid_var_5 + dy_diff_j_0_5
   = 0
 dx_abs_i_0_5_abs_ge_orig: dx_abs_i_0_5 - dx_diff_i_0_5
   - 276 dx_abs_i_0_5_is_positive >= -276
 dx_abs_i_0_5_abs_le_orig: dx_abs_i_0_5 - dx_diff_i_0_5
   + 276 dx_abs_i_0_5_is_positive <= 276
 dx_abs_i_0_5_abs_ge_neg_orig: dx_abs_i_0_5 + dx_diff_i_0_5
   + 276 dx_abs_i_0_5_is_positive >= 0
 dx_abs_i_0_5_abs_le_neg_orig: dx_abs_i_0_5 + dx_diff_i_0_5
   - 276 dx_abs_i_0_5_is_positive <= 0
 dx_abs_i_0_5_force_positive: dx_diff_i_0_5 - 276 dx_abs_i_0_5_is_positive
   >= -276
 dx_abs_i_0_5_force_negative: dx_diff_i_0_5 - 276 dx_abs_i_0_5_is_positive
   <= 0
 dy_abs_i_0_5_abs_ge_orig: dy_abs_i_0_5 - dy_diff_i_0_5
   - 276 dy_abs_i_0_5_is_positive >= -276
 dy_abs_i_0_5_abs_le_orig: dy_abs_i_0_5 - dy_diff_i_0_5
   + 276 dy_abs_i_0_5_is_positive <= 276
 dy_abs_i_0_5_abs_ge_neg_orig: dy_abs_i_0_5 + dy_diff_i_0_5
   + 276 dy_abs_i_0_5_is_positive >= 0
 dy_abs_i_0_5_abs_le_neg_orig: dy_abs_i_0_5 + dy_diff_i_0_5
   - 276 dy_abs_i_0_5_is_positive <= 0
 dy_abs_i_0_5_force_positive: dy_diff_i_0_5 - 276 dy_abs_i_0_5_is_positive
   >= -276
 dy_abs_i_0_5_force_negative: dy_diff_i_0_5 - 276 dy_abs_i_0_5_is_positive
   <= 0
 dx_abs_j_0_5_abs_ge_orig: dx_abs_j_0_5 - dx_diff_j_0_5
   - 276 dx_abs_j_0_5_is_positive >= -276
 dx_abs_j_0_5_abs_le_orig: dx_abs_j_0_5 - dx_diff_j_0_5
   + 276 dx_abs_j_0_5_is_positive <= 276
 dx_abs_j_0_5_abs_ge_neg_orig: dx_abs_j_0_5 + dx_diff_j_0_5
   + 276 dx_abs_j_0_5_is_positive >= 0
 dx_abs_j_0_5_abs_le_neg_orig: dx_abs_j_0_5 + dx_diff_j_0_5
   - 276 dx_abs_j_0_5_is_positive <= 0
 dx_abs_j_0_5_force_positive: dx_diff_j_0_5 - 276 dx_abs_j_0_5_is_positive
   >= -276
 dx_abs_j_0_5_force_negative: dx_diff_j_0_5 - 276 dx_abs_j_0_5_is_positive
   <= 0
 dy_abs_j_0_5_abs_ge_orig: dy_abs_j_0_5 - dy_diff_j_0_5
   - 276 dy_abs_j_0_5_is_positive >= -276
 dy_abs_j_0_5_abs_le_orig: dy_abs_j_0_5 - dy_diff_j_0_5
   + 276 dy_abs_j_0_5_is_positive <= 276
 dy_abs_j_0_5_abs_ge_neg_orig: dy_abs_j_0_5 + dy_diff_j_0_5
   + 276 dy_abs_j_0_5_is_positive >= 0
 dy_abs_j_0_5_abs_le_neg_orig: dy_abs_j_0_5 + dy_diff_j_0_5
   - 276 dy_abs_j_0_5_is_positive <= 0
 dy_abs_j_0_5_force_positive: dy_diff_j_0_5 - 276 dy_abs_j_0_5_is_positive
   >= -276
 dy_abs_j_0_5_force_negative: dy_diff_j_0_5 - 276 dy_abs_j_0_5_is_positive
   <= 0
 dx_diff_def_i_0_6: EMIB_cx_grid_var_0_6 - cx_grid_var_0 + dx_diff_i_0_6
   = 0
 dx_diff_def_j_0_6: EMIB_cx_grid_var_0_6 - cx_grid_var_6 + dx_diff_j_0_6
   = 0
 dy_diff_def_i_0_6: EMIB_cy_grid_var_0_6 - cy_grid_var_0 + dy_diff_i_0_6
   = 0
 dy_diff_def_j_0_6: EMIB_cy_grid_var_0_6 - cy_grid_var_6 + dy_diff_j_0_6
   = 0
 dx_abs_i_0_6_abs_ge_orig: dx_abs_i_0_6 - dx_diff_i_0_6
   - 276 dx_abs_i_0_6_is_positive >= -276
 dx_abs_i_0_6_abs_le_orig: dx_abs_i_0_6 - dx_diff_i_0_6
   + 276 dx_abs_i_0_6_is_positive <= 276
 dx_abs_i_0_6_abs_ge_neg_orig: dx_abs_i_0_6 + dx_diff_i_0_6
   + 276 dx_abs_i_0_6_is_positive >= 0
 dx_abs_i_0_6_abs_le_neg_orig: dx_abs_i_0_6 + dx_diff_i_0_6
   - 276 dx_abs_i_0_6_is_positive <= 0
 dx_abs_i_0_6_force_positive: dx_diff_i_0_6 - 276 dx_abs_i_0_6_is_positive
   >= -276
 dx_abs_i_0_6_force_negative: dx_diff_i_0_6 - 276 dx_abs_i_0_6_is_positive
   <= 0
 dy_abs_i_0_6_abs_ge_orig: dy_abs_i_0_6 - dy_diff_i_0_6
   - 276 dy_abs_i_0_6_is_positive >= -276
 dy_abs_i_0_6_abs_le_orig: dy_abs_i_0_6 - dy_diff_i_0_6
   + 276 dy_abs_i_0_6_is_positive <= 276
 dy_abs_i_0_6_abs_ge_neg_orig: dy_abs_i_0_6 + dy_diff_i_0_6
   + 276 dy_abs_i_0_6_is_positive >= 0
 dy_abs_i_0_6_abs_le_neg_orig: dy_abs_i_0_6 + dy_diff_i_0_6
   - 276 dy_abs_i_0_6_is_positive <= 0
 dy_abs_i_0_6_force_positive: dy_diff_i_0_6 - 276 dy_abs_i_0_6_is_positive
   >= -276
 dy_abs_i_0_6_force_negative: dy_diff_i_0_6 - 276 dy_abs_i_0_6_is_positive
   <= 0
 dx_abs_j_0_6_abs_ge_orig: dx_abs_j_0_6 - dx_diff_j_0_6
   - 276 dx_abs_j_0_6_is_positive >= -276
 dx_abs_j_0_6_abs_le_orig: dx_abs_j_0_6 - dx_diff_j_0_6
   + 276 dx_abs_j_0_6_is_positive <= 276
 dx_abs_j_0_6_abs_ge_neg_orig: dx_abs_j_0_6 + dx_diff_j_0_6
   + 276 dx_abs_j_0_6_is_positive >= 0
 dx_abs_j_0_6_abs_le_neg_orig: dx_abs_j_0_6 + dx_diff_j_0_6
   - 276 dx_abs_j_0_6_is_positive <= 0
 dx_abs_j_0_6_force_positive: dx_diff_j_0_6 - 276 dx_abs_j_0_6_is_positive
   >= -276
 dx_abs_j_0_6_force_negative: dx_diff_j_0_6 - 276 dx_abs_j_0_6_is_positive
   <= 0
 dy_abs_j_0_6_abs_ge_orig: dy_abs_j_0_6 - dy_diff_j_0_6
   - 276 dy_abs_j_0_6_is_positive >= -276
 dy_abs_j_0_6_abs_le_orig: dy_abs_j_0_6 - dy_diff_j_0_6
   + 276 dy_abs_j_0_6_is_positive <= 276
 dy_abs_j_0_6_abs_ge_neg_orig: dy_abs_j_0_6 + dy_diff_j_0_6
   + 276 dy_abs_j_0_6_is_positive >= 0
 dy_abs_j_0_6_abs_le_neg_orig: dy_abs_j_0_6 + dy_diff_j_0_6
   - 276 dy_abs_j_0_6_is_positive <= 0
 dy_abs_j_0_6_force_positive: dy_diff_j_0_6 - 276 dy_abs_j_0_6_is_positive
   >= -276
 dy_abs_j_0_6_force_negative: dy_diff_j_0_6 - 276 dy_abs_j_0_6_is_positive
   <= 0
 dx_diff_def_i_1_2: EMIB_cx_grid_var_1_2 - cx_grid_var_1 + dx_diff_i_1_2
   = 0
 dx_diff_def_j_1_2: EMIB_cx_grid_var_1_2 - cx_grid_var_2 + dx_diff_j_1_2
   = 0
 dy_diff_def_i_1_2: EMIB_cy_grid_var_1_2 - cy_grid_var_1 + dy_diff_i_1_2
   = 0
 dy_diff_def_j_1_2: EMIB_cy_grid_var_1_2 - cy_grid_var_2 + dy_diff_j_1_2
   = 0
 dx_abs_i_1_2_abs_ge_orig: dx_abs_i_1_2 - dx_diff_i_1_2
   - 276 dx_abs_i_1_2_is_positive >= -276
 dx_abs_i_1_2_abs_le_orig: dx_abs_i_1_2 - dx_diff_i_1_2
   + 276 dx_abs_i_1_2_is_positive <= 276
 dx_abs_i_1_2_abs_ge_neg_orig: dx_abs_i_1_2 + dx_diff_i_1_2
   + 276 dx_abs_i_1_2_is_positive >= 0
 dx_abs_i_1_2_abs_le_neg_orig: dx_abs_i_1_2 + dx_diff_i_1_2
   - 276 dx_abs_i_1_2_is_positive <= 0
 dx_abs_i_1_2_force_positive: dx_diff_i_1_2 - 276 dx_abs_i_1_2_is_positive
   >= -276
 dx_abs_i_1_2_force_negative: dx_diff_i_1_2 - 276 dx_abs_i_1_2_is_positive
   <= 0
 dy_abs_i_1_2_abs_ge_orig: dy_abs_i_1_2 - dy_diff_i_1_2
   - 276 dy_abs_i_1_2_is_positive >= -276
 dy_abs_i_1_2_abs_le_orig: dy_abs_i_1_2 - dy_diff_i_1_2
   + 276 dy_abs_i_1_2_is_positive <= 276
 dy_abs_i_1_2_abs_ge_neg_orig: dy_abs_i_1_2 + dy_diff_i_1_2
   + 276 dy_abs_i_1_2_is_positive >= 0
 dy_abs_i_1_2_abs_le_neg_orig: dy_abs_i_1_2 + dy_diff_i_1_2
   - 276 dy_abs_i_1_2_is_positive <= 0
 dy_abs_i_1_2_force_positive: dy_diff_i_1_2 - 276 dy_abs_i_1_2_is_positive
   >= -276
 dy_abs_i_1_2_force_negative: dy_diff_i_1_2 - 276 dy_abs_i_1_2_is_positive
   <= 0
 dx_abs_j_1_2_abs_ge_orig: dx_abs_j_1_2 - dx_diff_j_1_2
   - 276 dx_abs_j_1_2_is_positive >= -276
 dx_abs_j_1_2_abs_le_orig: dx_abs_j_1_2 - dx_diff_j_1_2
   + 276 dx_abs_j_1_2_is_positive <= 276
 dx_abs_j_1_2_abs_ge_neg_orig: dx_abs_j_1_2 + dx_diff_j_1_2
   + 276 dx_abs_j_1_2_is_positive >= 0
 dx_abs_j_1_2_abs_le_neg_orig: dx_abs_j_1_2 + dx_diff_j_1_2
   - 276 dx_abs_j_1_2_is_positive <= 0
 dx_abs_j_1_2_force_positive: dx_diff_j_1_2 - 276 dx_abs_j_1_2_is_positive
   >= -276
 dx_abs_j_1_2_force_negative: dx_diff_j_1_2 - 276 dx_abs_j_1_2_is_positive
   <= 0
 dy_abs_j_1_2_abs_ge_orig: dy_abs_j_1_2 - dy_diff_j_1_2
   - 276 dy_abs_j_1_2_is_positive >= -276
 dy_abs_j_1_2_abs_le_orig: dy_abs_j_1_2 - dy_diff_j_1_2
   + 276 dy_abs_j_1_2_is_positive <= 276
 dy_abs_j_1_2_abs_ge_neg_orig: dy_abs_j_1_2 + dy_diff_j_1_2
   + 276 dy_abs_j_1_2_is_positive >= 0
 dy_abs_j_1_2_abs_le_neg_orig: dy_abs_j_1_2 + dy_diff_j_1_2
   - 276 dy_abs_j_1_2_is_positive <= 0
 dy_abs_j_1_2_force_positive: dy_diff_j_1_2 - 276 dy_abs_j_1_2_is_positive
   >= -276
 dy_abs_j_1_2_force_negative: dy_diff_j_1_2 - 276 dy_abs_j_1_2_is_positive
   <= 0
 dx_diff_def_i_2_4: EMIB_cx_grid_var_2_4 - cx_grid_var_2 + dx_diff_i_2_4
   = 0
 dx_diff_def_j_2_4: EMIB_cx_grid_var_2_4 - cx_grid_var_4 + dx_diff_j_2_4
   = 0
 dy_diff_def_i_2_4: EMIB_cy_grid_var_2_4 - cy_grid_var_2 + dy_diff_i_2_4
   = 0
 dy_diff_def_j_2_4: EMIB_cy_grid_var_2_4 - cy_grid_var_4 + dy_diff_j_2_4
   = 0
 dx_abs_i_2_4_abs_ge_orig: dx_abs_i_2_4 - dx_diff_i_2_4
   - 276 dx_abs_i_2_4_is_positive >= -276
 dx_abs_i_2_4_abs_le_orig: dx_abs_i_2_4 - dx_diff_i_2_4
   + 276 dx_abs_i_2_4_is_positive <= 276
 dx_abs_i_2_4_abs_ge_neg_orig: dx_abs_i_2_4 + dx_diff_i_2_4
   + 276 dx_abs_i_2_4_is_positive >= 0
 dx_abs_i_2_4_abs_le_neg_orig: dx_abs_i_2_4 + dx_diff_i_2_4
   - 276 dx_abs_i_2_4_is_positive <= 0
 dx_abs_i_2_4_force_positive: dx_diff_i_2_4 - 276 dx_abs_i_2_4_is_positive
   >= -276
 dx_abs_i_2_4_force_negative: dx_diff_i_2_4 - 276 dx_abs_i_2_4_is_positive
   <= 0
 dy_abs_i_2_4_abs_ge_orig: dy_abs_i_2_4 - dy_diff_i_2_4
   - 276 dy_abs_i_2_4_is_positive >= -276
 dy_abs_i_2_4_abs_le_orig: dy_abs_i_2_4 - dy_diff_i_2_4
   + 276 dy_abs_i_2_4_is_positive <= 276
 dy_abs_i_2_4_abs_ge_neg_orig: dy_abs_i_2_4 + dy_diff_i_2_4
   + 276 dy_abs_i_2_4_is_positive >= 0
 dy_abs_i_2_4_abs_le_neg_orig: dy_abs_i_2_4 + dy_diff_i_2_4
   - 276 dy_abs_i_2_4_is_positive <= 0
 dy_abs_i_2_4_force_positive: dy_diff_i_2_4 - 276 dy_abs_i_2_4_is_positive
   >= -276
 dy_abs_i_2_4_force_negative: dy_diff_i_2_4 - 276 dy_abs_i_2_4_is_positive
   <= 0
 dx_abs_j_2_4_abs_ge_orig: dx_abs_j_2_4 - dx_diff_j_2_4
   - 276 dx_abs_j_2_4_is_positive >= -276
 dx_abs_j_2_4_abs_le_orig: dx_abs_j_2_4 - dx_diff_j_2_4
   + 276 dx_abs_j_2_4_is_positive <= 276
 dx_abs_j_2_4_abs_ge_neg_orig: dx_abs_j_2_4 + dx_diff_j_2_4
   + 276 dx_abs_j_2_4_is_positive >= 0
 dx_abs_j_2_4_abs_le_neg_orig: dx_abs_j_2_4 + dx_diff_j_2_4
   - 276 dx_abs_j_2_4_is_positive <= 0
 dx_abs_j_2_4_force_positive: dx_diff_j_2_4 - 276 dx_abs_j_2_4_is_positive
   >= -276
 dx_abs_j_2_4_force_negative: dx_diff_j_2_4 - 276 dx_abs_j_2_4_is_positive
   <= 0
 dy_abs_j_2_4_abs_ge_orig: dy_abs_j_2_4 - dy_diff_j_2_4
   - 276 dy_abs_j_2_4_is_positive >= -276
 dy_abs_j_2_4_abs_le_orig: dy_abs_j_2_4 - dy_diff_j_2_4
   + 276 dy_abs_j_2_4_is_positive <= 276
 dy_abs_j_2_4_abs_ge_neg_orig: dy_abs_j_2_4 + dy_diff_j_2_4
   + 276 dy_abs_j_2_4_is_positive >= 0
 dy_abs_j_2_4_abs_le_neg_orig: dy_abs_j_2_4 + dy_diff_j_2_4
   - 276 dy_abs_j_2_4_is_positive <= 0
 dy_abs_j_2_4_force_positive: dy_diff_j_2_4 - 276 dy_abs_j_2_4_is_positive
   >= -276
 dy_abs_j_2_4_force_negative: dy_diff_j_2_4 - 276 dy_abs_j_2_4_is_positive
   <= 0
 dx_diff_def_i_2_5: EMIB_cx_grid_var_2_5 - cx_grid_var_2 + dx_diff_i_2_5
   = 0
 dx_diff_def_j_2_5: EMIB_cx_grid_var_2_5 - cx_grid_var_5 + dx_diff_j_2_5
   = 0
 dy_diff_def_i_2_5: EMIB_cy_grid_var_2_5 - cy_grid_var_2 + dy_diff_i_2_5
   = 0
 dy_diff_def_j_2_5: EMIB_cy_grid_var_2_5 - cy_grid_var_5 + dy_diff_j_2_5
   = 0
 dx_abs_i_2_5_abs_ge_orig: dx_abs_i_2_5 - dx_diff_i_2_5
   - 276 dx_abs_i_2_5_is_positive >= -276
 dx_abs_i_2_5_abs_le_orig: dx_abs_i_2_5 - dx_diff_i_2_5
   + 276 dx_abs_i_2_5_is_positive <= 276
 dx_abs_i_2_5_abs_ge_neg_orig: dx_abs_i_2_5 + dx_diff_i_2_5
   + 276 dx_abs_i_2_5_is_positive >= 0
 dx_abs_i_2_5_abs_le_neg_orig: dx_abs_i_2_5 + dx_diff_i_2_5
   - 276 dx_abs_i_2_5_is_positive <= 0
 dx_abs_i_2_5_force_positive: dx_diff_i_2_5 - 276 dx_abs_i_2_5_is_positive
   >= -276
 dx_abs_i_2_5_force_negative: dx_diff_i_2_5 - 276 dx_abs_i_2_5_is_positive
   <= 0
 dy_abs_i_2_5_abs_ge_orig: dy_abs_i_2_5 - dy_diff_i_2_5
   - 276 dy_abs_i_2_5_is_positive >= -276
 dy_abs_i_2_5_abs_le_orig: dy_abs_i_2_5 - dy_diff_i_2_5
   + 276 dy_abs_i_2_5_is_positive <= 276
 dy_abs_i_2_5_abs_ge_neg_orig: dy_abs_i_2_5 + dy_diff_i_2_5
   + 276 dy_abs_i_2_5_is_positive >= 0
 dy_abs_i_2_5_abs_le_neg_orig: dy_abs_i_2_5 + dy_diff_i_2_5
   - 276 dy_abs_i_2_5_is_positive <= 0
 dy_abs_i_2_5_force_positive: dy_diff_i_2_5 - 276 dy_abs_i_2_5_is_positive
   >= -276
 dy_abs_i_2_5_force_negative: dy_diff_i_2_5 - 276 dy_abs_i_2_5_is_positive
   <= 0
 dx_abs_j_2_5_abs_ge_orig: dx_abs_j_2_5 - dx_diff_j_2_5
   - 276 dx_abs_j_2_5_is_positive >= -276
 dx_abs_j_2_5_abs_le_orig: dx_abs_j_2_5 - dx_diff_j_2_5
   + 276 dx_abs_j_2_5_is_positive <= 276
 dx_abs_j_2_5_abs_ge_neg_orig: dx_abs_j_2_5 + dx_diff_j_2_5
   + 276 dx_abs_j_2_5_is_positive >= 0
 dx_abs_j_2_5_abs_le_neg_orig: dx_abs_j_2_5 + dx_diff_j_2_5
   - 276 dx_abs_j_2_5_is_positive <= 0
 dx_abs_j_2_5_force_positive: dx_diff_j_2_5 - 276 dx_abs_j_2_5_is_positive
   >= -276
 dx_abs_j_2_5_force_negative: dx_diff_j_2_5 - 276 dx_abs_j_2_5_is_positive
   <= 0
 dy_abs_j_2_5_abs_ge_orig: dy_abs_j_2_5 - dy_diff_j_2_5
   - 276 dy_abs_j_2_5_is_positive >= -276
 dy_abs_j_2_5_abs_le_orig: dy_abs_j_2_5 - dy_diff_j_2_5
   + 276 dy_abs_j_2_5_is_positive <= 276
 dy_abs_j_2_5_abs_ge_neg_orig: dy_abs_j_2_5 + dy_diff_j_2_5
   + 276 dy_abs_j_2_5_is_positive >= 0
 dy_abs_j_2_5_abs_le_neg_orig: dy_abs_j_2_5 + dy_diff_j_2_5
   - 276 dy_abs_j_2_5_is_positive <= 0
 dy_abs_j_2_5_force_positive: dy_diff_j_2_5 - 276 dy_abs_j_2_5_is_positive
   >= -276
 dy_abs_j_2_5_force_negative: dy_diff_j_2_5 - 276 dy_abs_j_2_5_is_positive
   <= 0
 dx_diff_def_i_3_4: EMIB_cx_grid_var_3_4 - cx_grid_var_3 + dx_diff_i_3_4
   = 0
 dx_diff_def_j_3_4: EMIB_cx_grid_var_3_4 - cx_grid_var_4 + dx_diff_j_3_4
   = 0
 dy_diff_def_i_3_4: EMIB_cy_grid_var_3_4 - cy_grid_var_3 + dy_diff_i_3_4
   = 0
 dy_diff_def_j_3_4: EMIB_cy_grid_var_3_4 - cy_grid_var_4 + dy_diff_j_3_4
   = 0
 dx_abs_i_3_4_abs_ge_orig: dx_abs_i_3_4 - dx_diff_i_3_4
   - 276 dx_abs_i_3_4_is_positive >= -276
 dx_abs_i_3_4_abs_le_orig: dx_abs_i_3_4 - dx_diff_i_3_4
   + 276 dx_abs_i_3_4_is_positive <= 276
 dx_abs_i_3_4_abs_ge_neg_orig: dx_abs_i_3_4 + dx_diff_i_3_4
   + 276 dx_abs_i_3_4_is_positive >= 0
 dx_abs_i_3_4_abs_le_neg_orig: dx_abs_i_3_4 + dx_diff_i_3_4
   - 276 dx_abs_i_3_4_is_positive <= 0
 dx_abs_i_3_4_force_positive: dx_diff_i_3_4 - 276 dx_abs_i_3_4_is_positive
   >= -276
 dx_abs_i_3_4_force_negative: dx_diff_i_3_4 - 276 dx_abs_i_3_4_is_positive
   <= 0
 dy_abs_i_3_4_abs_ge_orig: dy_abs_i_3_4 - dy_diff_i_3_4
   - 276 dy_abs_i_3_4_is_positive >= -276
 dy_abs_i_3_4_abs_le_orig: dy_abs_i_3_4 - dy_diff_i_3_4
   + 276 dy_abs_i_3_4_is_positive <= 276
 dy_abs_i_3_4_abs_ge_neg_orig: dy_abs_i_3_4 + dy_diff_i_3_4
   + 276 dy_abs_i_3_4_is_positive >= 0
 dy_abs_i_3_4_abs_le_neg_orig: dy_abs_i_3_4 + dy_diff_i_3_4
   - 276 dy_abs_i_3_4_is_positive <= 0
 dy_abs_i_3_4_force_positive: dy_diff_i_3_4 - 276 dy_abs_i_3_4_is_positive
   >= -276
 dy_abs_i_3_4_force_negative: dy_diff_i_3_4 - 276 dy_abs_i_3_4_is_positive
   <= 0
 dx_abs_j_3_4_abs_ge_orig: dx_abs_j_3_4 - dx_diff_j_3_4
   - 276 dx_abs_j_3_4_is_positive >= -276
 dx_abs_j_3_4_abs_le_orig: dx_abs_j_3_4 - dx_diff_j_3_4
   + 276 dx_abs_j_3_4_is_positive <= 276
 dx_abs_j_3_4_abs_ge_neg_orig: dx_abs_j_3_4 + dx_diff_j_3_4
   + 276 dx_abs_j_3_4_is_positive >= 0
 dx_abs_j_3_4_abs_le_neg_orig: dx_abs_j_3_4 + dx_diff_j_3_4
   - 276 dx_abs_j_3_4_is_positive <= 0
 dx_abs_j_3_4_force_positive: dx_diff_j_3_4 - 276 dx_abs_j_3_4_is_positive
   >= -276
 dx_abs_j_3_4_force_negative: dx_diff_j_3_4 - 276 dx_abs_j_3_4_is_positive
   <= 0
 dy_abs_j_3_4_abs_ge_orig: dy_abs_j_3_4 - dy_diff_j_3_4
   - 276 dy_abs_j_3_4_is_positive >= -276
 dy_abs_j_3_4_abs_le_orig: dy_abs_j_3_4 - dy_diff_j_3_4
   + 276 dy_abs_j_3_4_is_positive <= 276
 dy_abs_j_3_4_abs_ge_neg_orig: dy_abs_j_3_4 + dy_diff_j_3_4
   + 276 dy_abs_j_3_4_is_positive >= 0
 dy_abs_j_3_4_abs_le_neg_orig: dy_abs_j_3_4 + dy_diff_j_3_4
   - 276 dy_abs_j_3_4_is_positive <= 0
 dy_abs_j_3_4_force_positive: dy_diff_j_3_4 - 276 dy_abs_j_3_4_is_positive
   >= -276
 dy_abs_j_3_4_force_negative: dy_diff_j_3_4 - 276 dy_abs_j_3_4_is_positive
   <= 0
 dx_diff_def_i_3_5: EMIB_cx_grid_var_3_5 - cx_grid_var_3 + dx_diff_i_3_5
   = 0
 dx_diff_def_j_3_5: EMIB_cx_grid_var_3_5 - cx_grid_var_5 + dx_diff_j_3_5
   = 0
 dy_diff_def_i_3_5: EMIB_cy_grid_var_3_5 - cy_grid_var_3 + dy_diff_i_3_5
   = 0
 dy_diff_def_j_3_5: EMIB_cy_grid_var_3_5 - cy_grid_var_5 + dy_diff_j_3_5
   = 0
 dx_abs_i_3_5_abs_ge_orig: dx_abs_i_3_5 - dx_diff_i_3_5
   - 276 dx_abs_i_3_5_is_positive >= -276
 dx_abs_i_3_5_abs_le_orig: dx_abs_i_3_5 - dx_diff_i_3_5
   + 276 dx_abs_i_3_5_is_positive <= 276
 dx_abs_i_3_5_abs_ge_neg_orig: dx_abs_i_3_5 + dx_diff_i_3_5
   + 276 dx_abs_i_3_5_is_positive >= 0
 dx_abs_i_3_5_abs_le_neg_orig: dx_abs_i_3_5 + dx_diff_i_3_5
   - 276 dx_abs_i_3_5_is_positive <= 0
 dx_abs_i_3_5_force_positive: dx_diff_i_3_5 - 276 dx_abs_i_3_5_is_positive
   >= -276
 dx_abs_i_3_5_force_negative: dx_diff_i_3_5 - 276 dx_abs_i_3_5_is_positive
   <= 0
 dy_abs_i_3_5_abs_ge_orig: dy_abs_i_3_5 - dy_diff_i_3_5
   - 276 dy_abs_i_3_5_is_positive >= -276
 dy_abs_i_3_5_abs_le_orig: dy_abs_i_3_5 - dy_diff_i_3_5
   + 276 dy_abs_i_3_5_is_positive <= 276
 dy_abs_i_3_5_abs_ge_neg_orig: dy_abs_i_3_5 + dy_diff_i_3_5
   + 276 dy_abs_i_3_5_is_positive >= 0
 dy_abs_i_3_5_abs_le_neg_orig: dy_abs_i_3_5 + dy_diff_i_3_5
   - 276 dy_abs_i_3_5_is_positive <= 0
 dy_abs_i_3_5_force_positive: dy_diff_i_3_5 - 276 dy_abs_i_3_5_is_positive
   >= -276
 dy_abs_i_3_5_force_negative: dy_diff_i_3_5 - 276 dy_abs_i_3_5_is_positive
   <= 0
 dx_abs_j_3_5_abs_ge_orig: dx_abs_j_3_5 - dx_diff_j_3_5
   - 276 dx_abs_j_3_5_is_positive >= -276
 dx_abs_j_3_5_abs_le_orig: dx_abs_j_3_5 - dx_diff_j_3_5
   + 276 dx_abs_j_3_5_is_positive <= 276
 dx_abs_j_3_5_abs_ge_neg_orig: dx_abs_j_3_5 + dx_diff_j_3_5
   + 276 dx_abs_j_3_5_is_positive >= 0
 dx_abs_j_3_5_abs_le_neg_orig: dx_abs_j_3_5 + dx_diff_j_3_5
   - 276 dx_abs_j_3_5_is_positive <= 0
 dx_abs_j_3_5_force_positive: dx_diff_j_3_5 - 276 dx_abs_j_3_5_is_positive
   >= -276
 dx_abs_j_3_5_force_negative: dx_diff_j_3_5 - 276 dx_abs_j_3_5_is_positive
   <= 0
 dy_abs_j_3_5_abs_ge_orig: dy_abs_j_3_5 - dy_diff_j_3_5
   - 276 dy_abs_j_3_5_is_positive >= -276
 dy_abs_j_3_5_abs_le_orig: dy_abs_j_3_5 - dy_diff_j_3_5
   + 276 dy_abs_j_3_5_is_positive <= 276
 dy_abs_j_3_5_abs_ge_neg_orig: dy_abs_j_3_5 + dy_diff_j_3_5
   + 276 dy_abs_j_3_5_is_positive >= 0
 dy_abs_j_3_5_abs_le_neg_orig: dy_abs_j_3_5 + dy_diff_j_3_5
   - 276 dy_abs_j_3_5_is_positive <= 0
 dy_abs_j_3_5_force_positive: dy_diff_j_3_5 - 276 dy_abs_j_3_5_is_positive
   >= -276
 dy_abs_j_3_5_force_negative: dy_diff_j_3_5 - 276 dy_abs_j_3_5_is_positive
   <= 0
 dx_diff_def_i_4_5: EMIB_cx_grid_var_4_5 - cx_grid_var_4 + dx_diff_i_4_5
   = 0
 dx_diff_def_j_4_5: EMIB_cx_grid_var_4_5 - cx_grid_var_5 + dx_diff_j_4_5
   = 0
 dy_diff_def_i_4_5: EMIB_cy_grid_var_4_5 - cy_grid_var_4 + dy_diff_i_4_5
   = 0
 dy_diff_def_j_4_5: EMIB_cy_grid_var_4_5 - cy_grid_var_5 + dy_diff_j_4_5
   = 0
 dx_abs_i_4_5_abs_ge_orig: dx_abs_i_4_5 - dx_diff_i_4_5
   - 276 dx_abs_i_4_5_is_positive >= -276
 dx_abs_i_4_5_abs_le_orig: dx_abs_i_4_5 - dx_diff_i_4_5
   + 276 dx_abs_i_4_5_is_positive <= 276
 dx_abs_i_4_5_abs_ge_neg_orig: dx_abs_i_4_5 + dx_diff_i_4_5
   + 276 dx_abs_i_4_5_is_positive >= 0
 dx_abs_i_4_5_abs_le_neg_orig: dx_abs_i_4_5 + dx_diff_i_4_5
   - 276 dx_abs_i_4_5_is_positive <= 0
 dx_abs_i_4_5_force_positive: dx_diff_i_4_5 - 276 dx_abs_i_4_5_is_positive
   >= -276
 dx_abs_i_4_5_force_negative: dx_diff_i_4_5 - 276 dx_abs_i_4_5_is_positive
   <= 0
 dy_abs_i_4_5_abs_ge_orig: dy_abs_i_4_5 - dy_diff_i_4_5
   - 276 dy_abs_i_4_5_is_positive >= -276
 dy_abs_i_4_5_abs_le_orig: dy_abs_i_4_5 - dy_diff_i_4_5
   + 276 dy_abs_i_4_5_is_positive <= 276
 dy_abs_i_4_5_abs_ge_neg_orig: dy_abs_i_4_5 + dy_diff_i_4_5
   + 276 dy_abs_i_4_5_is_positive >= 0
 dy_abs_i_4_5_abs_le_neg_orig: dy_abs_i_4_5 + dy_diff_i_4_5
   - 276 dy_abs_i_4_5_is_positive <= 0
 dy_abs_i_4_5_force_positive: dy_diff_i_4_5 - 276 dy_abs_i_4_5_is_positive
   >= -276
 dy_abs_i_4_5_force_negative: dy_diff_i_4_5 - 276 dy_abs_i_4_5_is_positive
   <= 0
 dx_abs_j_4_5_abs_ge_orig: dx_abs_j_4_5 - dx_diff_j_4_5
   - 276 dx_abs_j_4_5_is_positive >= -276
 dx_abs_j_4_5_abs_le_orig: dx_abs_j_4_5 - dx_diff_j_4_5
   + 276 dx_abs_j_4_5_is_positive <= 276
 dx_abs_j_4_5_abs_ge_neg_orig: dx_abs_j_4_5 + dx_diff_j_4_5
   + 276 dx_abs_j_4_5_is_positive >= 0
 dx_abs_j_4_5_abs_le_neg_orig: dx_abs_j_4_5 + dx_diff_j_4_5
   - 276 dx_abs_j_4_5_is_positive <= 0
 dx_abs_j_4_5_force_positive: dx_diff_j_4_5 - 276 dx_abs_j_4_5_is_positive
   >= -276
 dx_abs_j_4_5_force_negative: dx_diff_j_4_5 - 276 dx_abs_j_4_5_is_positive
   <= 0
 dy_abs_j_4_5_abs_ge_orig: dy_abs_j_4_5 - dy_diff_j_4_5
   - 276 dy_abs_j_4_5_is_positive >= -276
 dy_abs_j_4_5_abs_le_orig: dy_abs_j_4_5 - dy_diff_j_4_5
   + 276 dy_abs_j_4_5_is_positive <= 276
 dy_abs_j_4_5_abs_ge_neg_orig: dy_abs_j_4_5 + dy_diff_j_4_5
   + 276 dy_abs_j_4_5_is_positive >= 0
 dy_abs_j_4_5_abs_le_neg_orig: dy_abs_j_4_5 + dy_diff_j_4_5
   - 276 dy_abs_j_4_5_is_positive <= 0
 dy_abs_j_4_5_force_positive: dy_diff_j_4_5 - 276 dy_abs_j_4_5_is_positive
   >= -276
 dy_abs_j_4_5_force_negative: dy_diff_j_4_5 - 276 dy_abs_j_4_5_is_positive
   <= 0
 dx_diff_def_i_4_6: EMIB_cx_grid_var_4_6 - cx_grid_var_4 + dx_diff_i_4_6
   = 0
 dx_diff_def_j_4_6: EMIB_cx_grid_var_4_6 - cx_grid_var_6 + dx_diff_j_4_6
   = 0
 dy_diff_def_i_4_6: EMIB_cy_grid_var_4_6 - cy_grid_var_4 + dy_diff_i_4_6
   = 0
 dy_diff_def_j_4_6: EMIB_cy_grid_var_4_6 - cy_grid_var_6 + dy_diff_j_4_6
   = 0
 dx_abs_i_4_6_abs_ge_orig: dx_abs_i_4_6 - dx_diff_i_4_6
   - 276 dx_abs_i_4_6_is_positive >= -276
 dx_abs_i_4_6_abs_le_orig: dx_abs_i_4_6 - dx_diff_i_4_6
   + 276 dx_abs_i_4_6_is_positive <= 276
 dx_abs_i_4_6_abs_ge_neg_orig: dx_abs_i_4_6 + dx_diff_i_4_6
   + 276 dx_abs_i_4_6_is_positive >= 0
 dx_abs_i_4_6_abs_le_neg_orig: dx_abs_i_4_6 + dx_diff_i_4_6
   - 276 dx_abs_i_4_6_is_positive <= 0
 dx_abs_i_4_6_force_positive: dx_diff_i_4_6 - 276 dx_abs_i_4_6_is_positive
   >= -276
 dx_abs_i_4_6_force_negative: dx_diff_i_4_6 - 276 dx_abs_i_4_6_is_positive
   <= 0
 dy_abs_i_4_6_abs_ge_orig: dy_abs_i_4_6 - dy_diff_i_4_6
   - 276 dy_abs_i_4_6_is_positive >= -276
 dy_abs_i_4_6_abs_le_orig: dy_abs_i_4_6 - dy_diff_i_4_6
   + 276 dy_abs_i_4_6_is_positive <= 276
 dy_abs_i_4_6_abs_ge_neg_orig: dy_abs_i_4_6 + dy_diff_i_4_6
   + 276 dy_abs_i_4_6_is_positive >= 0
 dy_abs_i_4_6_abs_le_neg_orig: dy_abs_i_4_6 + dy_diff_i_4_6
   - 276 dy_abs_i_4_6_is_positive <= 0
 dy_abs_i_4_6_force_positive: dy_diff_i_4_6 - 276 dy_abs_i_4_6_is_positive
   >= -276
 dy_abs_i_4_6_force_negative: dy_diff_i_4_6 - 276 dy_abs_i_4_6_is_positive
   <= 0
 dx_abs_j_4_6_abs_ge_orig: dx_abs_j_4_6 - dx_diff_j_4_6
   - 276 dx_abs_j_4_6_is_positive >= -276
 dx_abs_j_4_6_abs_le_orig: dx_abs_j_4_6 - dx_diff_j_4_6
   + 276 dx_abs_j_4_6_is_positive <= 276
 dx_abs_j_4_6_abs_ge_neg_orig: dx_abs_j_4_6 + dx_diff_j_4_6
   + 276 dx_abs_j_4_6_is_positive >= 0
 dx_abs_j_4_6_abs_le_neg_orig: dx_abs_j_4_6 + dx_diff_j_4_6
   - 276 dx_abs_j_4_6_is_positive <= 0
 dx_abs_j_4_6_force_positive: dx_diff_j_4_6 - 276 dx_abs_j_4_6_is_positive
   >= -276
 dx_abs_j_4_6_force_negative: dx_diff_j_4_6 - 276 dx_abs_j_4_6_is_positive
   <= 0
 dy_abs_j_4_6_abs_ge_orig: dy_abs_j_4_6 - dy_diff_j_4_6
   - 276 dy_abs_j_4_6_is_positive >= -276
 dy_abs_j_4_6_abs_le_orig: dy_abs_j_4_6 - dy_diff_j_4_6
   + 276 dy_abs_j_4_6_is_positive <= 276
 dy_abs_j_4_6_abs_ge_neg_orig: dy_abs_j_4_6 + dy_diff_j_4_6
   + 276 dy_abs_j_4_6_is_positive >= 0
 dy_abs_j_4_6_abs_le_neg_orig: dy_abs_j_4_6 + dy_diff_j_4_6
   - 276 dy_abs_j_4_6_is_positive <= 0
 dy_abs_j_4_6_force_positive: dy_diff_j_4_6 - 276 dy_abs_j_4_6_is_positive
   >= -276
 dy_abs_j_4_6_force_negative: dy_diff_j_4_6 - 276 dy_abs_j_4_6_is_positive
   <= 0
 wirelength_def: wirelength - 128 dx_abs_3_6 - 128 dy_abs_3_6
   - 128 dx_abs_5_6 - 128 dy_abs_5_6 - 512 dx_abs_i_0_4 - 512 dy_abs_i_0_4
   - 512 dx_abs_j_0_4 - 512 dy_abs_j_0_4 - 256 dx_abs_i_0_5
   - 256 dy_abs_i_0_5 - 256 dx_abs_j_0_5 - 256 dy_abs_j_0_5
   - 256 dx_abs_i_0_6 - 256 dy_abs_i_0_6 - 256 dx_abs_j_0_6
   - 256 dy_abs_j_0_6 - 256 dx_abs_i_1_2 - 256 dy_abs_i_1_2
   - 256 dx_abs_j_1_2 - 256 dy_abs_j_1_2 - 256 dx_abs_i_2_4
   - 256 dy_abs_i_2_4 - 256 dx_abs_j_2_4 - 256 dy_abs_j_2_4
   - 512 dx_abs_i_2_5 - 512 dy_abs_i_2_5 - 512 dx_abs_j_2_5
   - 512 dy_abs_j_2_5 - 512 dx_abs_i_3_4 - 512 dy_abs_i_3_4
   - 512 dx_abs_j_3_4 - 512 dy_abs_j_3_4 - 256 dx_abs_i_3_5
   - 256 dy_abs_i_3_5 - 256 dx_abs_j_3_5 - 256 dy_abs_j_3_5
   - 256 dx_abs_i_4_5 - 256 dy_abs_i_4_5 - 256 dx_abs_j_4_5
   - 256 dy_abs_j_4_5 - 512 dx_abs_i_4_6 - 512 dy_abs_i_4_6
   - 512 dx_abs_j_4_6 - 512 dy_abs_j_4_6 = 0
 t_ge_scaled_mean: - 0.8 bbox_w - 0.8 bbox_h + bbox_area_proxy_t >= 0
Bounds
 6.16 <= w_var_0 <= 12.95
 6.16 <= h_var_0 <= 12.95
 4.9 <= w_var_1 <= 12.95
 4.9 <= h_var_1 <= 12.95
 7.56 <= w_var_2 <= 8.4
 7.56 <= h_var_2 <= 8.4
 11.62 <= w_var_3 <= 19.39
 11.62 <= h_var_3 <= 19.39
 12.18 <= w_var_4 <= 16.52
 12.18 <= h_var_4 <= 16.52
 8.82 <= w_var_5 <= 13.16
 8.82 <= h_var_5 <= 13.16
 12.95 <= w_var_6 <= 21.14
 12.95 <= h_var_6 <= 21.14
 1.7067 <= EMIB_w_var_0_4 <= 2
 1.7067 <= EMIB_h_var_0_4 <= 2
 0.8533 <= EMIB_w_var_0_5 <= 2
 0.8533 <= EMIB_h_var_0_5 <= 2
 0.8533 <= EMIB_w_var_0_6 <= 2
 0.8533 <= EMIB_h_var_0_6 <= 2
 0.8533 <= EMIB_w_var_1_2 <= 2
 0.8533 <= EMIB_h_var_1_2 <= 2
 0.8533 <= EMIB_w_var_2_4 <= 2
 0.8533 <= EMIB_h_var_2_4 <= 2
 1.7067 <= EMIB_w_var_2_5 <= 2
 1.7067 <= EMIB_h_var_2_5 <= 2
 1.7067 <= EMIB_w_var_3_4 <= 2
 1.7067 <= EMIB_h_var_3_4 <= 2
 0.8533 <= EMIB_w_var_3_5 <= 2
 0.8533 <= EMIB_h_var_3_5 <= 2
 0.8533 <= EMIB_w_var_4_5 <= 2
 0.8533 <= EMIB_h_var_4_5 <= 2
 1.7067 <= EMIB_w_var_4_6 <= 2
 1.7067 <= EMIB_h_var_4_6 <= 2
 x_grid_var_0 <= 138
 y_grid_var_0 <= 138
 x_grid_var_1 <= 138
 y_grid_var_1 <= 138
 x_grid_var_2 <= 138
 y_grid_var_2 <= 138
 x_grid_var_3 <= 138
 y_grid_var_3 <= 138
 x_grid_var_4 <= 138
 y_grid_var_4 <= 138
 x_grid_var_5 <= 138
 y_grid_var_5 <= 138
 x_grid_var_6 <= 138
 y_grid_var_6 <= 138
 EMIB_x_grid_var_0_4 <= 138
 EMIB_y_grid_var_0_4 <= 138
 EMIB_x_grid_var_0_5 <= 138
 EMIB_y_grid_var_0_5 <= 138
 EMIB_x_grid_var_0_6 <= 138
 EMIB_y_grid_var_0_6 <= 138
 EMIB_x_grid_var_1_2 <= 138
 EMIB_y_grid_var_1_2 <= 138
 EMIB_x_grid_var_2_4 <= 138
 EMIB_y_grid_var_2_4 <= 138
 EMIB_x_grid_var_2_5 <= 138
 EMIB_y_grid_var_2_5 <= 138
 EMIB_x_grid_var_3_4 <= 138
 EMIB_y_grid_var_3_4 <= 138
 EMIB_x_grid_var_3_5 <= 138
 EMIB_y_grid_var_3_5 <= 138
 EMIB_x_grid_var_4_5 <= 138
 EMIB_y_grid_var_4_5 <= 138
 EMIB_x_grid_var_4_6 <= 138
 EMIB_y_grid_var_4_6 <= 138
 EMIB_cx_grid_var_0_4 <= 276
 EMIB_cy_grid_var_0_4 <= 276
 EMIB_cx_grid_var_0_5 <= 276
 EMIB_cy_grid_var_0_5 <= 276
 EMIB_cx_grid_var_0_6 <= 276
 EMIB_cy_grid_var_0_6 <= 276
 EMIB_cx_grid_var_1_2 <= 276
 EMIB_cy_grid_var_1_2 <= 276
 EMIB_cx_grid_var_2_4 <= 276
 EMIB_cy_grid_var_2_4 <= 276
 EMIB_cx_grid_var_2_5 <= 276
 EMIB_cy_grid_var_2_5 <= 276
 EMIB_cx_grid_var_3_4 <= 276
 EMIB_cy_grid_var_3_4 <= 276
 EMIB_cx_grid_var_3_5 <= 276
 EMIB_cy_grid_var_3_5 <= 276
 EMIB_cx_grid_var_4_5 <= 276
 EMIB_cy_grid_var_4_5 <= 276
 EMIB_cx_grid_var_4_6 <= 276
 EMIB_cy_grid_var_4_6 <= 276
 cx_grid_var_0 <= 276
 cy_grid_var_0 <= 276
 cx_grid_var_1 <= 276
 cy_grid_var_1 <= 276
 cx_grid_var_2 <= 276
 cy_grid_var_2 <= 276
 cx_grid_var_3 <= 276
 cy_grid_var_3 <= 276
 cx_grid_var_4 <= 276
 cy_grid_var_4 <= 276
 cx_grid_var_5 <= 276
 cy_grid_var_5 <= 276
 cx_grid_var_6 <= 276
 cy_grid_var_6 <= 276
 cx_center <= 138
 cy_center <= 138
 bbox_min_x <= 138
 bbox_max_x <= 138
 bbox_min_y <= 138
 bbox_max_y <= 138
 bbox_w <= 138
 bbox_h <= 138
 aspect_ratio_penalty <= 138
 dx_grid_abs_pair_0_1 <= 138
 dy_grid_abs_pair_0_1 <= 138
 -138 <= dx_grid_diff_0_1 <= 138
 -138 <= dy_grid_diff_0_1 <= 138
 dist_curr_pair_0_1 <= 276
 -138 <= dx_center_diff_0 <= 138
 dx_center_abs_0 <= 138
 -138 <= dy_center_diff_0 <= 138
 dy_center_abs_0 <= 138
 dist_center_0 <= 276
 -138 <= dx_center_diff_1 <= 138
 dx_center_abs_1 <= 138
 -138 <= dy_center_diff_1 <= 138
 dy_center_abs_1 <= 138
 dist_center_1 <= 276
 wirelength <= 1.3565952e+07
 -138 <= dx_diff_3_6 <= 138
 -138 <= dy_diff_3_6 <= 138
 -138 <= dx_diff_5_6 <= 138
 -138 <= dy_diff_5_6 <= 138
 -138 <= dx_diff_i_0_4 <= 138
 -138 <= dy_diff_i_0_4 <= 138
 -138 <= dx_diff_j_0_4 <= 138
 -138 <= dy_diff_j_0_4 <= 138
 -138 <= dx_diff_i_0_5 <= 138
 -138 <= dy_diff_i_0_5 <= 138
 -138 <= dx_diff_j_0_5 <= 138
 -138 <= dy_diff_j_0_5 <= 138
 -138 <= dx_diff_i_0_6 <= 138
 -138 <= dy_diff_i_0_6 <= 138
 -138 <= dx_diff_j_0_6 <= 138
 -138 <= dy_diff_j_0_6 <= 138
 -138 <= dx_diff_i_1_2 <= 138
 -138 <= dy_diff_i_1_2 <= 138
 -138 <= dx_diff_j_1_2 <= 138
 -138 <= dy_diff_j_1_2 <= 138
 -138 <= dx_diff_i_2_4 <= 138
 -138 <= dy_diff_i_2_4 <= 138
 -138 <= dx_diff_j_2_4 <= 138
 -138 <= dy_diff_j_2_4 <= 138
 -138 <= dx_diff_i_2_5 <= 138
 -138 <= dy_diff_i_2_5 <= 138
 -138 <= dx_diff_j_2_5 <= 138
 -138 <= dy_diff_j_2_5 <= 138
 -138 <= dx_diff_i_3_4 <= 138
 -138 <= dy_diff_i_3_4 <= 138
 -138 <= dx_diff_j_3_4 <= 138
 -138 <= dy_diff_j_3_4 <= 138
 -138 <= dx_diff_i_3_5 <= 138
 -138 <= dy_diff_i_3_5 <= 138
 -138 <= dx_diff_j_3_5 <= 138
 -138 <= dy_diff_j_3_5 <= 138
 -138 <= dx_diff_i_4_5 <= 138
 -138 <= dy_diff_i_4_5 <= 138
 -138 <= dx_diff_j_4_5 <= 138
 -138 <= dy_diff_j_4_5 <= 138
 -138 <= dx_diff_i_4_6 <= 138
 -138 <= dy_diff_i_4_6 <= 138
 -138 <= dx_diff_j_4_6 <= 138
 -138 <= dy_diff_j_4_6 <= 138
 bbox_area_proxy_t <= 276
Binaries
 r_0 r_1 r_2 r_3 r_4 r_5 r_6 r_EMIB_0_4 r_EMIB_0_5 r_EMIB_0_6 r_EMIB_1_2
 r_EMIB_2_4 r_EMIB_2_5 r_EMIB_3_4 r_EMIB_3_5 r_EMIB_4_5 r_EMIB_4_6 z1_0_4
 z2_0_4 z1L_0_4 z1R_0_4 z2D_0_4 z2U_0_4 z1_0_5 z2_0_5 z1L_0_5 z1R_0_5
 z2D_0_5 z2U_0_5 z1_0_6 z2_0_6 z1L_0_6 z1R_0_6 z2D_0_6 z2U_0_6 z1_1_2
 z2_1_2 z1L_1_2 z1R_1_2 z2D_1_2 z2U_1_2 z1_2_4 z2_2_4 z1L_2_4 z1R_2_4
 z2D_2_4 z2U_2_4 z1_2_5 z2_2_5 z1L_2_5 z1R_2_5 z2D_2_5 z2U_2_5 z1_3_4
 z2_3_4 z1L_3_4 z1R_3_4 z2D_3_4 z2U_3_4 z1_3_5 z2_3_5 z1L_3_5 z1R_3_5
 z2D_3_5 z2U_3_5 z1_4_5 z2_4_5 z1L_4_5 z1R_4_5 z2D_4_5 z2U_4_5 z1_4_6
 z2_4_6 z1L_4_6 z1R_4_6 z2D_4_6 z2U_4_6 p_left_0_1 p_right_0_1 p_down_0_1
 p_up_0_1 p_left_0_2 p_right_0_2 p_down_0_2 p_up_0_2 p_left_0_3 p_right_0_3
 p_down_0_3 p_up_0_3 p_left_0_4 p_right_0_4 p_down_0_4 p_up_0_4 p_left_0_5
 p_right_0_5 p_down_0_5 p_up_0_5 p_left_0_6 p_right_0_6 p_down_0_6 p_up_0_6
 p_left_1_2 p_right_1_2 p_down_1_2 p_up_1_2 p_left_1_3 p_right_1_3
 p_down_1_3 p_up_1_3 p_left_1_4 p_right_1_4 p_down_1_4 p_up_1_4 p_left_1_5
 p_right_1_5 p_down_1_5 p_up_1_5 p_left_1_6 p_right_1_6 p_down_1_6 p_up_1_6
 p_left_2_3 p_right_2_3 p_down_2_3 p_up_2_3 p_left_2_4 p_right_2_4
 p_down_2_4 p_up_2_4 p_left_2_5 p_right_2_5 p_down_2_5 p_up_2_5 p_left_2_6
 p_right_2_6 p_down_2_6 p_up_2_6 p_left_3_4 p_right_3_4 p_down_3_4 p_up_3_4
 p_left_3_5 p_right_3_5 p_down_3_5 p_up_3_5 p_left_3_6 p_right_3_6
 p_down_3_6 p_up_3_6 p_left_4_5 p_right_4_5 p_down_4_5 p_up_4_5 p_left_4_6
 p_right_4_6 p_down_4_6 p_up_4_6 p_left_5_6 p_right_5_6 p_down_5_6 p_up_5_6
 p_EMIB_left_0_4_0_5 p_EMIB_right_0_4_0_5 p_EMIB_down_0_4_0_5
 p_EMIB_up_0_4_0_5 p_EMIB_left_0_4_0_6 p_EMIB_right_0_4_0_6
 p_EMIB_down_0_4_0_6 p_EMIB_up_0_4_0_6 p_EMIB_left_0_4_2_4
 p_EMIB_right_0_4_2_4 p_EMIB_down_0_4_2_4 p_EMIB_up_0_4_2_4
 p_EMIB_left_0_4_3_4 p_EMIB_right_0_4_3_4 p_EMIB_down_0_4_3_4
 p_EMIB_up_0_4_3_4 p_EMIB_left_0_4_4_5 p_EMIB_right_0_4_4_5
 p_EMIB_down_0_4_4_5 p_EMIB_up_0_4_4_5 p_EMIB_left_0_4_4_6
 p_EMIB_right_0_4_4_6 p_EMIB_down_0_4_4_6 p_EMIB_up_0_4_4_6
 p_EMIB_left_0_5_0_6 p_EMIB_right_0_5_0_6 p_EMIB_down_0_5_0_6
 p_EMIB_up_0_5_0_6 p_EMIB_left_0_5_2_5 p_EMIB_right_0_5_2_5
 p_EMIB_down_0_5_2_5 p_EMIB_up_0_5_2_5 p_EMIB_left_0_5_3_5
 p_EMIB_right_0_5_3_5 p_EMIB_down_0_5_3_5 p_EMIB_up_0_5_3_5
 p_EMIB_left_0_5_4_5 p_EMIB_right_0_5_4_5 p_EMIB_down_0_5_4_5
 p_EMIB_up_0_5_4_5 p_EMIB_left_0_6_4_6 p_EMIB_right_0_6_4_6
 p_EMIB_down_0_6_4_6 p_EMIB_up_0_6_4_6 p_EMIB_left_1_2_2_4
 p_EMIB_right_1_2_2_4 p_EMIB_down_1_2_2_4 p_EMIB_up_1_2_2_4
 p_EMIB_left_1_2_2_5 p_EMIB_right_1_2_2_5 p_EMIB_down_1_2_2_5
 p_EMIB_up_1_2_2_5 p_EMIB_left_2_4_2_5 p_EMIB_right_2_4_2_5
 p_EMIB_down_2_4_2_5 p_EMIB_up_2_4_2_5 p_EMIB_left_2_4_3_4
 p_EMIB_right_2_4_3_4 p_EMIB_down_2_4_3_4 p_EMIB_up_2_4_3_4
 p_EMIB_left_2_4_4_5 p_EMIB_right_2_4_4_5 p_EMIB_down_2_4_4_5
 p_EMIB_up_2_4_4_5 p_EMIB_left_2_4_4_6 p_EMIB_right_2_4_4_6
 p_EMIB_down_2_4_4_6 p_EMIB_up_2_4_4_6 p_EMIB_left_2_5_3_5
 p_EMIB_right_2_5_3_5 p_EMIB_down_2_5_3_5 p_EMIB_up_2_5_3_5
 p_EMIB_left_2_5_4_5 p_EMIB_right_2_5_4_5 p_EMIB_down_2_5_4_5
 p_EMIB_up_2_5_4_5 p_EMIB_left_3_4_3_5 p_EMIB_right_3_4_3_5
 p_EMIB_down_3_4_3_5 p_EMIB_up_3_4_3_5 p_EMIB_left_3_4_4_5
 p_EMIB_right_3_4_4_5 p_EMIB_down_3_4_4_5 p_EMIB_up_3_4_4_5
 p_EMIB_left_3_4_4_6 p_EMIB_right_3_4_4_6 p_EMIB_down_3_4_4_6
 p_EMIB_up_3_4_4_6 p_EMIB_left_3_5_4_5 p_EMIB_right_3_5_4_5
 p_EMIB_down_3_5_4_5 p_EMIB_up_3_5_4_5 p_EMIB_left_4_5_4_6
 p_EMIB_right_4_5_4_6 p_EMIB_down_4_5_4_6 p_EMIB_up_4_5_4_6
 dx_grid_abs_pair_0_1_is_positive dy_grid_abs_pair_0_1_is_positive
 dx_center_abs_0_is_positive dy_center_abs_0_is_positive
 dx_center_abs_1_is_positive dy_center_abs_1_is_positive
 dx_abs_3_6_is_positive dy_abs_3_6_is_positive dx_abs_5_6_is_positive
 dy_abs_5_6_is_positive dx_abs_i_0_4_is_positive dy_abs_i_0_4_is_positive
 dx_abs_j_0_4_is_positive dy_abs_j_0_4_is_positive dx_abs_i_0_5_is_positive
 dy_abs_i_0_5_is_positive dx_abs_j_0_5_is_positive dy_abs_j_0_5_is_positive
 dx_abs_i_0_6_is_positive dy_abs_i_0_6_is_positive dx_abs_j_0_6_is_positive
 dy_abs_j_0_6_is_positive dx_abs_i_1_2_is_positive dy_abs_i_1_2_is_positive
 dx_abs_j_1_2_is_positive dy_abs_j_1_2_is_positive dx_abs_i_2_4_is_positive
 dy_abs_i_2_4_is_positive dx_abs_j_2_4_is_positive dy_abs_j_2_4_is_positive
 dx_abs_i_2_5_is_positive dy_abs_i_2_5_is_positive dx_abs_j_2_5_is_positive
 dy_abs_j_2_5_is_positive dx_abs_i_3_4_is_positive dy_abs_i_3_4_is_positive
 dx_abs_j_3_4_is_positive dy_abs_j_3_4_is_positive dx_abs_i_3_5_is_positive
 dy_abs_i_3_5_is_positive dx_abs_j_3_5_is_positive dy_abs_j_3_5_is_positive
 dx_abs_i_4_5_is_positive dy_abs_i_4_5_is_positive dx_abs_j_4_5_is_positive
 dy_abs_j_4_5_is_positive dx_abs_i_4_6_is_positive dy_abs_i_4_6_is_positive
 dx_abs_j_4_6_is_positive dy_abs_j_4_6_is_positive
End
