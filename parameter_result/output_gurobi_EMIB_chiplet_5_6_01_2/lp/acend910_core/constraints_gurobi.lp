\ Model ChipletPlacementGrid
\ LP format - for model browsing. Use MPS format to capture full model detail.
\ Signature: 0x875df57e6a56a36a
Minimize
  0.00257201646090535 aspect_ratio_penalty - 1.93858e-06 power_aware_penalty
   + 2.594911799096688e-04 wirelength
   + 0.0952851612628304 bbox_area_proxy_t
Subject To
 width_rotation_0: - 16.9 r_0 + w_var_0 = 14.5
 height_rotation_0: 16.9 r_0 + h_var_0 = 31.4
 x_grid_var_ub_0: w_var_0 + x_grid_var_0 <= 135
 y_grid_var_ub_0: h_var_0 + y_grid_var_0 <= 135
 width_rotation_1: - 5.5 r_1 + w_var_1 = 10.5
 height_rotation_1: 5.5 r_1 + h_var_1 = 16
 x_grid_var_ub_1: w_var_1 + x_grid_var_1 <= 135
 y_grid_var_ub_1: h_var_1 + y_grid_var_1 <= 135
 width_rotation_2: - 4.12 r_2 + w_var_2 = 7.75
 height_rotation_2: 4.12 r_2 + h_var_2 = 11.87
 x_grid_var_ub_2: w_var_2 + x_grid_var_2 <= 135
 y_grid_var_ub_2: h_var_2 + y_grid_var_2 <= 135
 width_rotation_3: - 4.12 r_3 + w_var_3 = 7.75
 height_rotation_3: 4.12 r_3 + h_var_3 = 11.87
 x_grid_var_ub_3: w_var_3 + x_grid_var_3 <= 135
 y_grid_var_ub_3: h_var_3 + y_grid_var_3 <= 135
 width_rotation_4: - 4.12 r_4 + w_var_4 = 7.75
 height_rotation_4: 4.12 r_4 + h_var_4 = 11.87
 x_grid_var_ub_4: w_var_4 + x_grid_var_4 <= 135
 y_grid_var_ub_4: h_var_4 + y_grid_var_4 <= 135
 width_rotation_5: - 4.12 r_5 + w_var_5 = 7.75
 height_rotation_5: 4.12 r_5 + h_var_5 = 11.87
 x_grid_var_ub_5: w_var_5 + x_grid_var_5 <= 135
 y_grid_var_ub_5: h_var_5 + y_grid_var_5 <= 135
 EMIB_width_rotation_0_2: 1.1467 r_EMIB_0_2 + EMIB_w_var_0_2 = 2
 EMIB_height_rotation_0_2: - 1.1467 r_EMIB_0_2 + EMIB_h_var_0_2 = 0.8533
 EMIB_x_grid_var_ub_0_2: EMIB_w_var_0_2 + EMIB_x_grid_var_0_2 <= 135
 EMIB_y_grid_var_ub_0_2: EMIB_h_var_0_2 + EMIB_y_grid_var_0_2 <= 135
 EMIB_width_rotation_0_3: 1.1467 r_EMIB_0_3 + EMIB_w_var_0_3 = 2
 EMIB_height_rotation_0_3: - 1.1467 r_EMIB_0_3 + EMIB_h_var_0_3 = 0.8533
 EMIB_x_grid_var_ub_0_3: EMIB_w_var_0_3 + EMIB_x_grid_var_0_3 <= 135
 EMIB_y_grid_var_ub_0_3: EMIB_h_var_0_3 + EMIB_y_grid_var_0_3 <= 135
 EMIB_width_rotation_0_4: 1.1467 r_EMIB_0_4 + EMIB_w_var_0_4 = 2
 EMIB_height_rotation_0_4: - 1.1467 r_EMIB_0_4 + EMIB_h_var_0_4 = 0.8533
 EMIB_x_grid_var_ub_0_4: EMIB_w_var_0_4 + EMIB_x_grid_var_0_4 <= 135
 EMIB_y_grid_var_ub_0_4: EMIB_h_var_0_4 + EMIB_y_grid_var_0_4 <= 135
 EMIB_width_rotation_0_5: 1.1467 r_EMIB_0_5 + EMIB_w_var_0_5 = 2
 EMIB_height_rotation_0_5: - 1.1467 r_EMIB_0_5 + EMIB_h_var_0_5 = 0.8533
 EMIB_x_grid_var_ub_0_5: EMIB_w_var_0_5 + EMIB_x_grid_var_0_5 <= 135
 EMIB_y_grid_var_ub_0_5: EMIB_h_var_0_5 + EMIB_y_grid_var_0_5 <= 135
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
 EMIB_cx_def_0_2: - 0.5 EMIB_w_var_0_2 - EMIB_x_grid_var_0_2
   + EMIB_cx_grid_var_0_2 = 0
 EMIB_cy_def_0_2: - 0.5 EMIB_h_var_0_2 - EMIB_y_grid_var_0_2
   + EMIB_cy_grid_var_0_2 = 0
 EMIB_cx_def_0_3: - 0.5 EMIB_w_var_0_3 - EMIB_x_grid_var_0_3
   + EMIB_cx_grid_var_0_3 = 0
 EMIB_cy_def_0_3: - 0.5 EMIB_h_var_0_3 - EMIB_y_grid_var_0_3
   + EMIB_cy_grid_var_0_3 = 0
 EMIB_cx_def_0_4: - 0.5 EMIB_w_var_0_4 - EMIB_x_grid_var_0_4
   + EMIB_cx_grid_var_0_4 = 0
 EMIB_cy_def_0_4: - 0.5 EMIB_h_var_0_4 - EMIB_y_grid_var_0_4
   + EMIB_cy_grid_var_0_4 = 0
 EMIB_cx_def_0_5: - 0.5 EMIB_w_var_0_5 - EMIB_x_grid_var_0_5
   + EMIB_cx_grid_var_0_5 = 0
 EMIB_cy_def_0_5: - 0.5 EMIB_h_var_0_5 - EMIB_y_grid_var_0_5
   + EMIB_cy_grid_var_0_5 = 0
 must_adjacent_sb_0_2: z1_0_2 + z2_0_2 = 1
 horizontal_direction_sb_0_2: - z1_0_2 + z1L_0_2 + z1R_0_2 = 0
 vertical_direction_sb_0_2: - z2_0_2 + z2D_0_2 + z2U_0_2 = 0
 EMIB_rotate_eq_z2_0_2: r_EMIB_0_2 - z2_0_2 = 0
 horizontal_left_dist_lb_0_2: - w_var_0 - x_grid_var_0 + x_grid_var_2
   - 270 z1L_0_2 >= -270
 EMIB_left_overlap_0_2: w_var_0 + x_grid_var_0 - EMIB_x_grid_var_0_2
   - 270 z1L_0_2 >= -269.001
 EMIB_right_overlap_0_2: EMIB_w_var_0_2 - x_grid_var_2
   + EMIB_x_grid_var_0_2 - 270 z1L_0_2 >= -269.001
 horizontal_right_dist_lb_0_2: - w_var_2 + x_grid_var_0 - x_grid_var_2
   - 270 z1R_0_2 >= -270
 EMIB_left_overlap_right_0_2: w_var_2 + x_grid_var_2 - EMIB_x_grid_var_0_2
   - 270 z1R_0_2 >= -269.001
 EMIB_right_overlap_right_0_2: EMIB_w_var_0_2 - x_grid_var_0
   + EMIB_x_grid_var_0_2 - 270 z1R_0_2 >= -269.001
 vertical_down_dist_lb_0_2: - h_var_0 - y_grid_var_0 + y_grid_var_2
   - 270 z2D_0_2 >= -270
 EMIB_bottom_overlap_down_0_2: h_var_0 + y_grid_var_0 - EMIB_y_grid_var_0_2
   - 270 z2D_0_2 >= -269.001
 EMIB_top_overlap_down_0_2: EMIB_h_var_0_2 - y_grid_var_2
   + EMIB_y_grid_var_0_2 - 270 z2D_0_2 >= -269.001
 vertical_up_dist_lb_0_2: - h_var_2 + y_grid_var_0 - y_grid_var_2
   - 270 z2U_0_2 >= -270
 EMIB_bottom_overlap_up_0_2: h_var_2 + y_grid_var_2 - EMIB_y_grid_var_0_2
   - 270 z2U_0_2 >= -269.001
 EMIB_top_overlap_up_0_2: EMIB_h_var_0_2 - y_grid_var_0
   + EMIB_y_grid_var_0_2 - 270 z2U_0_2 >= -269.001
 shared_yi_ub1_0_2: h_var_0 - EMIB_h_var_0_2 + y_grid_var_0
   - EMIB_y_grid_var_0_2 - 270 z1_0_2 >= -270
 shared_yi_ub2_0_2: y_grid_var_0 - EMIB_y_grid_var_0_2 + 270 z1_0_2 <= 270
 shared_yj_ub1_0_2: h_var_2 - EMIB_h_var_0_2 + y_grid_var_2
   - EMIB_y_grid_var_0_2 - 270 z1_0_2 >= -270
 shared_yj_ub2_0_2: y_grid_var_2 - EMIB_y_grid_var_0_2 + 270 z1_0_2 <= 270
 shared_xi_ub1_0_2: w_var_0 - EMIB_w_var_0_2 + x_grid_var_0
   - EMIB_x_grid_var_0_2 - 270 z2_0_2 >= -270
 shared_xi_ub2_0_2: x_grid_var_0 - EMIB_x_grid_var_0_2 + 270 z2_0_2 <= 270
 shared_xj_ub1_0_2: w_var_2 - EMIB_w_var_0_2 + x_grid_var_2
   - EMIB_x_grid_var_0_2 - 270 z2_0_2 >= -270
 shared_xj_ub2_0_2: x_grid_var_2 - EMIB_x_grid_var_0_2 + 270 z2_0_2 <= 270
 must_adjacent_sb_0_3: z1_0_3 + z2_0_3 = 1
 horizontal_direction_sb_0_3: - z1_0_3 + z1L_0_3 + z1R_0_3 = 0
 vertical_direction_sb_0_3: - z2_0_3 + z2D_0_3 + z2U_0_3 = 0
 EMIB_rotate_eq_z2_0_3: r_EMIB_0_3 - z2_0_3 = 0
 horizontal_left_dist_lb_0_3: - w_var_0 - x_grid_var_0 + x_grid_var_3
   - 270 z1L_0_3 >= -270
 EMIB_left_overlap_0_3: w_var_0 + x_grid_var_0 - EMIB_x_grid_var_0_3
   - 270 z1L_0_3 >= -269.001
 EMIB_right_overlap_0_3: EMIB_w_var_0_3 - x_grid_var_3
   + EMIB_x_grid_var_0_3 - 270 z1L_0_3 >= -269.001
 horizontal_right_dist_lb_0_3: - w_var_3 + x_grid_var_0 - x_grid_var_3
   - 270 z1R_0_3 >= -270
 EMIB_left_overlap_right_0_3: w_var_3 + x_grid_var_3 - EMIB_x_grid_var_0_3
   - 270 z1R_0_3 >= -269.001
 EMIB_right_overlap_right_0_3: EMIB_w_var_0_3 - x_grid_var_0
   + EMIB_x_grid_var_0_3 - 270 z1R_0_3 >= -269.001
 vertical_down_dist_lb_0_3: - h_var_0 - y_grid_var_0 + y_grid_var_3
   - 270 z2D_0_3 >= -270
 EMIB_bottom_overlap_down_0_3: h_var_0 + y_grid_var_0 - EMIB_y_grid_var_0_3
   - 270 z2D_0_3 >= -269.001
 EMIB_top_overlap_down_0_3: EMIB_h_var_0_3 - y_grid_var_3
   + EMIB_y_grid_var_0_3 - 270 z2D_0_3 >= -269.001
 vertical_up_dist_lb_0_3: - h_var_3 + y_grid_var_0 - y_grid_var_3
   - 270 z2U_0_3 >= -270
 EMIB_bottom_overlap_up_0_3: h_var_3 + y_grid_var_3 - EMIB_y_grid_var_0_3
   - 270 z2U_0_3 >= -269.001
 EMIB_top_overlap_up_0_3: EMIB_h_var_0_3 - y_grid_var_0
   + EMIB_y_grid_var_0_3 - 270 z2U_0_3 >= -269.001
 shared_yi_ub1_0_3: h_var_0 - EMIB_h_var_0_3 + y_grid_var_0
   - EMIB_y_grid_var_0_3 - 270 z1_0_3 >= -270
 shared_yi_ub2_0_3: y_grid_var_0 - EMIB_y_grid_var_0_3 + 270 z1_0_3 <= 270
 shared_yj_ub1_0_3: h_var_3 - EMIB_h_var_0_3 + y_grid_var_3
   - EMIB_y_grid_var_0_3 - 270 z1_0_3 >= -270
 shared_yj_ub2_0_3: y_grid_var_3 - EMIB_y_grid_var_0_3 + 270 z1_0_3 <= 270
 shared_xi_ub1_0_3: w_var_0 - EMIB_w_var_0_3 + x_grid_var_0
   - EMIB_x_grid_var_0_3 - 270 z2_0_3 >= -270
 shared_xi_ub2_0_3: x_grid_var_0 - EMIB_x_grid_var_0_3 + 270 z2_0_3 <= 270
 shared_xj_ub1_0_3: w_var_3 - EMIB_w_var_0_3 + x_grid_var_3
   - EMIB_x_grid_var_0_3 - 270 z2_0_3 >= -270
 shared_xj_ub2_0_3: x_grid_var_3 - EMIB_x_grid_var_0_3 + 270 z2_0_3 <= 270
 must_adjacent_sb_0_4: z1_0_4 + z2_0_4 = 1
 horizontal_direction_sb_0_4: - z1_0_4 + z1L_0_4 + z1R_0_4 = 0
 vertical_direction_sb_0_4: - z2_0_4 + z2D_0_4 + z2U_0_4 = 0
 EMIB_rotate_eq_z2_0_4: r_EMIB_0_4 - z2_0_4 = 0
 horizontal_left_dist_lb_0_4: - w_var_0 - x_grid_var_0 + x_grid_var_4
   - 270 z1L_0_4 >= -270
 EMIB_left_overlap_0_4: w_var_0 + x_grid_var_0 - EMIB_x_grid_var_0_4
   - 270 z1L_0_4 >= -269.001
 EMIB_right_overlap_0_4: EMIB_w_var_0_4 - x_grid_var_4
   + EMIB_x_grid_var_0_4 - 270 z1L_0_4 >= -269.001
 horizontal_right_dist_lb_0_4: - w_var_4 + x_grid_var_0 - x_grid_var_4
   - 270 z1R_0_4 >= -270
 EMIB_left_overlap_right_0_4: w_var_4 + x_grid_var_4 - EMIB_x_grid_var_0_4
   - 270 z1R_0_4 >= -269.001
 EMIB_right_overlap_right_0_4: EMIB_w_var_0_4 - x_grid_var_0
   + EMIB_x_grid_var_0_4 - 270 z1R_0_4 >= -269.001
 vertical_down_dist_lb_0_4: - h_var_0 - y_grid_var_0 + y_grid_var_4
   - 270 z2D_0_4 >= -270
 EMIB_bottom_overlap_down_0_4: h_var_0 + y_grid_var_0 - EMIB_y_grid_var_0_4
   - 270 z2D_0_4 >= -269.001
 EMIB_top_overlap_down_0_4: EMIB_h_var_0_4 - y_grid_var_4
   + EMIB_y_grid_var_0_4 - 270 z2D_0_4 >= -269.001
 vertical_up_dist_lb_0_4: - h_var_4 + y_grid_var_0 - y_grid_var_4
   - 270 z2U_0_4 >= -270
 EMIB_bottom_overlap_up_0_4: h_var_4 + y_grid_var_4 - EMIB_y_grid_var_0_4
   - 270 z2U_0_4 >= -269.001
 EMIB_top_overlap_up_0_4: EMIB_h_var_0_4 - y_grid_var_0
   + EMIB_y_grid_var_0_4 - 270 z2U_0_4 >= -269.001
 shared_yi_ub1_0_4: h_var_0 - EMIB_h_var_0_4 + y_grid_var_0
   - EMIB_y_grid_var_0_4 - 270 z1_0_4 >= -270
 shared_yi_ub2_0_4: y_grid_var_0 - EMIB_y_grid_var_0_4 + 270 z1_0_4 <= 270
 shared_yj_ub1_0_4: h_var_4 - EMIB_h_var_0_4 + y_grid_var_4
   - EMIB_y_grid_var_0_4 - 270 z1_0_4 >= -270
 shared_yj_ub2_0_4: y_grid_var_4 - EMIB_y_grid_var_0_4 + 270 z1_0_4 <= 270
 shared_xi_ub1_0_4: w_var_0 - EMIB_w_var_0_4 + x_grid_var_0
   - EMIB_x_grid_var_0_4 - 270 z2_0_4 >= -270
 shared_xi_ub2_0_4: x_grid_var_0 - EMIB_x_grid_var_0_4 + 270 z2_0_4 <= 270
 shared_xj_ub1_0_4: w_var_4 - EMIB_w_var_0_4 + x_grid_var_4
   - EMIB_x_grid_var_0_4 - 270 z2_0_4 >= -270
 shared_xj_ub2_0_4: x_grid_var_4 - EMIB_x_grid_var_0_4 + 270 z2_0_4 <= 270
 must_adjacent_sb_0_5: z1_0_5 + z2_0_5 = 1
 horizontal_direction_sb_0_5: - z1_0_5 + z1L_0_5 + z1R_0_5 = 0
 vertical_direction_sb_0_5: - z2_0_5 + z2D_0_5 + z2U_0_5 = 0
 EMIB_rotate_eq_z2_0_5: r_EMIB_0_5 - z2_0_5 = 0
 horizontal_left_dist_lb_0_5: - w_var_0 - x_grid_var_0 + x_grid_var_5
   - 270 z1L_0_5 >= -270
 EMIB_left_overlap_0_5: w_var_0 + x_grid_var_0 - EMIB_x_grid_var_0_5
   - 270 z1L_0_5 >= -269.001
 EMIB_right_overlap_0_5: EMIB_w_var_0_5 - x_grid_var_5
   + EMIB_x_grid_var_0_5 - 270 z1L_0_5 >= -269.001
 horizontal_right_dist_lb_0_5: - w_var_5 + x_grid_var_0 - x_grid_var_5
   - 270 z1R_0_5 >= -270
 EMIB_left_overlap_right_0_5: w_var_5 + x_grid_var_5 - EMIB_x_grid_var_0_5
   - 270 z1R_0_5 >= -269.001
 EMIB_right_overlap_right_0_5: EMIB_w_var_0_5 - x_grid_var_0
   + EMIB_x_grid_var_0_5 - 270 z1R_0_5 >= -269.001
 vertical_down_dist_lb_0_5: - h_var_0 - y_grid_var_0 + y_grid_var_5
   - 270 z2D_0_5 >= -270
 EMIB_bottom_overlap_down_0_5: h_var_0 + y_grid_var_0 - EMIB_y_grid_var_0_5
   - 270 z2D_0_5 >= -269.001
 EMIB_top_overlap_down_0_5: EMIB_h_var_0_5 - y_grid_var_5
   + EMIB_y_grid_var_0_5 - 270 z2D_0_5 >= -269.001
 vertical_up_dist_lb_0_5: - h_var_5 + y_grid_var_0 - y_grid_var_5
   - 270 z2U_0_5 >= -270
 EMIB_bottom_overlap_up_0_5: h_var_5 + y_grid_var_5 - EMIB_y_grid_var_0_5
   - 270 z2U_0_5 >= -269.001
 EMIB_top_overlap_up_0_5: EMIB_h_var_0_5 - y_grid_var_0
   + EMIB_y_grid_var_0_5 - 270 z2U_0_5 >= -269.001
 shared_yi_ub1_0_5: h_var_0 - EMIB_h_var_0_5 + y_grid_var_0
   - EMIB_y_grid_var_0_5 - 270 z1_0_5 >= -270
 shared_yi_ub2_0_5: y_grid_var_0 - EMIB_y_grid_var_0_5 + 270 z1_0_5 <= 270
 shared_yj_ub1_0_5: h_var_5 - EMIB_h_var_0_5 + y_grid_var_5
   - EMIB_y_grid_var_0_5 - 270 z1_0_5 >= -270
 shared_yj_ub2_0_5: y_grid_var_5 - EMIB_y_grid_var_0_5 + 270 z1_0_5 <= 270
 shared_xi_ub1_0_5: w_var_0 - EMIB_w_var_0_5 + x_grid_var_0
   - EMIB_x_grid_var_0_5 - 270 z2_0_5 >= -270
 shared_xi_ub2_0_5: x_grid_var_0 - EMIB_x_grid_var_0_5 + 270 z2_0_5 <= 270
 shared_xj_ub1_0_5: w_var_5 - EMIB_w_var_0_5 + x_grid_var_5
   - EMIB_x_grid_var_0_5 - 270 z2_0_5 >= -270
 shared_xj_ub2_0_5: x_grid_var_5 - EMIB_x_grid_var_0_5 + 270 z2_0_5 <= 270
 non_overlap_any_0_1: p_left_0_1 + p_right_0_1 + p_down_0_1 + p_up_0_1
   >= 1
 non_overlap_left_0_1: w_var_0 + x_grid_var_0 - x_grid_var_1
   + 270 p_left_0_1 <= 270
 non_overlap_left_rev_0_1: - w_var_0 - x_grid_var_0 + x_grid_var_1
   - 270 p_left_0_1 <= 0
 non_overlap_right_0_1: w_var_1 - x_grid_var_0 + x_grid_var_1
   + 270 p_right_0_1 <= 270
 non_overlap_right_rev_0_1: - w_var_1 + x_grid_var_0 - x_grid_var_1
   - 270 p_right_0_1 <= 0
 non_overlap_down_0_1: h_var_0 + y_grid_var_0 - y_grid_var_1
   + 270 p_down_0_1 <= 270
 non_overlap_down_rev_0_1: - h_var_0 - y_grid_var_0 + y_grid_var_1
   - 270 p_down_0_1 <= 0
 non_overlap_up_0_1: h_var_1 - y_grid_var_0 + y_grid_var_1 + 270 p_up_0_1
   <= 270
 non_overlap_up_rev_0_1: - h_var_1 + y_grid_var_0 - y_grid_var_1
   - 270 p_up_0_1 <= 0
 non_overlap_any_0_2: p_left_0_2 + p_right_0_2 + p_down_0_2 + p_up_0_2
   >= 1
 non_overlap_left_0_2: w_var_0 + x_grid_var_0 - x_grid_var_2
   + 270 p_left_0_2 <= 270
 non_overlap_left_rev_0_2: - w_var_0 - x_grid_var_0 + x_grid_var_2
   - 270 p_left_0_2 <= 0
 non_overlap_right_0_2: w_var_2 - x_grid_var_0 + x_grid_var_2
   + 270 p_right_0_2 <= 270
 non_overlap_right_rev_0_2: - w_var_2 + x_grid_var_0 - x_grid_var_2
   - 270 p_right_0_2 <= 0
 non_overlap_down_0_2: h_var_0 + y_grid_var_0 - y_grid_var_2
   + 270 p_down_0_2 <= 270
 non_overlap_down_rev_0_2: - h_var_0 - y_grid_var_0 + y_grid_var_2
   - 270 p_down_0_2 <= 0
 non_overlap_up_0_2: h_var_2 - y_grid_var_0 + y_grid_var_2 + 270 p_up_0_2
   <= 270
 non_overlap_up_rev_0_2: - h_var_2 + y_grid_var_0 - y_grid_var_2
   - 270 p_up_0_2 <= 0
 non_overlap_any_0_3: p_left_0_3 + p_right_0_3 + p_down_0_3 + p_up_0_3
   >= 1
 non_overlap_left_0_3: w_var_0 + x_grid_var_0 - x_grid_var_3
   + 270 p_left_0_3 <= 270
 non_overlap_left_rev_0_3: - w_var_0 - x_grid_var_0 + x_grid_var_3
   - 270 p_left_0_3 <= 0
 non_overlap_right_0_3: w_var_3 - x_grid_var_0 + x_grid_var_3
   + 270 p_right_0_3 <= 270
 non_overlap_right_rev_0_3: - w_var_3 + x_grid_var_0 - x_grid_var_3
   - 270 p_right_0_3 <= 0
 non_overlap_down_0_3: h_var_0 + y_grid_var_0 - y_grid_var_3
   + 270 p_down_0_3 <= 270
 non_overlap_down_rev_0_3: - h_var_0 - y_grid_var_0 + y_grid_var_3
   - 270 p_down_0_3 <= 0
 non_overlap_up_0_3: h_var_3 - y_grid_var_0 + y_grid_var_3 + 270 p_up_0_3
   <= 270
 non_overlap_up_rev_0_3: - h_var_3 + y_grid_var_0 - y_grid_var_3
   - 270 p_up_0_3 <= 0
 non_overlap_any_0_4: p_left_0_4 + p_right_0_4 + p_down_0_4 + p_up_0_4
   >= 1
 non_overlap_left_0_4: w_var_0 + x_grid_var_0 - x_grid_var_4
   + 270 p_left_0_4 <= 270
 non_overlap_left_rev_0_4: - w_var_0 - x_grid_var_0 + x_grid_var_4
   - 270 p_left_0_4 <= 0
 non_overlap_right_0_4: w_var_4 - x_grid_var_0 + x_grid_var_4
   + 270 p_right_0_4 <= 270
 non_overlap_right_rev_0_4: - w_var_4 + x_grid_var_0 - x_grid_var_4
   - 270 p_right_0_4 <= 0
 non_overlap_down_0_4: h_var_0 + y_grid_var_0 - y_grid_var_4
   + 270 p_down_0_4 <= 270
 non_overlap_down_rev_0_4: - h_var_0 - y_grid_var_0 + y_grid_var_4
   - 270 p_down_0_4 <= 0
 non_overlap_up_0_4: h_var_4 - y_grid_var_0 + y_grid_var_4 + 270 p_up_0_4
   <= 270
 non_overlap_up_rev_0_4: - h_var_4 + y_grid_var_0 - y_grid_var_4
   - 270 p_up_0_4 <= 0
 non_overlap_any_0_5: p_left_0_5 + p_right_0_5 + p_down_0_5 + p_up_0_5
   >= 1
 non_overlap_left_0_5: w_var_0 + x_grid_var_0 - x_grid_var_5
   + 270 p_left_0_5 <= 270
 non_overlap_left_rev_0_5: - w_var_0 - x_grid_var_0 + x_grid_var_5
   - 270 p_left_0_5 <= 0
 non_overlap_right_0_5: w_var_5 - x_grid_var_0 + x_grid_var_5
   + 270 p_right_0_5 <= 270
 non_overlap_right_rev_0_5: - w_var_5 + x_grid_var_0 - x_grid_var_5
   - 270 p_right_0_5 <= 0
 non_overlap_down_0_5: h_var_0 + y_grid_var_0 - y_grid_var_5
   + 270 p_down_0_5 <= 270
 non_overlap_down_rev_0_5: - h_var_0 - y_grid_var_0 + y_grid_var_5
   - 270 p_down_0_5 <= 0
 non_overlap_up_0_5: h_var_5 - y_grid_var_0 + y_grid_var_5 + 270 p_up_0_5
   <= 270
 non_overlap_up_rev_0_5: - h_var_5 + y_grid_var_0 - y_grid_var_5
   - 270 p_up_0_5 <= 0
 non_overlap_any_1_2: p_left_1_2 + p_right_1_2 + p_down_1_2 + p_up_1_2
   >= 1
 non_overlap_left_1_2: w_var_1 + x_grid_var_1 - x_grid_var_2
   + 270 p_left_1_2 <= 270
 non_overlap_left_rev_1_2: - w_var_1 - x_grid_var_1 + x_grid_var_2
   - 270 p_left_1_2 <= 0
 non_overlap_right_1_2: w_var_2 - x_grid_var_1 + x_grid_var_2
   + 270 p_right_1_2 <= 270
 non_overlap_right_rev_1_2: - w_var_2 + x_grid_var_1 - x_grid_var_2
   - 270 p_right_1_2 <= 0
 non_overlap_down_1_2: h_var_1 + y_grid_var_1 - y_grid_var_2
   + 270 p_down_1_2 <= 270
 non_overlap_down_rev_1_2: - h_var_1 - y_grid_var_1 + y_grid_var_2
   - 270 p_down_1_2 <= 0
 non_overlap_up_1_2: h_var_2 - y_grid_var_1 + y_grid_var_2 + 270 p_up_1_2
   <= 270
 non_overlap_up_rev_1_2: - h_var_2 + y_grid_var_1 - y_grid_var_2
   - 270 p_up_1_2 <= 0
 non_overlap_any_1_3: p_left_1_3 + p_right_1_3 + p_down_1_3 + p_up_1_3
   >= 1
 non_overlap_left_1_3: w_var_1 + x_grid_var_1 - x_grid_var_3
   + 270 p_left_1_3 <= 270
 non_overlap_left_rev_1_3: - w_var_1 - x_grid_var_1 + x_grid_var_3
   - 270 p_left_1_3 <= 0
 non_overlap_right_1_3: w_var_3 - x_grid_var_1 + x_grid_var_3
   + 270 p_right_1_3 <= 270
 non_overlap_right_rev_1_3: - w_var_3 + x_grid_var_1 - x_grid_var_3
   - 270 p_right_1_3 <= 0
 non_overlap_down_1_3: h_var_1 + y_grid_var_1 - y_grid_var_3
   + 270 p_down_1_3 <= 270
 non_overlap_down_rev_1_3: - h_var_1 - y_grid_var_1 + y_grid_var_3
   - 270 p_down_1_3 <= 0
 non_overlap_up_1_3: h_var_3 - y_grid_var_1 + y_grid_var_3 + 270 p_up_1_3
   <= 270
 non_overlap_up_rev_1_3: - h_var_3 + y_grid_var_1 - y_grid_var_3
   - 270 p_up_1_3 <= 0
 non_overlap_any_1_4: p_left_1_4 + p_right_1_4 + p_down_1_4 + p_up_1_4
   >= 1
 non_overlap_left_1_4: w_var_1 + x_grid_var_1 - x_grid_var_4
   + 270 p_left_1_4 <= 270
 non_overlap_left_rev_1_4: - w_var_1 - x_grid_var_1 + x_grid_var_4
   - 270 p_left_1_4 <= 0
 non_overlap_right_1_4: w_var_4 - x_grid_var_1 + x_grid_var_4
   + 270 p_right_1_4 <= 270
 non_overlap_right_rev_1_4: - w_var_4 + x_grid_var_1 - x_grid_var_4
   - 270 p_right_1_4 <= 0
 non_overlap_down_1_4: h_var_1 + y_grid_var_1 - y_grid_var_4
   + 270 p_down_1_4 <= 270
 non_overlap_down_rev_1_4: - h_var_1 - y_grid_var_1 + y_grid_var_4
   - 270 p_down_1_4 <= 0
 non_overlap_up_1_4: h_var_4 - y_grid_var_1 + y_grid_var_4 + 270 p_up_1_4
   <= 270
 non_overlap_up_rev_1_4: - h_var_4 + y_grid_var_1 - y_grid_var_4
   - 270 p_up_1_4 <= 0
 non_overlap_any_1_5: p_left_1_5 + p_right_1_5 + p_down_1_5 + p_up_1_5
   >= 1
 non_overlap_left_1_5: w_var_1 + x_grid_var_1 - x_grid_var_5
   + 270 p_left_1_5 <= 270
 non_overlap_left_rev_1_5: - w_var_1 - x_grid_var_1 + x_grid_var_5
   - 270 p_left_1_5 <= 0
 non_overlap_right_1_5: w_var_5 - x_grid_var_1 + x_grid_var_5
   + 270 p_right_1_5 <= 270
 non_overlap_right_rev_1_5: - w_var_5 + x_grid_var_1 - x_grid_var_5
   - 270 p_right_1_5 <= 0
 non_overlap_down_1_5: h_var_1 + y_grid_var_1 - y_grid_var_5
   + 270 p_down_1_5 <= 270
 non_overlap_down_rev_1_5: - h_var_1 - y_grid_var_1 + y_grid_var_5
   - 270 p_down_1_5 <= 0
 non_overlap_up_1_5: h_var_5 - y_grid_var_1 + y_grid_var_5 + 270 p_up_1_5
   <= 270
 non_overlap_up_rev_1_5: - h_var_5 + y_grid_var_1 - y_grid_var_5
   - 270 p_up_1_5 <= 0
 non_overlap_any_2_3: p_left_2_3 + p_right_2_3 + p_down_2_3 + p_up_2_3
   >= 1
 non_overlap_left_2_3: w_var_2 + x_grid_var_2 - x_grid_var_3
   + 270 p_left_2_3 <= 270
 non_overlap_left_rev_2_3: - w_var_2 - x_grid_var_2 + x_grid_var_3
   - 270 p_left_2_3 <= 0
 non_overlap_right_2_3: w_var_3 - x_grid_var_2 + x_grid_var_3
   + 270 p_right_2_3 <= 270
 non_overlap_right_rev_2_3: - w_var_3 + x_grid_var_2 - x_grid_var_3
   - 270 p_right_2_3 <= 0
 non_overlap_down_2_3: h_var_2 + y_grid_var_2 - y_grid_var_3
   + 270 p_down_2_3 <= 270
 non_overlap_down_rev_2_3: - h_var_2 - y_grid_var_2 + y_grid_var_3
   - 270 p_down_2_3 <= 0
 non_overlap_up_2_3: h_var_3 - y_grid_var_2 + y_grid_var_3 + 270 p_up_2_3
   <= 270
 non_overlap_up_rev_2_3: - h_var_3 + y_grid_var_2 - y_grid_var_3
   - 270 p_up_2_3 <= 0
 non_overlap_any_2_4: p_left_2_4 + p_right_2_4 + p_down_2_4 + p_up_2_4
   >= 1
 non_overlap_left_2_4: w_var_2 + x_grid_var_2 - x_grid_var_4
   + 270 p_left_2_4 <= 270
 non_overlap_left_rev_2_4: - w_var_2 - x_grid_var_2 + x_grid_var_4
   - 270 p_left_2_4 <= 0
 non_overlap_right_2_4: w_var_4 - x_grid_var_2 + x_grid_var_4
   + 270 p_right_2_4 <= 270
 non_overlap_right_rev_2_4: - w_var_4 + x_grid_var_2 - x_grid_var_4
   - 270 p_right_2_4 <= 0
 non_overlap_down_2_4: h_var_2 + y_grid_var_2 - y_grid_var_4
   + 270 p_down_2_4 <= 270
 non_overlap_down_rev_2_4: - h_var_2 - y_grid_var_2 + y_grid_var_4
   - 270 p_down_2_4 <= 0
 non_overlap_up_2_4: h_var_4 - y_grid_var_2 + y_grid_var_4 + 270 p_up_2_4
   <= 270
 non_overlap_up_rev_2_4: - h_var_4 + y_grid_var_2 - y_grid_var_4
   - 270 p_up_2_4 <= 0
 non_overlap_any_2_5: p_left_2_5 + p_right_2_5 + p_down_2_5 + p_up_2_5
   >= 1
 non_overlap_left_2_5: w_var_2 + x_grid_var_2 - x_grid_var_5
   + 270 p_left_2_5 <= 270
 non_overlap_left_rev_2_5: - w_var_2 - x_grid_var_2 + x_grid_var_5
   - 270 p_left_2_5 <= 0
 non_overlap_right_2_5: w_var_5 - x_grid_var_2 + x_grid_var_5
   + 270 p_right_2_5 <= 270
 non_overlap_right_rev_2_5: - w_var_5 + x_grid_var_2 - x_grid_var_5
   - 270 p_right_2_5 <= 0
 non_overlap_down_2_5: h_var_2 + y_grid_var_2 - y_grid_var_5
   + 270 p_down_2_5 <= 270
 non_overlap_down_rev_2_5: - h_var_2 - y_grid_var_2 + y_grid_var_5
   - 270 p_down_2_5 <= 0
 non_overlap_up_2_5: h_var_5 - y_grid_var_2 + y_grid_var_5 + 270 p_up_2_5
   <= 270
 non_overlap_up_rev_2_5: - h_var_5 + y_grid_var_2 - y_grid_var_5
   - 270 p_up_2_5 <= 0
 non_overlap_any_3_4: p_left_3_4 + p_right_3_4 + p_down_3_4 + p_up_3_4
   >= 1
 non_overlap_left_3_4: w_var_3 + x_grid_var_3 - x_grid_var_4
   + 270 p_left_3_4 <= 270
 non_overlap_left_rev_3_4: - w_var_3 - x_grid_var_3 + x_grid_var_4
   - 270 p_left_3_4 <= 0
 non_overlap_right_3_4: w_var_4 - x_grid_var_3 + x_grid_var_4
   + 270 p_right_3_4 <= 270
 non_overlap_right_rev_3_4: - w_var_4 + x_grid_var_3 - x_grid_var_4
   - 270 p_right_3_4 <= 0
 non_overlap_down_3_4: h_var_3 + y_grid_var_3 - y_grid_var_4
   + 270 p_down_3_4 <= 270
 non_overlap_down_rev_3_4: - h_var_3 - y_grid_var_3 + y_grid_var_4
   - 270 p_down_3_4 <= 0
 non_overlap_up_3_4: h_var_4 - y_grid_var_3 + y_grid_var_4 + 270 p_up_3_4
   <= 270
 non_overlap_up_rev_3_4: - h_var_4 + y_grid_var_3 - y_grid_var_4
   - 270 p_up_3_4 <= 0
 non_overlap_any_3_5: p_left_3_5 + p_right_3_5 + p_down_3_5 + p_up_3_5
   >= 1
 non_overlap_left_3_5: w_var_3 + x_grid_var_3 - x_grid_var_5
   + 270 p_left_3_5 <= 270
 non_overlap_left_rev_3_5: - w_var_3 - x_grid_var_3 + x_grid_var_5
   - 270 p_left_3_5 <= 0
 non_overlap_right_3_5: w_var_5 - x_grid_var_3 + x_grid_var_5
   + 270 p_right_3_5 <= 270
 non_overlap_right_rev_3_5: - w_var_5 + x_grid_var_3 - x_grid_var_5
   - 270 p_right_3_5 <= 0
 non_overlap_down_3_5: h_var_3 + y_grid_var_3 - y_grid_var_5
   + 270 p_down_3_5 <= 270
 non_overlap_down_rev_3_5: - h_var_3 - y_grid_var_3 + y_grid_var_5
   - 270 p_down_3_5 <= 0
 non_overlap_up_3_5: h_var_5 - y_grid_var_3 + y_grid_var_5 + 270 p_up_3_5
   <= 270
 non_overlap_up_rev_3_5: - h_var_5 + y_grid_var_3 - y_grid_var_5
   - 270 p_up_3_5 <= 0
 non_overlap_any_4_5: p_left_4_5 + p_right_4_5 + p_down_4_5 + p_up_4_5
   >= 1
 non_overlap_left_4_5: w_var_4 + x_grid_var_4 - x_grid_var_5
   + 270 p_left_4_5 <= 270
 non_overlap_left_rev_4_5: - w_var_4 - x_grid_var_4 + x_grid_var_5
   - 270 p_left_4_5 <= 0
 non_overlap_right_4_5: w_var_5 - x_grid_var_4 + x_grid_var_5
   + 270 p_right_4_5 <= 270
 non_overlap_right_rev_4_5: - w_var_5 + x_grid_var_4 - x_grid_var_5
   - 270 p_right_4_5 <= 0
 non_overlap_down_4_5: h_var_4 + y_grid_var_4 - y_grid_var_5
   + 270 p_down_4_5 <= 270
 non_overlap_down_rev_4_5: - h_var_4 - y_grid_var_4 + y_grid_var_5
   - 270 p_down_4_5 <= 0
 non_overlap_up_4_5: h_var_5 - y_grid_var_4 + y_grid_var_5 + 270 p_up_4_5
   <= 270
 non_overlap_up_rev_4_5: - h_var_5 + y_grid_var_4 - y_grid_var_5
   - 270 p_up_4_5 <= 0
 EMIB_non_overlap_any_0_2_0_3: p_EMIB_left_0_2_0_3 + p_EMIB_right_0_2_0_3
   + p_EMIB_down_0_2_0_3 + p_EMIB_up_0_2_0_3 >= 1
 EMIB_non_overlap_left_0_2_0_3: EMIB_w_var_0_2 + EMIB_x_grid_var_0_2
   - EMIB_x_grid_var_0_3 + 270 p_EMIB_left_0_2_0_3 <= 270
 EMIB_non_overlap_left_rev_0_2_0_3: - EMIB_w_var_0_2 - EMIB_x_grid_var_0_2
   + EMIB_x_grid_var_0_3 - 270 p_EMIB_left_0_2_0_3 <= 0
 EMIB_non_overlap_right_0_2_0_3: EMIB_w_var_0_3 - EMIB_x_grid_var_0_2
   + EMIB_x_grid_var_0_3 + 270 p_EMIB_right_0_2_0_3 <= 270
 EMIB_non_overlap_right_rev_0_2_0_3: - EMIB_w_var_0_3 + EMIB_x_grid_var_0_2
   - EMIB_x_grid_var_0_3 - 270 p_EMIB_right_0_2_0_3 <= 0
 EMIB_non_overlap_down_0_2_0_3: EMIB_h_var_0_2 + EMIB_y_grid_var_0_2
   - EMIB_y_grid_var_0_3 + 270 p_EMIB_down_0_2_0_3 <= 270
 EMIB_non_overlap_down_rev_0_2_0_3: - EMIB_h_var_0_2 - EMIB_y_grid_var_0_2
   + EMIB_y_grid_var_0_3 - 270 p_EMIB_down_0_2_0_3 <= 0
 EMIB_non_overlap_up_0_2_0_3: EMIB_h_var_0_3 - EMIB_y_grid_var_0_2
   + EMIB_y_grid_var_0_3 + 270 p_EMIB_up_0_2_0_3 <= 270
 EMIB_non_overlap_up_rev_0_2_0_3: - EMIB_h_var_0_3 + EMIB_y_grid_var_0_2
   - EMIB_y_grid_var_0_3 - 270 p_EMIB_up_0_2_0_3 <= 0
 EMIB_non_overlap_any_0_2_0_4: p_EMIB_left_0_2_0_4 + p_EMIB_right_0_2_0_4
   + p_EMIB_down_0_2_0_4 + p_EMIB_up_0_2_0_4 >= 1
 EMIB_non_overlap_left_0_2_0_4: EMIB_w_var_0_2 + EMIB_x_grid_var_0_2
   - EMIB_x_grid_var_0_4 + 270 p_EMIB_left_0_2_0_4 <= 270
 EMIB_non_overlap_left_rev_0_2_0_4: - EMIB_w_var_0_2 - EMIB_x_grid_var_0_2
   + EMIB_x_grid_var_0_4 - 270 p_EMIB_left_0_2_0_4 <= 0
 EMIB_non_overlap_right_0_2_0_4: EMIB_w_var_0_4 - EMIB_x_grid_var_0_2
   + EMIB_x_grid_var_0_4 + 270 p_EMIB_right_0_2_0_4 <= 270
 EMIB_non_overlap_right_rev_0_2_0_4: - EMIB_w_var_0_4 + EMIB_x_grid_var_0_2
   - EMIB_x_grid_var_0_4 - 270 p_EMIB_right_0_2_0_4 <= 0
 EMIB_non_overlap_down_0_2_0_4: EMIB_h_var_0_2 + EMIB_y_grid_var_0_2
   - EMIB_y_grid_var_0_4 + 270 p_EMIB_down_0_2_0_4 <= 270
 EMIB_non_overlap_down_rev_0_2_0_4: - EMIB_h_var_0_2 - EMIB_y_grid_var_0_2
   + EMIB_y_grid_var_0_4 - 270 p_EMIB_down_0_2_0_4 <= 0
 EMIB_non_overlap_up_0_2_0_4: EMIB_h_var_0_4 - EMIB_y_grid_var_0_2
   + EMIB_y_grid_var_0_4 + 270 p_EMIB_up_0_2_0_4 <= 270
 EMIB_non_overlap_up_rev_0_2_0_4: - EMIB_h_var_0_4 + EMIB_y_grid_var_0_2
   - EMIB_y_grid_var_0_4 - 270 p_EMIB_up_0_2_0_4 <= 0
 EMIB_non_overlap_any_0_2_0_5: p_EMIB_left_0_2_0_5 + p_EMIB_right_0_2_0_5
   + p_EMIB_down_0_2_0_5 + p_EMIB_up_0_2_0_5 >= 1
 EMIB_non_overlap_left_0_2_0_5: EMIB_w_var_0_2 + EMIB_x_grid_var_0_2
   - EMIB_x_grid_var_0_5 + 270 p_EMIB_left_0_2_0_5 <= 270
 EMIB_non_overlap_left_rev_0_2_0_5: - EMIB_w_var_0_2 - EMIB_x_grid_var_0_2
   + EMIB_x_grid_var_0_5 - 270 p_EMIB_left_0_2_0_5 <= 0
 EMIB_non_overlap_right_0_2_0_5: EMIB_w_var_0_5 - EMIB_x_grid_var_0_2
   + EMIB_x_grid_var_0_5 + 270 p_EMIB_right_0_2_0_5 <= 270
 EMIB_non_overlap_right_rev_0_2_0_5: - EMIB_w_var_0_5 + EMIB_x_grid_var_0_2
   - EMIB_x_grid_var_0_5 - 270 p_EMIB_right_0_2_0_5 <= 0
 EMIB_non_overlap_down_0_2_0_5: EMIB_h_var_0_2 + EMIB_y_grid_var_0_2
   - EMIB_y_grid_var_0_5 + 270 p_EMIB_down_0_2_0_5 <= 270
 EMIB_non_overlap_down_rev_0_2_0_5: - EMIB_h_var_0_2 - EMIB_y_grid_var_0_2
   + EMIB_y_grid_var_0_5 - 270 p_EMIB_down_0_2_0_5 <= 0
 EMIB_non_overlap_up_0_2_0_5: EMIB_h_var_0_5 - EMIB_y_grid_var_0_2
   + EMIB_y_grid_var_0_5 + 270 p_EMIB_up_0_2_0_5 <= 270
 EMIB_non_overlap_up_rev_0_2_0_5: - EMIB_h_var_0_5 + EMIB_y_grid_var_0_2
   - EMIB_y_grid_var_0_5 - 270 p_EMIB_up_0_2_0_5 <= 0
 EMIB_non_overlap_any_0_3_0_4: p_EMIB_left_0_3_0_4 + p_EMIB_right_0_3_0_4
   + p_EMIB_down_0_3_0_4 + p_EMIB_up_0_3_0_4 >= 1
 EMIB_non_overlap_left_0_3_0_4: EMIB_w_var_0_3 + EMIB_x_grid_var_0_3
   - EMIB_x_grid_var_0_4 + 270 p_EMIB_left_0_3_0_4 <= 270
 EMIB_non_overlap_left_rev_0_3_0_4: - EMIB_w_var_0_3 - EMIB_x_grid_var_0_3
   + EMIB_x_grid_var_0_4 - 270 p_EMIB_left_0_3_0_4 <= 0
 EMIB_non_overlap_right_0_3_0_4: EMIB_w_var_0_4 - EMIB_x_grid_var_0_3
   + EMIB_x_grid_var_0_4 + 270 p_EMIB_right_0_3_0_4 <= 270
 EMIB_non_overlap_right_rev_0_3_0_4: - EMIB_w_var_0_4 + EMIB_x_grid_var_0_3
   - EMIB_x_grid_var_0_4 - 270 p_EMIB_right_0_3_0_4 <= 0
 EMIB_non_overlap_down_0_3_0_4: EMIB_h_var_0_3 + EMIB_y_grid_var_0_3
   - EMIB_y_grid_var_0_4 + 270 p_EMIB_down_0_3_0_4 <= 270
 EMIB_non_overlap_down_rev_0_3_0_4: - EMIB_h_var_0_3 - EMIB_y_grid_var_0_3
   + EMIB_y_grid_var_0_4 - 270 p_EMIB_down_0_3_0_4 <= 0
 EMIB_non_overlap_up_0_3_0_4: EMIB_h_var_0_4 - EMIB_y_grid_var_0_3
   + EMIB_y_grid_var_0_4 + 270 p_EMIB_up_0_3_0_4 <= 270
 EMIB_non_overlap_up_rev_0_3_0_4: - EMIB_h_var_0_4 + EMIB_y_grid_var_0_3
   - EMIB_y_grid_var_0_4 - 270 p_EMIB_up_0_3_0_4 <= 0
 EMIB_non_overlap_any_0_3_0_5: p_EMIB_left_0_3_0_5 + p_EMIB_right_0_3_0_5
   + p_EMIB_down_0_3_0_5 + p_EMIB_up_0_3_0_5 >= 1
 EMIB_non_overlap_left_0_3_0_5: EMIB_w_var_0_3 + EMIB_x_grid_var_0_3
   - EMIB_x_grid_var_0_5 + 270 p_EMIB_left_0_3_0_5 <= 270
 EMIB_non_overlap_left_rev_0_3_0_5: - EMIB_w_var_0_3 - EMIB_x_grid_var_0_3
   + EMIB_x_grid_var_0_5 - 270 p_EMIB_left_0_3_0_5 <= 0
 EMIB_non_overlap_right_0_3_0_5: EMIB_w_var_0_5 - EMIB_x_grid_var_0_3
   + EMIB_x_grid_var_0_5 + 270 p_EMIB_right_0_3_0_5 <= 270
 EMIB_non_overlap_right_rev_0_3_0_5: - EMIB_w_var_0_5 + EMIB_x_grid_var_0_3
   - EMIB_x_grid_var_0_5 - 270 p_EMIB_right_0_3_0_5 <= 0
 EMIB_non_overlap_down_0_3_0_5: EMIB_h_var_0_3 + EMIB_y_grid_var_0_3
   - EMIB_y_grid_var_0_5 + 270 p_EMIB_down_0_3_0_5 <= 270
 EMIB_non_overlap_down_rev_0_3_0_5: - EMIB_h_var_0_3 - EMIB_y_grid_var_0_3
   + EMIB_y_grid_var_0_5 - 270 p_EMIB_down_0_3_0_5 <= 0
 EMIB_non_overlap_up_0_3_0_5: EMIB_h_var_0_5 - EMIB_y_grid_var_0_3
   + EMIB_y_grid_var_0_5 + 270 p_EMIB_up_0_3_0_5 <= 270
 EMIB_non_overlap_up_rev_0_3_0_5: - EMIB_h_var_0_5 + EMIB_y_grid_var_0_3
   - EMIB_y_grid_var_0_5 - 270 p_EMIB_up_0_3_0_5 <= 0
 EMIB_non_overlap_any_0_4_0_5: p_EMIB_left_0_4_0_5 + p_EMIB_right_0_4_0_5
   + p_EMIB_down_0_4_0_5 + p_EMIB_up_0_4_0_5 >= 1
 EMIB_non_overlap_left_0_4_0_5: EMIB_w_var_0_4 + EMIB_x_grid_var_0_4
   - EMIB_x_grid_var_0_5 + 270 p_EMIB_left_0_4_0_5 <= 270
 EMIB_non_overlap_left_rev_0_4_0_5: - EMIB_w_var_0_4 - EMIB_x_grid_var_0_4
   + EMIB_x_grid_var_0_5 - 270 p_EMIB_left_0_4_0_5 <= 0
 EMIB_non_overlap_right_0_4_0_5: EMIB_w_var_0_5 - EMIB_x_grid_var_0_4
   + EMIB_x_grid_var_0_5 + 270 p_EMIB_right_0_4_0_5 <= 270
 EMIB_non_overlap_right_rev_0_4_0_5: - EMIB_w_var_0_5 + EMIB_x_grid_var_0_4
   - EMIB_x_grid_var_0_5 - 270 p_EMIB_right_0_4_0_5 <= 0
 EMIB_non_overlap_down_0_4_0_5: EMIB_h_var_0_4 + EMIB_y_grid_var_0_4
   - EMIB_y_grid_var_0_5 + 270 p_EMIB_down_0_4_0_5 <= 270
 EMIB_non_overlap_down_rev_0_4_0_5: - EMIB_h_var_0_4 - EMIB_y_grid_var_0_4
   + EMIB_y_grid_var_0_5 - 270 p_EMIB_down_0_4_0_5 <= 0
 EMIB_non_overlap_up_0_4_0_5: EMIB_h_var_0_5 - EMIB_y_grid_var_0_4
   + EMIB_y_grid_var_0_5 + 270 p_EMIB_up_0_4_0_5 <= 270
 EMIB_non_overlap_up_rev_0_4_0_5: - EMIB_h_var_0_5 + EMIB_y_grid_var_0_4
   - EMIB_y_grid_var_0_5 - 270 p_EMIB_up_0_4_0_5 <= 0
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
 bbox_w_def: bbox_min_x - bbox_max_x + bbox_w = 0
 bbox_h_def: bbox_min_y - bbox_max_y + bbox_h = 0
 cx_center_def: cx_center - 0.5 bbox_min_x - 0.5 bbox_max_x = 0
 cy_center_def: cy_center - 0.5 bbox_min_y - 0.5 bbox_max_y = 0
 aspect_ratio_diff_ge_w_minus_h: - bbox_w + bbox_h + aspect_ratio_penalty
   >= 0
 aspect_ratio_diff_ge_h_minus_w: bbox_w - bbox_h + aspect_ratio_penalty
   >= 0
 dx_center_diff_def_0: - cx_grid_var_0 + cx_center + dx_center_diff_0 = 0
 dx_center_abs_0_abs_ge_orig: - dx_center_diff_0 + dx_center_abs_0
   - 270 dx_center_abs_0_is_positive >= -270
 dx_center_abs_0_abs_le_orig: - dx_center_diff_0 + dx_center_abs_0
   + 270 dx_center_abs_0_is_positive <= 270
 dx_center_abs_0_abs_ge_neg_orig: dx_center_diff_0 + dx_center_abs_0
   + 270 dx_center_abs_0_is_positive >= 0
 dx_center_abs_0_abs_le_neg_orig: dx_center_diff_0 + dx_center_abs_0
   - 270 dx_center_abs_0_is_positive <= 0
 dx_center_abs_0_force_positive: dx_center_diff_0
   - 270 dx_center_abs_0_is_positive >= -270
 dx_center_abs_0_force_negative: dx_center_diff_0
   - 270 dx_center_abs_0_is_positive <= 0
 dy_center_diff_def_0: - cy_grid_var_0 + cy_center + dy_center_diff_0 = 0
 dy_center_abs_0_abs_ge_orig: - dy_center_diff_0 + dy_center_abs_0
   - 270 dy_center_abs_0_is_positive >= -270
 dy_center_abs_0_abs_le_orig: - dy_center_diff_0 + dy_center_abs_0
   + 270 dy_center_abs_0_is_positive <= 270
 dy_center_abs_0_abs_ge_neg_orig: dy_center_diff_0 + dy_center_abs_0
   + 270 dy_center_abs_0_is_positive >= 0
 dy_center_abs_0_abs_le_neg_orig: dy_center_diff_0 + dy_center_abs_0
   - 270 dy_center_abs_0_is_positive <= 0
 dy_center_abs_0_force_positive: dy_center_diff_0
   - 270 dy_center_abs_0_is_positive >= -270
 dy_center_abs_0_force_negative: dy_center_diff_0
   - 270 dy_center_abs_0_is_positive <= 0
 dist_center_def_0: - dx_center_abs_0 - dy_center_abs_0 + dist_center_0
   = 0
 power_aware_penalty_def: power_aware_penalty - 65536 dist_center_0 = 0
 dx_diff_def_0_1: - cx_grid_var_0 + cx_grid_var_1 + dx_diff_0_1 = 0
 dy_diff_def_0_1: - cy_grid_var_0 + cy_grid_var_1 + dy_diff_0_1 = 0
 dx_abs_0_1_abs_ge_orig: dx_abs_0_1 - dx_diff_0_1
   - 270 dx_abs_0_1_is_positive >= -270
 dx_abs_0_1_abs_le_orig: dx_abs_0_1 - dx_diff_0_1
   + 270 dx_abs_0_1_is_positive <= 270
 dx_abs_0_1_abs_ge_neg_orig: dx_abs_0_1 + dx_diff_0_1
   + 270 dx_abs_0_1_is_positive >= 0
 dx_abs_0_1_abs_le_neg_orig: dx_abs_0_1 + dx_diff_0_1
   - 270 dx_abs_0_1_is_positive <= 0
 dx_abs_0_1_force_positive: dx_diff_0_1 - 270 dx_abs_0_1_is_positive
   >= -270
 dx_abs_0_1_force_negative: dx_diff_0_1 - 270 dx_abs_0_1_is_positive <= 0
 dy_abs_0_1_abs_ge_orig: dy_abs_0_1 - dy_diff_0_1
   - 270 dy_abs_0_1_is_positive >= -270
 dy_abs_0_1_abs_le_orig: dy_abs_0_1 - dy_diff_0_1
   + 270 dy_abs_0_1_is_positive <= 270
 dy_abs_0_1_abs_ge_neg_orig: dy_abs_0_1 + dy_diff_0_1
   + 270 dy_abs_0_1_is_positive >= 0
 dy_abs_0_1_abs_le_neg_orig: dy_abs_0_1 + dy_diff_0_1
   - 270 dy_abs_0_1_is_positive <= 0
 dy_abs_0_1_force_positive: dy_diff_0_1 - 270 dy_abs_0_1_is_positive
   >= -270
 dy_abs_0_1_force_negative: dy_diff_0_1 - 270 dy_abs_0_1_is_positive <= 0
 dx_diff_def_i_0_2: EMIB_cx_grid_var_0_2 - cx_grid_var_0 + dx_diff_i_0_2
   = 0
 dx_diff_def_j_0_2: EMIB_cx_grid_var_0_2 - cx_grid_var_2 + dx_diff_j_0_2
   = 0
 dy_diff_def_i_0_2: EMIB_cy_grid_var_0_2 - cy_grid_var_0 + dy_diff_i_0_2
   = 0
 dy_diff_def_j_0_2: EMIB_cy_grid_var_0_2 - cy_grid_var_2 + dy_diff_j_0_2
   = 0
 dx_abs_i_0_2_abs_ge_orig: dx_abs_i_0_2 - dx_diff_i_0_2
   - 270 dx_abs_i_0_2_is_positive >= -270
 dx_abs_i_0_2_abs_le_orig: dx_abs_i_0_2 - dx_diff_i_0_2
   + 270 dx_abs_i_0_2_is_positive <= 270
 dx_abs_i_0_2_abs_ge_neg_orig: dx_abs_i_0_2 + dx_diff_i_0_2
   + 270 dx_abs_i_0_2_is_positive >= 0
 dx_abs_i_0_2_abs_le_neg_orig: dx_abs_i_0_2 + dx_diff_i_0_2
   - 270 dx_abs_i_0_2_is_positive <= 0
 dx_abs_i_0_2_force_positive: dx_diff_i_0_2 - 270 dx_abs_i_0_2_is_positive
   >= -270
 dx_abs_i_0_2_force_negative: dx_diff_i_0_2 - 270 dx_abs_i_0_2_is_positive
   <= 0
 dy_abs_i_0_2_abs_ge_orig: dy_abs_i_0_2 - dy_diff_i_0_2
   - 270 dy_abs_i_0_2_is_positive >= -270
 dy_abs_i_0_2_abs_le_orig: dy_abs_i_0_2 - dy_diff_i_0_2
   + 270 dy_abs_i_0_2_is_positive <= 270
 dy_abs_i_0_2_abs_ge_neg_orig: dy_abs_i_0_2 + dy_diff_i_0_2
   + 270 dy_abs_i_0_2_is_positive >= 0
 dy_abs_i_0_2_abs_le_neg_orig: dy_abs_i_0_2 + dy_diff_i_0_2
   - 270 dy_abs_i_0_2_is_positive <= 0
 dy_abs_i_0_2_force_positive: dy_diff_i_0_2 - 270 dy_abs_i_0_2_is_positive
   >= -270
 dy_abs_i_0_2_force_negative: dy_diff_i_0_2 - 270 dy_abs_i_0_2_is_positive
   <= 0
 dx_abs_j_0_2_abs_ge_orig: dx_abs_j_0_2 - dx_diff_j_0_2
   - 270 dx_abs_j_0_2_is_positive >= -270
 dx_abs_j_0_2_abs_le_orig: dx_abs_j_0_2 - dx_diff_j_0_2
   + 270 dx_abs_j_0_2_is_positive <= 270
 dx_abs_j_0_2_abs_ge_neg_orig: dx_abs_j_0_2 + dx_diff_j_0_2
   + 270 dx_abs_j_0_2_is_positive >= 0
 dx_abs_j_0_2_abs_le_neg_orig: dx_abs_j_0_2 + dx_diff_j_0_2
   - 270 dx_abs_j_0_2_is_positive <= 0
 dx_abs_j_0_2_force_positive: dx_diff_j_0_2 - 270 dx_abs_j_0_2_is_positive
   >= -270
 dx_abs_j_0_2_force_negative: dx_diff_j_0_2 - 270 dx_abs_j_0_2_is_positive
   <= 0
 dy_abs_j_0_2_abs_ge_orig: dy_abs_j_0_2 - dy_diff_j_0_2
   - 270 dy_abs_j_0_2_is_positive >= -270
 dy_abs_j_0_2_abs_le_orig: dy_abs_j_0_2 - dy_diff_j_0_2
   + 270 dy_abs_j_0_2_is_positive <= 270
 dy_abs_j_0_2_abs_ge_neg_orig: dy_abs_j_0_2 + dy_diff_j_0_2
   + 270 dy_abs_j_0_2_is_positive >= 0
 dy_abs_j_0_2_abs_le_neg_orig: dy_abs_j_0_2 + dy_diff_j_0_2
   - 270 dy_abs_j_0_2_is_positive <= 0
 dy_abs_j_0_2_force_positive: dy_diff_j_0_2 - 270 dy_abs_j_0_2_is_positive
   >= -270
 dy_abs_j_0_2_force_negative: dy_diff_j_0_2 - 270 dy_abs_j_0_2_is_positive
   <= 0
 dx_diff_def_i_0_3: EMIB_cx_grid_var_0_3 - cx_grid_var_0 + dx_diff_i_0_3
   = 0
 dx_diff_def_j_0_3: EMIB_cx_grid_var_0_3 - cx_grid_var_3 + dx_diff_j_0_3
   = 0
 dy_diff_def_i_0_3: EMIB_cy_grid_var_0_3 - cy_grid_var_0 + dy_diff_i_0_3
   = 0
 dy_diff_def_j_0_3: EMIB_cy_grid_var_0_3 - cy_grid_var_3 + dy_diff_j_0_3
   = 0
 dx_abs_i_0_3_abs_ge_orig: dx_abs_i_0_3 - dx_diff_i_0_3
   - 270 dx_abs_i_0_3_is_positive >= -270
 dx_abs_i_0_3_abs_le_orig: dx_abs_i_0_3 - dx_diff_i_0_3
   + 270 dx_abs_i_0_3_is_positive <= 270
 dx_abs_i_0_3_abs_ge_neg_orig: dx_abs_i_0_3 + dx_diff_i_0_3
   + 270 dx_abs_i_0_3_is_positive >= 0
 dx_abs_i_0_3_abs_le_neg_orig: dx_abs_i_0_3 + dx_diff_i_0_3
   - 270 dx_abs_i_0_3_is_positive <= 0
 dx_abs_i_0_3_force_positive: dx_diff_i_0_3 - 270 dx_abs_i_0_3_is_positive
   >= -270
 dx_abs_i_0_3_force_negative: dx_diff_i_0_3 - 270 dx_abs_i_0_3_is_positive
   <= 0
 dy_abs_i_0_3_abs_ge_orig: dy_abs_i_0_3 - dy_diff_i_0_3
   - 270 dy_abs_i_0_3_is_positive >= -270
 dy_abs_i_0_3_abs_le_orig: dy_abs_i_0_3 - dy_diff_i_0_3
   + 270 dy_abs_i_0_3_is_positive <= 270
 dy_abs_i_0_3_abs_ge_neg_orig: dy_abs_i_0_3 + dy_diff_i_0_3
   + 270 dy_abs_i_0_3_is_positive >= 0
 dy_abs_i_0_3_abs_le_neg_orig: dy_abs_i_0_3 + dy_diff_i_0_3
   - 270 dy_abs_i_0_3_is_positive <= 0
 dy_abs_i_0_3_force_positive: dy_diff_i_0_3 - 270 dy_abs_i_0_3_is_positive
   >= -270
 dy_abs_i_0_3_force_negative: dy_diff_i_0_3 - 270 dy_abs_i_0_3_is_positive
   <= 0
 dx_abs_j_0_3_abs_ge_orig: dx_abs_j_0_3 - dx_diff_j_0_3
   - 270 dx_abs_j_0_3_is_positive >= -270
 dx_abs_j_0_3_abs_le_orig: dx_abs_j_0_3 - dx_diff_j_0_3
   + 270 dx_abs_j_0_3_is_positive <= 270
 dx_abs_j_0_3_abs_ge_neg_orig: dx_abs_j_0_3 + dx_diff_j_0_3
   + 270 dx_abs_j_0_3_is_positive >= 0
 dx_abs_j_0_3_abs_le_neg_orig: dx_abs_j_0_3 + dx_diff_j_0_3
   - 270 dx_abs_j_0_3_is_positive <= 0
 dx_abs_j_0_3_force_positive: dx_diff_j_0_3 - 270 dx_abs_j_0_3_is_positive
   >= -270
 dx_abs_j_0_3_force_negative: dx_diff_j_0_3 - 270 dx_abs_j_0_3_is_positive
   <= 0
 dy_abs_j_0_3_abs_ge_orig: dy_abs_j_0_3 - dy_diff_j_0_3
   - 270 dy_abs_j_0_3_is_positive >= -270
 dy_abs_j_0_3_abs_le_orig: dy_abs_j_0_3 - dy_diff_j_0_3
   + 270 dy_abs_j_0_3_is_positive <= 270
 dy_abs_j_0_3_abs_ge_neg_orig: dy_abs_j_0_3 + dy_diff_j_0_3
   + 270 dy_abs_j_0_3_is_positive >= 0
 dy_abs_j_0_3_abs_le_neg_orig: dy_abs_j_0_3 + dy_diff_j_0_3
   - 270 dy_abs_j_0_3_is_positive <= 0
 dy_abs_j_0_3_force_positive: dy_diff_j_0_3 - 270 dy_abs_j_0_3_is_positive
   >= -270
 dy_abs_j_0_3_force_negative: dy_diff_j_0_3 - 270 dy_abs_j_0_3_is_positive
   <= 0
 dx_diff_def_i_0_4: EMIB_cx_grid_var_0_4 - cx_grid_var_0 + dx_diff_i_0_4
   = 0
 dx_diff_def_j_0_4: EMIB_cx_grid_var_0_4 - cx_grid_var_4 + dx_diff_j_0_4
   = 0
 dy_diff_def_i_0_4: EMIB_cy_grid_var_0_4 - cy_grid_var_0 + dy_diff_i_0_4
   = 0
 dy_diff_def_j_0_4: EMIB_cy_grid_var_0_4 - cy_grid_var_4 + dy_diff_j_0_4
   = 0
 dx_abs_i_0_4_abs_ge_orig: dx_abs_i_0_4 - dx_diff_i_0_4
   - 270 dx_abs_i_0_4_is_positive >= -270
 dx_abs_i_0_4_abs_le_orig: dx_abs_i_0_4 - dx_diff_i_0_4
   + 270 dx_abs_i_0_4_is_positive <= 270
 dx_abs_i_0_4_abs_ge_neg_orig: dx_abs_i_0_4 + dx_diff_i_0_4
   + 270 dx_abs_i_0_4_is_positive >= 0
 dx_abs_i_0_4_abs_le_neg_orig: dx_abs_i_0_4 + dx_diff_i_0_4
   - 270 dx_abs_i_0_4_is_positive <= 0
 dx_abs_i_0_4_force_positive: dx_diff_i_0_4 - 270 dx_abs_i_0_4_is_positive
   >= -270
 dx_abs_i_0_4_force_negative: dx_diff_i_0_4 - 270 dx_abs_i_0_4_is_positive
   <= 0
 dy_abs_i_0_4_abs_ge_orig: dy_abs_i_0_4 - dy_diff_i_0_4
   - 270 dy_abs_i_0_4_is_positive >= -270
 dy_abs_i_0_4_abs_le_orig: dy_abs_i_0_4 - dy_diff_i_0_4
   + 270 dy_abs_i_0_4_is_positive <= 270
 dy_abs_i_0_4_abs_ge_neg_orig: dy_abs_i_0_4 + dy_diff_i_0_4
   + 270 dy_abs_i_0_4_is_positive >= 0
 dy_abs_i_0_4_abs_le_neg_orig: dy_abs_i_0_4 + dy_diff_i_0_4
   - 270 dy_abs_i_0_4_is_positive <= 0
 dy_abs_i_0_4_force_positive: dy_diff_i_0_4 - 270 dy_abs_i_0_4_is_positive
   >= -270
 dy_abs_i_0_4_force_negative: dy_diff_i_0_4 - 270 dy_abs_i_0_4_is_positive
   <= 0
 dx_abs_j_0_4_abs_ge_orig: dx_abs_j_0_4 - dx_diff_j_0_4
   - 270 dx_abs_j_0_4_is_positive >= -270
 dx_abs_j_0_4_abs_le_orig: dx_abs_j_0_4 - dx_diff_j_0_4
   + 270 dx_abs_j_0_4_is_positive <= 270
 dx_abs_j_0_4_abs_ge_neg_orig: dx_abs_j_0_4 + dx_diff_j_0_4
   + 270 dx_abs_j_0_4_is_positive >= 0
 dx_abs_j_0_4_abs_le_neg_orig: dx_abs_j_0_4 + dx_diff_j_0_4
   - 270 dx_abs_j_0_4_is_positive <= 0
 dx_abs_j_0_4_force_positive: dx_diff_j_0_4 - 270 dx_abs_j_0_4_is_positive
   >= -270
 dx_abs_j_0_4_force_negative: dx_diff_j_0_4 - 270 dx_abs_j_0_4_is_positive
   <= 0
 dy_abs_j_0_4_abs_ge_orig: dy_abs_j_0_4 - dy_diff_j_0_4
   - 270 dy_abs_j_0_4_is_positive >= -270
 dy_abs_j_0_4_abs_le_orig: dy_abs_j_0_4 - dy_diff_j_0_4
   + 270 dy_abs_j_0_4_is_positive <= 270
 dy_abs_j_0_4_abs_ge_neg_orig: dy_abs_j_0_4 + dy_diff_j_0_4
   + 270 dy_abs_j_0_4_is_positive >= 0
 dy_abs_j_0_4_abs_le_neg_orig: dy_abs_j_0_4 + dy_diff_j_0_4
   - 270 dy_abs_j_0_4_is_positive <= 0
 dy_abs_j_0_4_force_positive: dy_diff_j_0_4 - 270 dy_abs_j_0_4_is_positive
   >= -270
 dy_abs_j_0_4_force_negative: dy_diff_j_0_4 - 270 dy_abs_j_0_4_is_positive
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
   - 270 dx_abs_i_0_5_is_positive >= -270
 dx_abs_i_0_5_abs_le_orig: dx_abs_i_0_5 - dx_diff_i_0_5
   + 270 dx_abs_i_0_5_is_positive <= 270
 dx_abs_i_0_5_abs_ge_neg_orig: dx_abs_i_0_5 + dx_diff_i_0_5
   + 270 dx_abs_i_0_5_is_positive >= 0
 dx_abs_i_0_5_abs_le_neg_orig: dx_abs_i_0_5 + dx_diff_i_0_5
   - 270 dx_abs_i_0_5_is_positive <= 0
 dx_abs_i_0_5_force_positive: dx_diff_i_0_5 - 270 dx_abs_i_0_5_is_positive
   >= -270
 dx_abs_i_0_5_force_negative: dx_diff_i_0_5 - 270 dx_abs_i_0_5_is_positive
   <= 0
 dy_abs_i_0_5_abs_ge_orig: dy_abs_i_0_5 - dy_diff_i_0_5
   - 270 dy_abs_i_0_5_is_positive >= -270
 dy_abs_i_0_5_abs_le_orig: dy_abs_i_0_5 - dy_diff_i_0_5
   + 270 dy_abs_i_0_5_is_positive <= 270
 dy_abs_i_0_5_abs_ge_neg_orig: dy_abs_i_0_5 + dy_diff_i_0_5
   + 270 dy_abs_i_0_5_is_positive >= 0
 dy_abs_i_0_5_abs_le_neg_orig: dy_abs_i_0_5 + dy_diff_i_0_5
   - 270 dy_abs_i_0_5_is_positive <= 0
 dy_abs_i_0_5_force_positive: dy_diff_i_0_5 - 270 dy_abs_i_0_5_is_positive
   >= -270
 dy_abs_i_0_5_force_negative: dy_diff_i_0_5 - 270 dy_abs_i_0_5_is_positive
   <= 0
 dx_abs_j_0_5_abs_ge_orig: dx_abs_j_0_5 - dx_diff_j_0_5
   - 270 dx_abs_j_0_5_is_positive >= -270
 dx_abs_j_0_5_abs_le_orig: dx_abs_j_0_5 - dx_diff_j_0_5
   + 270 dx_abs_j_0_5_is_positive <= 270
 dx_abs_j_0_5_abs_ge_neg_orig: dx_abs_j_0_5 + dx_diff_j_0_5
   + 270 dx_abs_j_0_5_is_positive >= 0
 dx_abs_j_0_5_abs_le_neg_orig: dx_abs_j_0_5 + dx_diff_j_0_5
   - 270 dx_abs_j_0_5_is_positive <= 0
 dx_abs_j_0_5_force_positive: dx_diff_j_0_5 - 270 dx_abs_j_0_5_is_positive
   >= -270
 dx_abs_j_0_5_force_negative: dx_diff_j_0_5 - 270 dx_abs_j_0_5_is_positive
   <= 0
 dy_abs_j_0_5_abs_ge_orig: dy_abs_j_0_5 - dy_diff_j_0_5
   - 270 dy_abs_j_0_5_is_positive >= -270
 dy_abs_j_0_5_abs_le_orig: dy_abs_j_0_5 - dy_diff_j_0_5
   + 270 dy_abs_j_0_5_is_positive <= 270
 dy_abs_j_0_5_abs_ge_neg_orig: dy_abs_j_0_5 + dy_diff_j_0_5
   + 270 dy_abs_j_0_5_is_positive >= 0
 dy_abs_j_0_5_abs_le_neg_orig: dy_abs_j_0_5 + dy_diff_j_0_5
   - 270 dy_abs_j_0_5_is_positive <= 0
 dy_abs_j_0_5_force_positive: dy_diff_j_0_5 - 270 dy_abs_j_0_5_is_positive
   >= -270
 dy_abs_j_0_5_force_negative: dy_diff_j_0_5 - 270 dy_abs_j_0_5_is_positive
   <= 0
 wirelength_def: wirelength - 200 dx_abs_0_1 - 200 dy_abs_0_1
   - 256 dx_abs_i_0_2 - 256 dy_abs_i_0_2 - 256 dx_abs_j_0_2
   - 256 dy_abs_j_0_2 - 256 dx_abs_i_0_3 - 256 dy_abs_i_0_3
   - 256 dx_abs_j_0_3 - 256 dy_abs_j_0_3 - 256 dx_abs_i_0_4
   - 256 dy_abs_i_0_4 - 256 dx_abs_j_0_4 - 256 dy_abs_j_0_4
   - 256 dx_abs_i_0_5 - 256 dy_abs_i_0_5 - 256 dx_abs_j_0_5
   - 256 dy_abs_j_0_5 = 0
 t_ge_scaled_mean: - 0.8 bbox_w - 0.8 bbox_h + bbox_area_proxy_t >= 0
Bounds
 14.5 <= w_var_0 <= 31.4
 14.5 <= h_var_0 <= 31.4
 10.5 <= w_var_1 <= 16
 10.5 <= h_var_1 <= 16
 7.75 <= w_var_2 <= 11.87
 7.75 <= h_var_2 <= 11.87
 7.75 <= w_var_3 <= 11.87
 7.75 <= h_var_3 <= 11.87
 7.75 <= w_var_4 <= 11.87
 7.75 <= h_var_4 <= 11.87
 7.75 <= w_var_5 <= 11.87
 7.75 <= h_var_5 <= 11.87
 0.8533 <= EMIB_w_var_0_2 <= 2
 0.8533 <= EMIB_h_var_0_2 <= 2
 0.8533 <= EMIB_w_var_0_3 <= 2
 0.8533 <= EMIB_h_var_0_3 <= 2
 0.8533 <= EMIB_w_var_0_4 <= 2
 0.8533 <= EMIB_h_var_0_4 <= 2
 0.8533 <= EMIB_w_var_0_5 <= 2
 0.8533 <= EMIB_h_var_0_5 <= 2
 x_grid_var_0 <= 135
 y_grid_var_0 <= 135
 x_grid_var_1 <= 135
 y_grid_var_1 <= 135
 x_grid_var_2 <= 135
 y_grid_var_2 <= 135
 x_grid_var_3 <= 135
 y_grid_var_3 <= 135
 x_grid_var_4 <= 135
 y_grid_var_4 <= 135
 x_grid_var_5 <= 135
 y_grid_var_5 <= 135
 EMIB_x_grid_var_0_2 <= 135
 EMIB_y_grid_var_0_2 <= 135
 EMIB_x_grid_var_0_3 <= 135
 EMIB_y_grid_var_0_3 <= 135
 EMIB_x_grid_var_0_4 <= 135
 EMIB_y_grid_var_0_4 <= 135
 EMIB_x_grid_var_0_5 <= 135
 EMIB_y_grid_var_0_5 <= 135
 EMIB_cx_grid_var_0_2 <= 270
 EMIB_cy_grid_var_0_2 <= 270
 EMIB_cx_grid_var_0_3 <= 270
 EMIB_cy_grid_var_0_3 <= 270
 EMIB_cx_grid_var_0_4 <= 270
 EMIB_cy_grid_var_0_4 <= 270
 EMIB_cx_grid_var_0_5 <= 270
 EMIB_cy_grid_var_0_5 <= 270
 cx_grid_var_0 <= 270
 cy_grid_var_0 <= 270
 cx_grid_var_1 <= 270
 cy_grid_var_1 <= 270
 cx_grid_var_2 <= 270
 cy_grid_var_2 <= 270
 cx_grid_var_3 <= 270
 cy_grid_var_3 <= 270
 cx_grid_var_4 <= 270
 cy_grid_var_4 <= 270
 cx_grid_var_5 <= 270
 cy_grid_var_5 <= 270
 cx_center <= 135
 cy_center <= 135
 bbox_min_x <= 135
 bbox_max_x <= 135
 bbox_min_y <= 135
 bbox_max_y <= 135
 bbox_w <= 135
 bbox_h <= 135
 aspect_ratio_penalty <= 135
 -135 <= dx_center_diff_0 <= 135
 dx_center_abs_0 <= 135
 -135 <= dy_center_diff_0 <= 135
 dy_center_abs_0 <= 135
 dist_center_0 <= 270
 wirelength <= 5.5296e+06
 -135 <= dx_diff_0_1 <= 135
 -135 <= dy_diff_0_1 <= 135
 -135 <= dx_diff_i_0_2 <= 135
 -135 <= dy_diff_i_0_2 <= 135
 -135 <= dx_diff_j_0_2 <= 135
 -135 <= dy_diff_j_0_2 <= 135
 -135 <= dx_diff_i_0_3 <= 135
 -135 <= dy_diff_i_0_3 <= 135
 -135 <= dx_diff_j_0_3 <= 135
 -135 <= dy_diff_j_0_3 <= 135
 -135 <= dx_diff_i_0_4 <= 135
 -135 <= dy_diff_i_0_4 <= 135
 -135 <= dx_diff_j_0_4 <= 135
 -135 <= dy_diff_j_0_4 <= 135
 -135 <= dx_diff_i_0_5 <= 135
 -135 <= dy_diff_i_0_5 <= 135
 -135 <= dx_diff_j_0_5 <= 135
 -135 <= dy_diff_j_0_5 <= 135
 bbox_area_proxy_t <= 270
Binaries
 r_0 r_1 r_2 r_3 r_4 r_5 r_EMIB_0_2 r_EMIB_0_3 r_EMIB_0_4 r_EMIB_0_5 z1_0_2
 z2_0_2 z1L_0_2 z1R_0_2 z2D_0_2 z2U_0_2 z1_0_3 z2_0_3 z1L_0_3 z1R_0_3
 z2D_0_3 z2U_0_3 z1_0_4 z2_0_4 z1L_0_4 z1R_0_4 z2D_0_4 z2U_0_4 z1_0_5
 z2_0_5 z1L_0_5 z1R_0_5 z2D_0_5 z2U_0_5 p_left_0_1 p_right_0_1 p_down_0_1
 p_up_0_1 p_left_0_2 p_right_0_2 p_down_0_2 p_up_0_2 p_left_0_3 p_right_0_3
 p_down_0_3 p_up_0_3 p_left_0_4 p_right_0_4 p_down_0_4 p_up_0_4 p_left_0_5
 p_right_0_5 p_down_0_5 p_up_0_5 p_left_1_2 p_right_1_2 p_down_1_2 p_up_1_2
 p_left_1_3 p_right_1_3 p_down_1_3 p_up_1_3 p_left_1_4 p_right_1_4
 p_down_1_4 p_up_1_4 p_left_1_5 p_right_1_5 p_down_1_5 p_up_1_5 p_left_2_3
 p_right_2_3 p_down_2_3 p_up_2_3 p_left_2_4 p_right_2_4 p_down_2_4 p_up_2_4
 p_left_2_5 p_right_2_5 p_down_2_5 p_up_2_5 p_left_3_4 p_right_3_4
 p_down_3_4 p_up_3_4 p_left_3_5 p_right_3_5 p_down_3_5 p_up_3_5 p_left_4_5
 p_right_4_5 p_down_4_5 p_up_4_5 p_EMIB_left_0_2_0_3 p_EMIB_right_0_2_0_3
 p_EMIB_down_0_2_0_3 p_EMIB_up_0_2_0_3 p_EMIB_left_0_2_0_4
 p_EMIB_right_0_2_0_4 p_EMIB_down_0_2_0_4 p_EMIB_up_0_2_0_4
 p_EMIB_left_0_2_0_5 p_EMIB_right_0_2_0_5 p_EMIB_down_0_2_0_5
 p_EMIB_up_0_2_0_5 p_EMIB_left_0_3_0_4 p_EMIB_right_0_3_0_4
 p_EMIB_down_0_3_0_4 p_EMIB_up_0_3_0_4 p_EMIB_left_0_3_0_5
 p_EMIB_right_0_3_0_5 p_EMIB_down_0_3_0_5 p_EMIB_up_0_3_0_5
 p_EMIB_left_0_4_0_5 p_EMIB_right_0_4_0_5 p_EMIB_down_0_4_0_5
 p_EMIB_up_0_4_0_5 dx_center_abs_0_is_positive dy_center_abs_0_is_positive
 dx_abs_0_1_is_positive dy_abs_0_1_is_positive dx_abs_i_0_2_is_positive
 dy_abs_i_0_2_is_positive dx_abs_j_0_2_is_positive dy_abs_j_0_2_is_positive
 dx_abs_i_0_3_is_positive dy_abs_i_0_3_is_positive dx_abs_j_0_3_is_positive
 dy_abs_j_0_3_is_positive dx_abs_i_0_4_is_positive dy_abs_i_0_4_is_positive
 dx_abs_j_0_4_is_positive dy_abs_j_0_4_is_positive dx_abs_i_0_5_is_positive
 dy_abs_i_0_5_is_positive dx_abs_j_0_5_is_positive dy_abs_j_0_5_is_positive
End
