\ Model ChipletPlacementGrid
\ LP format - for model browsing. Use MPS format to capture full model detail.
\ Signature: 0x2fe26beb9e01e9b1
Minimize
  9.5365248903299643e-04 aspect_ratio_penalty
   + 1.335344253566415e-04 wirelength
   + 0.1281930483423758 bbox_area_proxy_t
Subject To
 width_rotation_0: - 5.74 r_0 + w_var_0 = 4.62
 height_rotation_0: 5.74 r_0 + h_var_0 = 10.36
 x_grid_var_ub_0: w_var_0 + x_grid_var_0 <= 102
 y_grid_var_ub_0: h_var_0 + y_grid_var_0 <= 102
 width_rotation_1: 3.22 r_1 + w_var_1 = 7
 height_rotation_1: - 3.22 r_1 + h_var_1 = 3.78
 x_grid_var_ub_1: w_var_1 + x_grid_var_1 <= 102
 y_grid_var_ub_1: h_var_1 + y_grid_var_1 <= 102
 width_rotation_2: - 7.7 r_2 + w_var_2 = 2.1
 height_rotation_2: 7.7 r_2 + h_var_2 = 9.8
 x_grid_var_ub_2: w_var_2 + x_grid_var_2 <= 102
 y_grid_var_ub_2: h_var_2 + y_grid_var_2 <= 102
 width_rotation_3: - 7.7 r_3 + w_var_3 = 2.1
 height_rotation_3: 7.7 r_3 + h_var_3 = 9.8
 x_grid_var_ub_3: w_var_3 + x_grid_var_3 <= 102
 y_grid_var_ub_3: h_var_3 + y_grid_var_3 <= 102
 width_rotation_4: - 7.7 r_4 + w_var_4 = 2.1
 height_rotation_4: 7.7 r_4 + h_var_4 = 9.8
 x_grid_var_ub_4: w_var_4 + x_grid_var_4 <= 102
 y_grid_var_ub_4: h_var_4 + y_grid_var_4 <= 102
 width_rotation_5: - 27.58 r_5 + w_var_5 = 5.46
 height_rotation_5: 27.58 r_5 + h_var_5 = 33.04
 x_grid_var_ub_5: w_var_5 + x_grid_var_5 <= 102
 y_grid_var_ub_5: h_var_5 + y_grid_var_5 <= 102
 width_rotation_6: 27.58 r_6 + w_var_6 = 33.04
 height_rotation_6: - 27.58 r_6 + h_var_6 = 5.46
 x_grid_var_ub_6: w_var_6 + x_grid_var_6 <= 102
 y_grid_var_ub_6: h_var_6 + y_grid_var_6 <= 102
 width_rotation_7: - 17.64 r_7 + w_var_7 = 2.52
 height_rotation_7: 17.64 r_7 + h_var_7 = 20.16
 x_grid_var_ub_7: w_var_7 + x_grid_var_7 <= 102
 y_grid_var_ub_7: h_var_7 + y_grid_var_7 <= 102
 EMIB_width_rotation_0_2: 0.2933 r_EMIB_0_2 + EMIB_w_var_0_2 = 2
 EMIB_height_rotation_0_2: - 0.2933 r_EMIB_0_2 + EMIB_h_var_0_2 = 1.7067
 EMIB_x_grid_var_ub_0_2: EMIB_w_var_0_2 + EMIB_x_grid_var_0_2 <= 102
 EMIB_y_grid_var_ub_0_2: EMIB_h_var_0_2 + EMIB_y_grid_var_0_2 <= 102
 EMIB_width_rotation_0_5: 1.1467 r_EMIB_0_5 + EMIB_w_var_0_5 = 2
 EMIB_height_rotation_0_5: - 1.1467 r_EMIB_0_5 + EMIB_h_var_0_5 = 0.8533
 EMIB_x_grid_var_ub_0_5: EMIB_w_var_0_5 + EMIB_x_grid_var_0_5 <= 102
 EMIB_y_grid_var_ub_0_5: EMIB_h_var_0_5 + EMIB_y_grid_var_0_5 <= 102
 EMIB_width_rotation_0_7: 0.2933 r_EMIB_0_7 + EMIB_w_var_0_7 = 2
 EMIB_height_rotation_0_7: - 0.2933 r_EMIB_0_7 + EMIB_h_var_0_7 = 1.7067
 EMIB_x_grid_var_ub_0_7: EMIB_w_var_0_7 + EMIB_x_grid_var_0_7 <= 102
 EMIB_y_grid_var_ub_0_7: EMIB_h_var_0_7 + EMIB_y_grid_var_0_7 <= 102
 EMIB_width_rotation_2_3: 1.1467 r_EMIB_2_3 + EMIB_w_var_2_3 = 2
 EMIB_height_rotation_2_3: - 1.1467 r_EMIB_2_3 + EMIB_h_var_2_3 = 0.8533
 EMIB_x_grid_var_ub_2_3: EMIB_w_var_2_3 + EMIB_x_grid_var_2_3 <= 102
 EMIB_y_grid_var_ub_2_3: EMIB_h_var_2_3 + EMIB_y_grid_var_2_3 <= 102
 EMIB_width_rotation_4_6: 1.1467 r_EMIB_4_6 + EMIB_w_var_4_6 = 2
 EMIB_height_rotation_4_6: - 1.1467 r_EMIB_4_6 + EMIB_h_var_4_6 = 0.8533
 EMIB_x_grid_var_ub_4_6: EMIB_w_var_4_6 + EMIB_x_grid_var_4_6 <= 102
 EMIB_y_grid_var_ub_4_6: EMIB_h_var_4_6 + EMIB_y_grid_var_4_6 <= 102
 EMIB_width_rotation_5_7: 0.2933 r_EMIB_5_7 + EMIB_w_var_5_7 = 2
 EMIB_height_rotation_5_7: - 0.2933 r_EMIB_5_7 + EMIB_h_var_5_7 = 1.7067
 EMIB_x_grid_var_ub_5_7: EMIB_w_var_5_7 + EMIB_x_grid_var_5_7 <= 102
 EMIB_y_grid_var_ub_5_7: EMIB_h_var_5_7 + EMIB_y_grid_var_5_7 <= 102
 EMIB_width_rotation_6_7: 1.1467 r_EMIB_6_7 + EMIB_w_var_6_7 = 2
 EMIB_height_rotation_6_7: - 1.1467 r_EMIB_6_7 + EMIB_h_var_6_7 = 0.8533
 EMIB_x_grid_var_ub_6_7: EMIB_w_var_6_7 + EMIB_x_grid_var_6_7 <= 102
 EMIB_y_grid_var_ub_6_7: EMIB_h_var_6_7 + EMIB_y_grid_var_6_7 <= 102
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
 cx_def_7: - 0.5 w_var_7 - x_grid_var_7 + cx_grid_var_7 = 0
 cy_def_7: - 0.5 h_var_7 - y_grid_var_7 + cy_grid_var_7 = 0
 EMIB_cx_def_0_2: - 0.5 EMIB_w_var_0_2 - EMIB_x_grid_var_0_2
   + EMIB_cx_grid_var_0_2 = 0
 EMIB_cy_def_0_2: - 0.5 EMIB_h_var_0_2 - EMIB_y_grid_var_0_2
   + EMIB_cy_grid_var_0_2 = 0
 EMIB_cx_def_0_5: - 0.5 EMIB_w_var_0_5 - EMIB_x_grid_var_0_5
   + EMIB_cx_grid_var_0_5 = 0
 EMIB_cy_def_0_5: - 0.5 EMIB_h_var_0_5 - EMIB_y_grid_var_0_5
   + EMIB_cy_grid_var_0_5 = 0
 EMIB_cx_def_0_7: - 0.5 EMIB_w_var_0_7 - EMIB_x_grid_var_0_7
   + EMIB_cx_grid_var_0_7 = 0
 EMIB_cy_def_0_7: - 0.5 EMIB_h_var_0_7 - EMIB_y_grid_var_0_7
   + EMIB_cy_grid_var_0_7 = 0
 EMIB_cx_def_2_3: - 0.5 EMIB_w_var_2_3 - EMIB_x_grid_var_2_3
   + EMIB_cx_grid_var_2_3 = 0
 EMIB_cy_def_2_3: - 0.5 EMIB_h_var_2_3 - EMIB_y_grid_var_2_3
   + EMIB_cy_grid_var_2_3 = 0
 EMIB_cx_def_4_6: - 0.5 EMIB_w_var_4_6 - EMIB_x_grid_var_4_6
   + EMIB_cx_grid_var_4_6 = 0
 EMIB_cy_def_4_6: - 0.5 EMIB_h_var_4_6 - EMIB_y_grid_var_4_6
   + EMIB_cy_grid_var_4_6 = 0
 EMIB_cx_def_5_7: - 0.5 EMIB_w_var_5_7 - EMIB_x_grid_var_5_7
   + EMIB_cx_grid_var_5_7 = 0
 EMIB_cy_def_5_7: - 0.5 EMIB_h_var_5_7 - EMIB_y_grid_var_5_7
   + EMIB_cy_grid_var_5_7 = 0
 EMIB_cx_def_6_7: - 0.5 EMIB_w_var_6_7 - EMIB_x_grid_var_6_7
   + EMIB_cx_grid_var_6_7 = 0
 EMIB_cy_def_6_7: - 0.5 EMIB_h_var_6_7 - EMIB_y_grid_var_6_7
   + EMIB_cy_grid_var_6_7 = 0
 must_adjacent_sb_0_2: z1_0_2 + z2_0_2 = 1
 horizontal_direction_sb_0_2: - z1_0_2 + z1L_0_2 + z1R_0_2 = 0
 vertical_direction_sb_0_2: - z2_0_2 + z2D_0_2 + z2U_0_2 = 0
 EMIB_rotate_eq_z2_0_2: r_EMIB_0_2 - z2_0_2 = 0
 horizontal_left_dist_lb_0_2: - w_var_0 - x_grid_var_0 + x_grid_var_2
   - 204 z1L_0_2 >= -204
 EMIB_left_overlap_0_2: w_var_0 + x_grid_var_0 - EMIB_x_grid_var_0_2
   - 204 z1L_0_2 >= -203.001
 EMIB_right_overlap_0_2: EMIB_w_var_0_2 - x_grid_var_2
   + EMIB_x_grid_var_0_2 - 204 z1L_0_2 >= -203.001
 horizontal_right_dist_lb_0_2: - w_var_2 + x_grid_var_0 - x_grid_var_2
   - 204 z1R_0_2 >= -204
 EMIB_left_overlap_right_0_2: w_var_2 + x_grid_var_2 - EMIB_x_grid_var_0_2
   - 204 z1R_0_2 >= -203.001
 EMIB_right_overlap_right_0_2: EMIB_w_var_0_2 - x_grid_var_0
   + EMIB_x_grid_var_0_2 - 204 z1R_0_2 >= -203.001
 vertical_down_dist_lb_0_2: - h_var_0 - y_grid_var_0 + y_grid_var_2
   - 204 z2D_0_2 >= -204
 EMIB_bottom_overlap_down_0_2: h_var_0 + y_grid_var_0 - EMIB_y_grid_var_0_2
   - 204 z2D_0_2 >= -203.001
 EMIB_top_overlap_down_0_2: EMIB_h_var_0_2 - y_grid_var_2
   + EMIB_y_grid_var_0_2 - 204 z2D_0_2 >= -203.001
 vertical_up_dist_lb_0_2: - h_var_2 + y_grid_var_0 - y_grid_var_2
   - 204 z2U_0_2 >= -204
 EMIB_bottom_overlap_up_0_2: h_var_2 + y_grid_var_2 - EMIB_y_grid_var_0_2
   - 204 z2U_0_2 >= -203.001
 EMIB_top_overlap_up_0_2: EMIB_h_var_0_2 - y_grid_var_0
   + EMIB_y_grid_var_0_2 - 204 z2U_0_2 >= -203.001
 shared_yi_ub1_0_2: h_var_0 - EMIB_h_var_0_2 + y_grid_var_0
   - EMIB_y_grid_var_0_2 - 204 z1_0_2 >= -204
 shared_yi_ub2_0_2: y_grid_var_0 - EMIB_y_grid_var_0_2 + 204 z1_0_2 <= 204
 shared_yj_ub1_0_2: h_var_2 - EMIB_h_var_0_2 + y_grid_var_2
   - EMIB_y_grid_var_0_2 - 204 z1_0_2 >= -204
 shared_yj_ub2_0_2: y_grid_var_2 - EMIB_y_grid_var_0_2 + 204 z1_0_2 <= 204
 shared_xi_ub1_0_2: w_var_0 - EMIB_w_var_0_2 + x_grid_var_0
   - EMIB_x_grid_var_0_2 - 204 z2_0_2 >= -204
 shared_xi_ub2_0_2: x_grid_var_0 - EMIB_x_grid_var_0_2 + 204 z2_0_2 <= 204
 shared_xj_ub1_0_2: w_var_2 - EMIB_w_var_0_2 + x_grid_var_2
   - EMIB_x_grid_var_0_2 - 204 z2_0_2 >= -204
 shared_xj_ub2_0_2: x_grid_var_2 - EMIB_x_grid_var_0_2 + 204 z2_0_2 <= 204
 must_adjacent_sb_0_5: z1_0_5 + z2_0_5 = 1
 horizontal_direction_sb_0_5: - z1_0_5 + z1L_0_5 + z1R_0_5 = 0
 vertical_direction_sb_0_5: - z2_0_5 + z2D_0_5 + z2U_0_5 = 0
 EMIB_rotate_eq_z2_0_5: r_EMIB_0_5 - z2_0_5 = 0
 horizontal_left_dist_lb_0_5: - w_var_0 - x_grid_var_0 + x_grid_var_5
   - 204 z1L_0_5 >= -204
 EMIB_left_overlap_0_5: w_var_0 + x_grid_var_0 - EMIB_x_grid_var_0_5
   - 204 z1L_0_5 >= -203.001
 EMIB_right_overlap_0_5: EMIB_w_var_0_5 - x_grid_var_5
   + EMIB_x_grid_var_0_5 - 204 z1L_0_5 >= -203.001
 horizontal_right_dist_lb_0_5: - w_var_5 + x_grid_var_0 - x_grid_var_5
   - 204 z1R_0_5 >= -204
 EMIB_left_overlap_right_0_5: w_var_5 + x_grid_var_5 - EMIB_x_grid_var_0_5
   - 204 z1R_0_5 >= -203.001
 EMIB_right_overlap_right_0_5: EMIB_w_var_0_5 - x_grid_var_0
   + EMIB_x_grid_var_0_5 - 204 z1R_0_5 >= -203.001
 vertical_down_dist_lb_0_5: - h_var_0 - y_grid_var_0 + y_grid_var_5
   - 204 z2D_0_5 >= -204
 EMIB_bottom_overlap_down_0_5: h_var_0 + y_grid_var_0 - EMIB_y_grid_var_0_5
   - 204 z2D_0_5 >= -203.001
 EMIB_top_overlap_down_0_5: EMIB_h_var_0_5 - y_grid_var_5
   + EMIB_y_grid_var_0_5 - 204 z2D_0_5 >= -203.001
 vertical_up_dist_lb_0_5: - h_var_5 + y_grid_var_0 - y_grid_var_5
   - 204 z2U_0_5 >= -204
 EMIB_bottom_overlap_up_0_5: h_var_5 + y_grid_var_5 - EMIB_y_grid_var_0_5
   - 204 z2U_0_5 >= -203.001
 EMIB_top_overlap_up_0_5: EMIB_h_var_0_5 - y_grid_var_0
   + EMIB_y_grid_var_0_5 - 204 z2U_0_5 >= -203.001
 shared_yi_ub1_0_5: h_var_0 - EMIB_h_var_0_5 + y_grid_var_0
   - EMIB_y_grid_var_0_5 - 204 z1_0_5 >= -204
 shared_yi_ub2_0_5: y_grid_var_0 - EMIB_y_grid_var_0_5 + 204 z1_0_5 <= 204
 shared_yj_ub1_0_5: h_var_5 - EMIB_h_var_0_5 + y_grid_var_5
   - EMIB_y_grid_var_0_5 - 204 z1_0_5 >= -204
 shared_yj_ub2_0_5: y_grid_var_5 - EMIB_y_grid_var_0_5 + 204 z1_0_5 <= 204
 shared_xi_ub1_0_5: w_var_0 - EMIB_w_var_0_5 + x_grid_var_0
   - EMIB_x_grid_var_0_5 - 204 z2_0_5 >= -204
 shared_xi_ub2_0_5: x_grid_var_0 - EMIB_x_grid_var_0_5 + 204 z2_0_5 <= 204
 shared_xj_ub1_0_5: w_var_5 - EMIB_w_var_0_5 + x_grid_var_5
   - EMIB_x_grid_var_0_5 - 204 z2_0_5 >= -204
 shared_xj_ub2_0_5: x_grid_var_5 - EMIB_x_grid_var_0_5 + 204 z2_0_5 <= 204
 must_adjacent_sb_0_7: z1_0_7 + z2_0_7 = 1
 horizontal_direction_sb_0_7: - z1_0_7 + z1L_0_7 + z1R_0_7 = 0
 vertical_direction_sb_0_7: - z2_0_7 + z2D_0_7 + z2U_0_7 = 0
 EMIB_rotate_eq_z2_0_7: r_EMIB_0_7 - z2_0_7 = 0
 horizontal_left_dist_lb_0_7: - w_var_0 - x_grid_var_0 + x_grid_var_7
   - 204 z1L_0_7 >= -204
 EMIB_left_overlap_0_7: w_var_0 + x_grid_var_0 - EMIB_x_grid_var_0_7
   - 204 z1L_0_7 >= -203.001
 EMIB_right_overlap_0_7: EMIB_w_var_0_7 - x_grid_var_7
   + EMIB_x_grid_var_0_7 - 204 z1L_0_7 >= -203.001
 horizontal_right_dist_lb_0_7: - w_var_7 + x_grid_var_0 - x_grid_var_7
   - 204 z1R_0_7 >= -204
 EMIB_left_overlap_right_0_7: w_var_7 + x_grid_var_7 - EMIB_x_grid_var_0_7
   - 204 z1R_0_7 >= -203.001
 EMIB_right_overlap_right_0_7: EMIB_w_var_0_7 - x_grid_var_0
   + EMIB_x_grid_var_0_7 - 204 z1R_0_7 >= -203.001
 vertical_down_dist_lb_0_7: - h_var_0 - y_grid_var_0 + y_grid_var_7
   - 204 z2D_0_7 >= -204
 EMIB_bottom_overlap_down_0_7: h_var_0 + y_grid_var_0 - EMIB_y_grid_var_0_7
   - 204 z2D_0_7 >= -203.001
 EMIB_top_overlap_down_0_7: EMIB_h_var_0_7 - y_grid_var_7
   + EMIB_y_grid_var_0_7 - 204 z2D_0_7 >= -203.001
 vertical_up_dist_lb_0_7: - h_var_7 + y_grid_var_0 - y_grid_var_7
   - 204 z2U_0_7 >= -204
 EMIB_bottom_overlap_up_0_7: h_var_7 + y_grid_var_7 - EMIB_y_grid_var_0_7
   - 204 z2U_0_7 >= -203.001
 EMIB_top_overlap_up_0_7: EMIB_h_var_0_7 - y_grid_var_0
   + EMIB_y_grid_var_0_7 - 204 z2U_0_7 >= -203.001
 shared_yi_ub1_0_7: h_var_0 - EMIB_h_var_0_7 + y_grid_var_0
   - EMIB_y_grid_var_0_7 - 204 z1_0_7 >= -204
 shared_yi_ub2_0_7: y_grid_var_0 - EMIB_y_grid_var_0_7 + 204 z1_0_7 <= 204
 shared_yj_ub1_0_7: h_var_7 - EMIB_h_var_0_7 + y_grid_var_7
   - EMIB_y_grid_var_0_7 - 204 z1_0_7 >= -204
 shared_yj_ub2_0_7: y_grid_var_7 - EMIB_y_grid_var_0_7 + 204 z1_0_7 <= 204
 shared_xi_ub1_0_7: w_var_0 - EMIB_w_var_0_7 + x_grid_var_0
   - EMIB_x_grid_var_0_7 - 204 z2_0_7 >= -204
 shared_xi_ub2_0_7: x_grid_var_0 - EMIB_x_grid_var_0_7 + 204 z2_0_7 <= 204
 shared_xj_ub1_0_7: w_var_7 - EMIB_w_var_0_7 + x_grid_var_7
   - EMIB_x_grid_var_0_7 - 204 z2_0_7 >= -204
 shared_xj_ub2_0_7: x_grid_var_7 - EMIB_x_grid_var_0_7 + 204 z2_0_7 <= 204
 must_adjacent_sb_2_3: z1_2_3 + z2_2_3 = 1
 horizontal_direction_sb_2_3: - z1_2_3 + z1L_2_3 + z1R_2_3 = 0
 vertical_direction_sb_2_3: - z2_2_3 + z2D_2_3 + z2U_2_3 = 0
 EMIB_rotate_eq_z2_2_3: r_EMIB_2_3 - z2_2_3 = 0
 horizontal_left_dist_lb_2_3: - w_var_2 - x_grid_var_2 + x_grid_var_3
   - 204 z1L_2_3 >= -204
 EMIB_left_overlap_2_3: w_var_2 + x_grid_var_2 - EMIB_x_grid_var_2_3
   - 204 z1L_2_3 >= -203.001
 EMIB_right_overlap_2_3: EMIB_w_var_2_3 - x_grid_var_3
   + EMIB_x_grid_var_2_3 - 204 z1L_2_3 >= -203.001
 horizontal_right_dist_lb_2_3: - w_var_3 + x_grid_var_2 - x_grid_var_3
   - 204 z1R_2_3 >= -204
 EMIB_left_overlap_right_2_3: w_var_3 + x_grid_var_3 - EMIB_x_grid_var_2_3
   - 204 z1R_2_3 >= -203.001
 EMIB_right_overlap_right_2_3: EMIB_w_var_2_3 - x_grid_var_2
   + EMIB_x_grid_var_2_3 - 204 z1R_2_3 >= -203.001
 vertical_down_dist_lb_2_3: - h_var_2 - y_grid_var_2 + y_grid_var_3
   - 204 z2D_2_3 >= -204
 EMIB_bottom_overlap_down_2_3: h_var_2 + y_grid_var_2 - EMIB_y_grid_var_2_3
   - 204 z2D_2_3 >= -203.001
 EMIB_top_overlap_down_2_3: EMIB_h_var_2_3 - y_grid_var_3
   + EMIB_y_grid_var_2_3 - 204 z2D_2_3 >= -203.001
 vertical_up_dist_lb_2_3: - h_var_3 + y_grid_var_2 - y_grid_var_3
   - 204 z2U_2_3 >= -204
 EMIB_bottom_overlap_up_2_3: h_var_3 + y_grid_var_3 - EMIB_y_grid_var_2_3
   - 204 z2U_2_3 >= -203.001
 EMIB_top_overlap_up_2_3: EMIB_h_var_2_3 - y_grid_var_2
   + EMIB_y_grid_var_2_3 - 204 z2U_2_3 >= -203.001
 shared_yi_ub1_2_3: h_var_2 - EMIB_h_var_2_3 + y_grid_var_2
   - EMIB_y_grid_var_2_3 - 204 z1_2_3 >= -204
 shared_yi_ub2_2_3: y_grid_var_2 - EMIB_y_grid_var_2_3 + 204 z1_2_3 <= 204
 shared_yj_ub1_2_3: h_var_3 - EMIB_h_var_2_3 + y_grid_var_3
   - EMIB_y_grid_var_2_3 - 204 z1_2_3 >= -204
 shared_yj_ub2_2_3: y_grid_var_3 - EMIB_y_grid_var_2_3 + 204 z1_2_3 <= 204
 shared_xi_ub1_2_3: w_var_2 - EMIB_w_var_2_3 + x_grid_var_2
   - EMIB_x_grid_var_2_3 - 204 z2_2_3 >= -204
 shared_xi_ub2_2_3: x_grid_var_2 - EMIB_x_grid_var_2_3 + 204 z2_2_3 <= 204
 shared_xj_ub1_2_3: w_var_3 - EMIB_w_var_2_3 + x_grid_var_3
   - EMIB_x_grid_var_2_3 - 204 z2_2_3 >= -204
 shared_xj_ub2_2_3: x_grid_var_3 - EMIB_x_grid_var_2_3 + 204 z2_2_3 <= 204
 must_adjacent_sb_4_6: z1_4_6 + z2_4_6 = 1
 horizontal_direction_sb_4_6: - z1_4_6 + z1L_4_6 + z1R_4_6 = 0
 vertical_direction_sb_4_6: - z2_4_6 + z2D_4_6 + z2U_4_6 = 0
 EMIB_rotate_eq_z2_4_6: r_EMIB_4_6 - z2_4_6 = 0
 horizontal_left_dist_lb_4_6: - w_var_4 - x_grid_var_4 + x_grid_var_6
   - 204 z1L_4_6 >= -204
 EMIB_left_overlap_4_6: w_var_4 + x_grid_var_4 - EMIB_x_grid_var_4_6
   - 204 z1L_4_6 >= -203.001
 EMIB_right_overlap_4_6: EMIB_w_var_4_6 - x_grid_var_6
   + EMIB_x_grid_var_4_6 - 204 z1L_4_6 >= -203.001
 horizontal_right_dist_lb_4_6: - w_var_6 + x_grid_var_4 - x_grid_var_6
   - 204 z1R_4_6 >= -204
 EMIB_left_overlap_right_4_6: w_var_6 + x_grid_var_6 - EMIB_x_grid_var_4_6
   - 204 z1R_4_6 >= -203.001
 EMIB_right_overlap_right_4_6: EMIB_w_var_4_6 - x_grid_var_4
   + EMIB_x_grid_var_4_6 - 204 z1R_4_6 >= -203.001
 vertical_down_dist_lb_4_6: - h_var_4 - y_grid_var_4 + y_grid_var_6
   - 204 z2D_4_6 >= -204
 EMIB_bottom_overlap_down_4_6: h_var_4 + y_grid_var_4 - EMIB_y_grid_var_4_6
   - 204 z2D_4_6 >= -203.001
 EMIB_top_overlap_down_4_6: EMIB_h_var_4_6 - y_grid_var_6
   + EMIB_y_grid_var_4_6 - 204 z2D_4_6 >= -203.001
 vertical_up_dist_lb_4_6: - h_var_6 + y_grid_var_4 - y_grid_var_6
   - 204 z2U_4_6 >= -204
 EMIB_bottom_overlap_up_4_6: h_var_6 + y_grid_var_6 - EMIB_y_grid_var_4_6
   - 204 z2U_4_6 >= -203.001
 EMIB_top_overlap_up_4_6: EMIB_h_var_4_6 - y_grid_var_4
   + EMIB_y_grid_var_4_6 - 204 z2U_4_6 >= -203.001
 shared_yi_ub1_4_6: h_var_4 - EMIB_h_var_4_6 + y_grid_var_4
   - EMIB_y_grid_var_4_6 - 204 z1_4_6 >= -204
 shared_yi_ub2_4_6: y_grid_var_4 - EMIB_y_grid_var_4_6 + 204 z1_4_6 <= 204
 shared_yj_ub1_4_6: h_var_6 - EMIB_h_var_4_6 + y_grid_var_6
   - EMIB_y_grid_var_4_6 - 204 z1_4_6 >= -204
 shared_yj_ub2_4_6: y_grid_var_6 - EMIB_y_grid_var_4_6 + 204 z1_4_6 <= 204
 shared_xi_ub1_4_6: w_var_4 - EMIB_w_var_4_6 + x_grid_var_4
   - EMIB_x_grid_var_4_6 - 204 z2_4_6 >= -204
 shared_xi_ub2_4_6: x_grid_var_4 - EMIB_x_grid_var_4_6 + 204 z2_4_6 <= 204
 shared_xj_ub1_4_6: w_var_6 - EMIB_w_var_4_6 + x_grid_var_6
   - EMIB_x_grid_var_4_6 - 204 z2_4_6 >= -204
 shared_xj_ub2_4_6: x_grid_var_6 - EMIB_x_grid_var_4_6 + 204 z2_4_6 <= 204
 must_adjacent_sb_5_7: z1_5_7 + z2_5_7 = 1
 horizontal_direction_sb_5_7: - z1_5_7 + z1L_5_7 + z1R_5_7 = 0
 vertical_direction_sb_5_7: - z2_5_7 + z2D_5_7 + z2U_5_7 = 0
 EMIB_rotate_eq_z2_5_7: r_EMIB_5_7 - z2_5_7 = 0
 horizontal_left_dist_lb_5_7: - w_var_5 - x_grid_var_5 + x_grid_var_7
   - 204 z1L_5_7 >= -204
 EMIB_left_overlap_5_7: w_var_5 + x_grid_var_5 - EMIB_x_grid_var_5_7
   - 204 z1L_5_7 >= -203.001
 EMIB_right_overlap_5_7: EMIB_w_var_5_7 - x_grid_var_7
   + EMIB_x_grid_var_5_7 - 204 z1L_5_7 >= -203.001
 horizontal_right_dist_lb_5_7: - w_var_7 + x_grid_var_5 - x_grid_var_7
   - 204 z1R_5_7 >= -204
 EMIB_left_overlap_right_5_7: w_var_7 + x_grid_var_7 - EMIB_x_grid_var_5_7
   - 204 z1R_5_7 >= -203.001
 EMIB_right_overlap_right_5_7: EMIB_w_var_5_7 - x_grid_var_5
   + EMIB_x_grid_var_5_7 - 204 z1R_5_7 >= -203.001
 vertical_down_dist_lb_5_7: - h_var_5 - y_grid_var_5 + y_grid_var_7
   - 204 z2D_5_7 >= -204
 EMIB_bottom_overlap_down_5_7: h_var_5 + y_grid_var_5 - EMIB_y_grid_var_5_7
   - 204 z2D_5_7 >= -203.001
 EMIB_top_overlap_down_5_7: EMIB_h_var_5_7 - y_grid_var_7
   + EMIB_y_grid_var_5_7 - 204 z2D_5_7 >= -203.001
 vertical_up_dist_lb_5_7: - h_var_7 + y_grid_var_5 - y_grid_var_7
   - 204 z2U_5_7 >= -204
 EMIB_bottom_overlap_up_5_7: h_var_7 + y_grid_var_7 - EMIB_y_grid_var_5_7
   - 204 z2U_5_7 >= -203.001
 EMIB_top_overlap_up_5_7: EMIB_h_var_5_7 - y_grid_var_5
   + EMIB_y_grid_var_5_7 - 204 z2U_5_7 >= -203.001
 shared_yi_ub1_5_7: h_var_5 - EMIB_h_var_5_7 + y_grid_var_5
   - EMIB_y_grid_var_5_7 - 204 z1_5_7 >= -204
 shared_yi_ub2_5_7: y_grid_var_5 - EMIB_y_grid_var_5_7 + 204 z1_5_7 <= 204
 shared_yj_ub1_5_7: h_var_7 - EMIB_h_var_5_7 + y_grid_var_7
   - EMIB_y_grid_var_5_7 - 204 z1_5_7 >= -204
 shared_yj_ub2_5_7: y_grid_var_7 - EMIB_y_grid_var_5_7 + 204 z1_5_7 <= 204
 shared_xi_ub1_5_7: w_var_5 - EMIB_w_var_5_7 + x_grid_var_5
   - EMIB_x_grid_var_5_7 - 204 z2_5_7 >= -204
 shared_xi_ub2_5_7: x_grid_var_5 - EMIB_x_grid_var_5_7 + 204 z2_5_7 <= 204
 shared_xj_ub1_5_7: w_var_7 - EMIB_w_var_5_7 + x_grid_var_7
   - EMIB_x_grid_var_5_7 - 204 z2_5_7 >= -204
 shared_xj_ub2_5_7: x_grid_var_7 - EMIB_x_grid_var_5_7 + 204 z2_5_7 <= 204
 must_adjacent_sb_6_7: z1_6_7 + z2_6_7 = 1
 horizontal_direction_sb_6_7: - z1_6_7 + z1L_6_7 + z1R_6_7 = 0
 vertical_direction_sb_6_7: - z2_6_7 + z2D_6_7 + z2U_6_7 = 0
 EMIB_rotate_eq_z2_6_7: r_EMIB_6_7 - z2_6_7 = 0
 horizontal_left_dist_lb_6_7: - w_var_6 - x_grid_var_6 + x_grid_var_7
   - 204 z1L_6_7 >= -204
 EMIB_left_overlap_6_7: w_var_6 + x_grid_var_6 - EMIB_x_grid_var_6_7
   - 204 z1L_6_7 >= -203.001
 EMIB_right_overlap_6_7: EMIB_w_var_6_7 - x_grid_var_7
   + EMIB_x_grid_var_6_7 - 204 z1L_6_7 >= -203.001
 horizontal_right_dist_lb_6_7: - w_var_7 + x_grid_var_6 - x_grid_var_7
   - 204 z1R_6_7 >= -204
 EMIB_left_overlap_right_6_7: w_var_7 + x_grid_var_7 - EMIB_x_grid_var_6_7
   - 204 z1R_6_7 >= -203.001
 EMIB_right_overlap_right_6_7: EMIB_w_var_6_7 - x_grid_var_6
   + EMIB_x_grid_var_6_7 - 204 z1R_6_7 >= -203.001
 vertical_down_dist_lb_6_7: - h_var_6 - y_grid_var_6 + y_grid_var_7
   - 204 z2D_6_7 >= -204
 EMIB_bottom_overlap_down_6_7: h_var_6 + y_grid_var_6 - EMIB_y_grid_var_6_7
   - 204 z2D_6_7 >= -203.001
 EMIB_top_overlap_down_6_7: EMIB_h_var_6_7 - y_grid_var_7
   + EMIB_y_grid_var_6_7 - 204 z2D_6_7 >= -203.001
 vertical_up_dist_lb_6_7: - h_var_7 + y_grid_var_6 - y_grid_var_7
   - 204 z2U_6_7 >= -204
 EMIB_bottom_overlap_up_6_7: h_var_7 + y_grid_var_7 - EMIB_y_grid_var_6_7
   - 204 z2U_6_7 >= -203.001
 EMIB_top_overlap_up_6_7: EMIB_h_var_6_7 - y_grid_var_6
   + EMIB_y_grid_var_6_7 - 204 z2U_6_7 >= -203.001
 shared_yi_ub1_6_7: h_var_6 - EMIB_h_var_6_7 + y_grid_var_6
   - EMIB_y_grid_var_6_7 - 204 z1_6_7 >= -204
 shared_yi_ub2_6_7: y_grid_var_6 - EMIB_y_grid_var_6_7 + 204 z1_6_7 <= 204
 shared_yj_ub1_6_7: h_var_7 - EMIB_h_var_6_7 + y_grid_var_7
   - EMIB_y_grid_var_6_7 - 204 z1_6_7 >= -204
 shared_yj_ub2_6_7: y_grid_var_7 - EMIB_y_grid_var_6_7 + 204 z1_6_7 <= 204
 shared_xi_ub1_6_7: w_var_6 - EMIB_w_var_6_7 + x_grid_var_6
   - EMIB_x_grid_var_6_7 - 204 z2_6_7 >= -204
 shared_xi_ub2_6_7: x_grid_var_6 - EMIB_x_grid_var_6_7 + 204 z2_6_7 <= 204
 shared_xj_ub1_6_7: w_var_7 - EMIB_w_var_6_7 + x_grid_var_7
   - EMIB_x_grid_var_6_7 - 204 z2_6_7 >= -204
 shared_xj_ub2_6_7: x_grid_var_7 - EMIB_x_grid_var_6_7 + 204 z2_6_7 <= 204
 non_overlap_any_0_1: p_left_0_1 + p_right_0_1 + p_down_0_1 + p_up_0_1
   >= 1
 non_overlap_left_0_1: w_var_0 + x_grid_var_0 - x_grid_var_1
   + 204 p_left_0_1 <= 204
 non_overlap_left_rev_0_1: - w_var_0 - x_grid_var_0 + x_grid_var_1
   - 204 p_left_0_1 <= 0
 non_overlap_right_0_1: w_var_1 - x_grid_var_0 + x_grid_var_1
   + 204 p_right_0_1 <= 204
 non_overlap_right_rev_0_1: - w_var_1 + x_grid_var_0 - x_grid_var_1
   - 204 p_right_0_1 <= 0
 non_overlap_down_0_1: h_var_0 + y_grid_var_0 - y_grid_var_1
   + 204 p_down_0_1 <= 204
 non_overlap_down_rev_0_1: - h_var_0 - y_grid_var_0 + y_grid_var_1
   - 204 p_down_0_1 <= 0
 non_overlap_up_0_1: h_var_1 - y_grid_var_0 + y_grid_var_1 + 204 p_up_0_1
   <= 204
 non_overlap_up_rev_0_1: - h_var_1 + y_grid_var_0 - y_grid_var_1
   - 204 p_up_0_1 <= 0
 non_overlap_any_0_2: p_left_0_2 + p_right_0_2 + p_down_0_2 + p_up_0_2
   >= 1
 non_overlap_left_0_2: w_var_0 + x_grid_var_0 - x_grid_var_2
   + 204 p_left_0_2 <= 204
 non_overlap_left_rev_0_2: - w_var_0 - x_grid_var_0 + x_grid_var_2
   - 204 p_left_0_2 <= 0
 non_overlap_right_0_2: w_var_2 - x_grid_var_0 + x_grid_var_2
   + 204 p_right_0_2 <= 204
 non_overlap_right_rev_0_2: - w_var_2 + x_grid_var_0 - x_grid_var_2
   - 204 p_right_0_2 <= 0
 non_overlap_down_0_2: h_var_0 + y_grid_var_0 - y_grid_var_2
   + 204 p_down_0_2 <= 204
 non_overlap_down_rev_0_2: - h_var_0 - y_grid_var_0 + y_grid_var_2
   - 204 p_down_0_2 <= 0
 non_overlap_up_0_2: h_var_2 - y_grid_var_0 + y_grid_var_2 + 204 p_up_0_2
   <= 204
 non_overlap_up_rev_0_2: - h_var_2 + y_grid_var_0 - y_grid_var_2
   - 204 p_up_0_2 <= 0
 non_overlap_any_0_3: p_left_0_3 + p_right_0_3 + p_down_0_3 + p_up_0_3
   >= 1
 non_overlap_left_0_3: w_var_0 + x_grid_var_0 - x_grid_var_3
   + 204 p_left_0_3 <= 204
 non_overlap_left_rev_0_3: - w_var_0 - x_grid_var_0 + x_grid_var_3
   - 204 p_left_0_3 <= 0
 non_overlap_right_0_3: w_var_3 - x_grid_var_0 + x_grid_var_3
   + 204 p_right_0_3 <= 204
 non_overlap_right_rev_0_3: - w_var_3 + x_grid_var_0 - x_grid_var_3
   - 204 p_right_0_3 <= 0
 non_overlap_down_0_3: h_var_0 + y_grid_var_0 - y_grid_var_3
   + 204 p_down_0_3 <= 204
 non_overlap_down_rev_0_3: - h_var_0 - y_grid_var_0 + y_grid_var_3
   - 204 p_down_0_3 <= 0
 non_overlap_up_0_3: h_var_3 - y_grid_var_0 + y_grid_var_3 + 204 p_up_0_3
   <= 204
 non_overlap_up_rev_0_3: - h_var_3 + y_grid_var_0 - y_grid_var_3
   - 204 p_up_0_3 <= 0
 non_overlap_any_0_4: p_left_0_4 + p_right_0_4 + p_down_0_4 + p_up_0_4
   >= 1
 non_overlap_left_0_4: w_var_0 + x_grid_var_0 - x_grid_var_4
   + 204 p_left_0_4 <= 204
 non_overlap_left_rev_0_4: - w_var_0 - x_grid_var_0 + x_grid_var_4
   - 204 p_left_0_4 <= 0
 non_overlap_right_0_4: w_var_4 - x_grid_var_0 + x_grid_var_4
   + 204 p_right_0_4 <= 204
 non_overlap_right_rev_0_4: - w_var_4 + x_grid_var_0 - x_grid_var_4
   - 204 p_right_0_4 <= 0
 non_overlap_down_0_4: h_var_0 + y_grid_var_0 - y_grid_var_4
   + 204 p_down_0_4 <= 204
 non_overlap_down_rev_0_4: - h_var_0 - y_grid_var_0 + y_grid_var_4
   - 204 p_down_0_4 <= 0
 non_overlap_up_0_4: h_var_4 - y_grid_var_0 + y_grid_var_4 + 204 p_up_0_4
   <= 204
 non_overlap_up_rev_0_4: - h_var_4 + y_grid_var_0 - y_grid_var_4
   - 204 p_up_0_4 <= 0
 non_overlap_any_0_5: p_left_0_5 + p_right_0_5 + p_down_0_5 + p_up_0_5
   >= 1
 non_overlap_left_0_5: w_var_0 + x_grid_var_0 - x_grid_var_5
   + 204 p_left_0_5 <= 204
 non_overlap_left_rev_0_5: - w_var_0 - x_grid_var_0 + x_grid_var_5
   - 204 p_left_0_5 <= 0
 non_overlap_right_0_5: w_var_5 - x_grid_var_0 + x_grid_var_5
   + 204 p_right_0_5 <= 204
 non_overlap_right_rev_0_5: - w_var_5 + x_grid_var_0 - x_grid_var_5
   - 204 p_right_0_5 <= 0
 non_overlap_down_0_5: h_var_0 + y_grid_var_0 - y_grid_var_5
   + 204 p_down_0_5 <= 204
 non_overlap_down_rev_0_5: - h_var_0 - y_grid_var_0 + y_grid_var_5
   - 204 p_down_0_5 <= 0
 non_overlap_up_0_5: h_var_5 - y_grid_var_0 + y_grid_var_5 + 204 p_up_0_5
   <= 204
 non_overlap_up_rev_0_5: - h_var_5 + y_grid_var_0 - y_grid_var_5
   - 204 p_up_0_5 <= 0
 non_overlap_any_0_6: p_left_0_6 + p_right_0_6 + p_down_0_6 + p_up_0_6
   >= 1
 non_overlap_left_0_6: w_var_0 + x_grid_var_0 - x_grid_var_6
   + 204 p_left_0_6 <= 204
 non_overlap_left_rev_0_6: - w_var_0 - x_grid_var_0 + x_grid_var_6
   - 204 p_left_0_6 <= 0
 non_overlap_right_0_6: w_var_6 - x_grid_var_0 + x_grid_var_6
   + 204 p_right_0_6 <= 204
 non_overlap_right_rev_0_6: - w_var_6 + x_grid_var_0 - x_grid_var_6
   - 204 p_right_0_6 <= 0
 non_overlap_down_0_6: h_var_0 + y_grid_var_0 - y_grid_var_6
   + 204 p_down_0_6 <= 204
 non_overlap_down_rev_0_6: - h_var_0 - y_grid_var_0 + y_grid_var_6
   - 204 p_down_0_6 <= 0
 non_overlap_up_0_6: h_var_6 - y_grid_var_0 + y_grid_var_6 + 204 p_up_0_6
   <= 204
 non_overlap_up_rev_0_6: - h_var_6 + y_grid_var_0 - y_grid_var_6
   - 204 p_up_0_6 <= 0
 non_overlap_any_0_7: p_left_0_7 + p_right_0_7 + p_down_0_7 + p_up_0_7
   >= 1
 non_overlap_left_0_7: w_var_0 + x_grid_var_0 - x_grid_var_7
   + 204 p_left_0_7 <= 204
 non_overlap_left_rev_0_7: - w_var_0 - x_grid_var_0 + x_grid_var_7
   - 204 p_left_0_7 <= 0
 non_overlap_right_0_7: w_var_7 - x_grid_var_0 + x_grid_var_7
   + 204 p_right_0_7 <= 204
 non_overlap_right_rev_0_7: - w_var_7 + x_grid_var_0 - x_grid_var_7
   - 204 p_right_0_7 <= 0
 non_overlap_down_0_7: h_var_0 + y_grid_var_0 - y_grid_var_7
   + 204 p_down_0_7 <= 204
 non_overlap_down_rev_0_7: - h_var_0 - y_grid_var_0 + y_grid_var_7
   - 204 p_down_0_7 <= 0
 non_overlap_up_0_7: h_var_7 - y_grid_var_0 + y_grid_var_7 + 204 p_up_0_7
   <= 204
 non_overlap_up_rev_0_7: - h_var_7 + y_grid_var_0 - y_grid_var_7
   - 204 p_up_0_7 <= 0
 non_overlap_any_1_2: p_left_1_2 + p_right_1_2 + p_down_1_2 + p_up_1_2
   >= 1
 non_overlap_left_1_2: w_var_1 + x_grid_var_1 - x_grid_var_2
   + 204 p_left_1_2 <= 204
 non_overlap_left_rev_1_2: - w_var_1 - x_grid_var_1 + x_grid_var_2
   - 204 p_left_1_2 <= 0
 non_overlap_right_1_2: w_var_2 - x_grid_var_1 + x_grid_var_2
   + 204 p_right_1_2 <= 204
 non_overlap_right_rev_1_2: - w_var_2 + x_grid_var_1 - x_grid_var_2
   - 204 p_right_1_2 <= 0
 non_overlap_down_1_2: h_var_1 + y_grid_var_1 - y_grid_var_2
   + 204 p_down_1_2 <= 204
 non_overlap_down_rev_1_2: - h_var_1 - y_grid_var_1 + y_grid_var_2
   - 204 p_down_1_2 <= 0
 non_overlap_up_1_2: h_var_2 - y_grid_var_1 + y_grid_var_2 + 204 p_up_1_2
   <= 204
 non_overlap_up_rev_1_2: - h_var_2 + y_grid_var_1 - y_grid_var_2
   - 204 p_up_1_2 <= 0
 non_overlap_any_1_3: p_left_1_3 + p_right_1_3 + p_down_1_3 + p_up_1_3
   >= 1
 non_overlap_left_1_3: w_var_1 + x_grid_var_1 - x_grid_var_3
   + 204 p_left_1_3 <= 204
 non_overlap_left_rev_1_3: - w_var_1 - x_grid_var_1 + x_grid_var_3
   - 204 p_left_1_3 <= 0
 non_overlap_right_1_3: w_var_3 - x_grid_var_1 + x_grid_var_3
   + 204 p_right_1_3 <= 204
 non_overlap_right_rev_1_3: - w_var_3 + x_grid_var_1 - x_grid_var_3
   - 204 p_right_1_3 <= 0
 non_overlap_down_1_3: h_var_1 + y_grid_var_1 - y_grid_var_3
   + 204 p_down_1_3 <= 204
 non_overlap_down_rev_1_3: - h_var_1 - y_grid_var_1 + y_grid_var_3
   - 204 p_down_1_3 <= 0
 non_overlap_up_1_3: h_var_3 - y_grid_var_1 + y_grid_var_3 + 204 p_up_1_3
   <= 204
 non_overlap_up_rev_1_3: - h_var_3 + y_grid_var_1 - y_grid_var_3
   - 204 p_up_1_3 <= 0
 non_overlap_any_1_4: p_left_1_4 + p_right_1_4 + p_down_1_4 + p_up_1_4
   >= 1
 non_overlap_left_1_4: w_var_1 + x_grid_var_1 - x_grid_var_4
   + 204 p_left_1_4 <= 204
 non_overlap_left_rev_1_4: - w_var_1 - x_grid_var_1 + x_grid_var_4
   - 204 p_left_1_4 <= 0
 non_overlap_right_1_4: w_var_4 - x_grid_var_1 + x_grid_var_4
   + 204 p_right_1_4 <= 204
 non_overlap_right_rev_1_4: - w_var_4 + x_grid_var_1 - x_grid_var_4
   - 204 p_right_1_4 <= 0
 non_overlap_down_1_4: h_var_1 + y_grid_var_1 - y_grid_var_4
   + 204 p_down_1_4 <= 204
 non_overlap_down_rev_1_4: - h_var_1 - y_grid_var_1 + y_grid_var_4
   - 204 p_down_1_4 <= 0
 non_overlap_up_1_4: h_var_4 - y_grid_var_1 + y_grid_var_4 + 204 p_up_1_4
   <= 204
 non_overlap_up_rev_1_4: - h_var_4 + y_grid_var_1 - y_grid_var_4
   - 204 p_up_1_4 <= 0
 non_overlap_any_1_5: p_left_1_5 + p_right_1_5 + p_down_1_5 + p_up_1_5
   >= 1
 non_overlap_left_1_5: w_var_1 + x_grid_var_1 - x_grid_var_5
   + 204 p_left_1_5 <= 204
 non_overlap_left_rev_1_5: - w_var_1 - x_grid_var_1 + x_grid_var_5
   - 204 p_left_1_5 <= 0
 non_overlap_right_1_5: w_var_5 - x_grid_var_1 + x_grid_var_5
   + 204 p_right_1_5 <= 204
 non_overlap_right_rev_1_5: - w_var_5 + x_grid_var_1 - x_grid_var_5
   - 204 p_right_1_5 <= 0
 non_overlap_down_1_5: h_var_1 + y_grid_var_1 - y_grid_var_5
   + 204 p_down_1_5 <= 204
 non_overlap_down_rev_1_5: - h_var_1 - y_grid_var_1 + y_grid_var_5
   - 204 p_down_1_5 <= 0
 non_overlap_up_1_5: h_var_5 - y_grid_var_1 + y_grid_var_5 + 204 p_up_1_5
   <= 204
 non_overlap_up_rev_1_5: - h_var_5 + y_grid_var_1 - y_grid_var_5
   - 204 p_up_1_5 <= 0
 non_overlap_any_1_6: p_left_1_6 + p_right_1_6 + p_down_1_6 + p_up_1_6
   >= 1
 non_overlap_left_1_6: w_var_1 + x_grid_var_1 - x_grid_var_6
   + 204 p_left_1_6 <= 204
 non_overlap_left_rev_1_6: - w_var_1 - x_grid_var_1 + x_grid_var_6
   - 204 p_left_1_6 <= 0
 non_overlap_right_1_6: w_var_6 - x_grid_var_1 + x_grid_var_6
   + 204 p_right_1_6 <= 204
 non_overlap_right_rev_1_6: - w_var_6 + x_grid_var_1 - x_grid_var_6
   - 204 p_right_1_6 <= 0
 non_overlap_down_1_6: h_var_1 + y_grid_var_1 - y_grid_var_6
   + 204 p_down_1_6 <= 204
 non_overlap_down_rev_1_6: - h_var_1 - y_grid_var_1 + y_grid_var_6
   - 204 p_down_1_6 <= 0
 non_overlap_up_1_6: h_var_6 - y_grid_var_1 + y_grid_var_6 + 204 p_up_1_6
   <= 204
 non_overlap_up_rev_1_6: - h_var_6 + y_grid_var_1 - y_grid_var_6
   - 204 p_up_1_6 <= 0
 non_overlap_any_1_7: p_left_1_7 + p_right_1_7 + p_down_1_7 + p_up_1_7
   >= 1
 non_overlap_left_1_7: w_var_1 + x_grid_var_1 - x_grid_var_7
   + 204 p_left_1_7 <= 204
 non_overlap_left_rev_1_7: - w_var_1 - x_grid_var_1 + x_grid_var_7
   - 204 p_left_1_7 <= 0
 non_overlap_right_1_7: w_var_7 - x_grid_var_1 + x_grid_var_7
   + 204 p_right_1_7 <= 204
 non_overlap_right_rev_1_7: - w_var_7 + x_grid_var_1 - x_grid_var_7
   - 204 p_right_1_7 <= 0
 non_overlap_down_1_7: h_var_1 + y_grid_var_1 - y_grid_var_7
   + 204 p_down_1_7 <= 204
 non_overlap_down_rev_1_7: - h_var_1 - y_grid_var_1 + y_grid_var_7
   - 204 p_down_1_7 <= 0
 non_overlap_up_1_7: h_var_7 - y_grid_var_1 + y_grid_var_7 + 204 p_up_1_7
   <= 204
 non_overlap_up_rev_1_7: - h_var_7 + y_grid_var_1 - y_grid_var_7
   - 204 p_up_1_7 <= 0
 non_overlap_any_2_3: p_left_2_3 + p_right_2_3 + p_down_2_3 + p_up_2_3
   >= 1
 non_overlap_left_2_3: w_var_2 + x_grid_var_2 - x_grid_var_3
   + 204 p_left_2_3 <= 204
 non_overlap_left_rev_2_3: - w_var_2 - x_grid_var_2 + x_grid_var_3
   - 204 p_left_2_3 <= 0
 non_overlap_right_2_3: w_var_3 - x_grid_var_2 + x_grid_var_3
   + 204 p_right_2_3 <= 204
 non_overlap_right_rev_2_3: - w_var_3 + x_grid_var_2 - x_grid_var_3
   - 204 p_right_2_3 <= 0
 non_overlap_down_2_3: h_var_2 + y_grid_var_2 - y_grid_var_3
   + 204 p_down_2_3 <= 204
 non_overlap_down_rev_2_3: - h_var_2 - y_grid_var_2 + y_grid_var_3
   - 204 p_down_2_3 <= 0
 non_overlap_up_2_3: h_var_3 - y_grid_var_2 + y_grid_var_3 + 204 p_up_2_3
   <= 204
 non_overlap_up_rev_2_3: - h_var_3 + y_grid_var_2 - y_grid_var_3
   - 204 p_up_2_3 <= 0
 non_overlap_any_2_4: p_left_2_4 + p_right_2_4 + p_down_2_4 + p_up_2_4
   >= 1
 non_overlap_left_2_4: w_var_2 + x_grid_var_2 - x_grid_var_4
   + 204 p_left_2_4 <= 204
 non_overlap_left_rev_2_4: - w_var_2 - x_grid_var_2 + x_grid_var_4
   - 204 p_left_2_4 <= 0
 non_overlap_right_2_4: w_var_4 - x_grid_var_2 + x_grid_var_4
   + 204 p_right_2_4 <= 204
 non_overlap_right_rev_2_4: - w_var_4 + x_grid_var_2 - x_grid_var_4
   - 204 p_right_2_4 <= 0
 non_overlap_down_2_4: h_var_2 + y_grid_var_2 - y_grid_var_4
   + 204 p_down_2_4 <= 204
 non_overlap_down_rev_2_4: - h_var_2 - y_grid_var_2 + y_grid_var_4
   - 204 p_down_2_4 <= 0
 non_overlap_up_2_4: h_var_4 - y_grid_var_2 + y_grid_var_4 + 204 p_up_2_4
   <= 204
 non_overlap_up_rev_2_4: - h_var_4 + y_grid_var_2 - y_grid_var_4
   - 204 p_up_2_4 <= 0
 non_overlap_any_2_5: p_left_2_5 + p_right_2_5 + p_down_2_5 + p_up_2_5
   >= 1
 non_overlap_left_2_5: w_var_2 + x_grid_var_2 - x_grid_var_5
   + 204 p_left_2_5 <= 204
 non_overlap_left_rev_2_5: - w_var_2 - x_grid_var_2 + x_grid_var_5
   - 204 p_left_2_5 <= 0
 non_overlap_right_2_5: w_var_5 - x_grid_var_2 + x_grid_var_5
   + 204 p_right_2_5 <= 204
 non_overlap_right_rev_2_5: - w_var_5 + x_grid_var_2 - x_grid_var_5
   - 204 p_right_2_5 <= 0
 non_overlap_down_2_5: h_var_2 + y_grid_var_2 - y_grid_var_5
   + 204 p_down_2_5 <= 204
 non_overlap_down_rev_2_5: - h_var_2 - y_grid_var_2 + y_grid_var_5
   - 204 p_down_2_5 <= 0
 non_overlap_up_2_5: h_var_5 - y_grid_var_2 + y_grid_var_5 + 204 p_up_2_5
   <= 204
 non_overlap_up_rev_2_5: - h_var_5 + y_grid_var_2 - y_grid_var_5
   - 204 p_up_2_5 <= 0
 non_overlap_any_2_6: p_left_2_6 + p_right_2_6 + p_down_2_6 + p_up_2_6
   >= 1
 non_overlap_left_2_6: w_var_2 + x_grid_var_2 - x_grid_var_6
   + 204 p_left_2_6 <= 204
 non_overlap_left_rev_2_6: - w_var_2 - x_grid_var_2 + x_grid_var_6
   - 204 p_left_2_6 <= 0
 non_overlap_right_2_6: w_var_6 - x_grid_var_2 + x_grid_var_6
   + 204 p_right_2_6 <= 204
 non_overlap_right_rev_2_6: - w_var_6 + x_grid_var_2 - x_grid_var_6
   - 204 p_right_2_6 <= 0
 non_overlap_down_2_6: h_var_2 + y_grid_var_2 - y_grid_var_6
   + 204 p_down_2_6 <= 204
 non_overlap_down_rev_2_6: - h_var_2 - y_grid_var_2 + y_grid_var_6
   - 204 p_down_2_6 <= 0
 non_overlap_up_2_6: h_var_6 - y_grid_var_2 + y_grid_var_6 + 204 p_up_2_6
   <= 204
 non_overlap_up_rev_2_6: - h_var_6 + y_grid_var_2 - y_grid_var_6
   - 204 p_up_2_6 <= 0
 non_overlap_any_2_7: p_left_2_7 + p_right_2_7 + p_down_2_7 + p_up_2_7
   >= 1
 non_overlap_left_2_7: w_var_2 + x_grid_var_2 - x_grid_var_7
   + 204 p_left_2_7 <= 204
 non_overlap_left_rev_2_7: - w_var_2 - x_grid_var_2 + x_grid_var_7
   - 204 p_left_2_7 <= 0
 non_overlap_right_2_7: w_var_7 - x_grid_var_2 + x_grid_var_7
   + 204 p_right_2_7 <= 204
 non_overlap_right_rev_2_7: - w_var_7 + x_grid_var_2 - x_grid_var_7
   - 204 p_right_2_7 <= 0
 non_overlap_down_2_7: h_var_2 + y_grid_var_2 - y_grid_var_7
   + 204 p_down_2_7 <= 204
 non_overlap_down_rev_2_7: - h_var_2 - y_grid_var_2 + y_grid_var_7
   - 204 p_down_2_7 <= 0
 non_overlap_up_2_7: h_var_7 - y_grid_var_2 + y_grid_var_7 + 204 p_up_2_7
   <= 204
 non_overlap_up_rev_2_7: - h_var_7 + y_grid_var_2 - y_grid_var_7
   - 204 p_up_2_7 <= 0
 non_overlap_any_3_4: p_left_3_4 + p_right_3_4 + p_down_3_4 + p_up_3_4
   >= 1
 non_overlap_left_3_4: w_var_3 + x_grid_var_3 - x_grid_var_4
   + 204 p_left_3_4 <= 204
 non_overlap_left_rev_3_4: - w_var_3 - x_grid_var_3 + x_grid_var_4
   - 204 p_left_3_4 <= 0
 non_overlap_right_3_4: w_var_4 - x_grid_var_3 + x_grid_var_4
   + 204 p_right_3_4 <= 204
 non_overlap_right_rev_3_4: - w_var_4 + x_grid_var_3 - x_grid_var_4
   - 204 p_right_3_4 <= 0
 non_overlap_down_3_4: h_var_3 + y_grid_var_3 - y_grid_var_4
   + 204 p_down_3_4 <= 204
 non_overlap_down_rev_3_4: - h_var_3 - y_grid_var_3 + y_grid_var_4
   - 204 p_down_3_4 <= 0
 non_overlap_up_3_4: h_var_4 - y_grid_var_3 + y_grid_var_4 + 204 p_up_3_4
   <= 204
 non_overlap_up_rev_3_4: - h_var_4 + y_grid_var_3 - y_grid_var_4
   - 204 p_up_3_4 <= 0
 non_overlap_any_3_5: p_left_3_5 + p_right_3_5 + p_down_3_5 + p_up_3_5
   >= 1
 non_overlap_left_3_5: w_var_3 + x_grid_var_3 - x_grid_var_5
   + 204 p_left_3_5 <= 204
 non_overlap_left_rev_3_5: - w_var_3 - x_grid_var_3 + x_grid_var_5
   - 204 p_left_3_5 <= 0
 non_overlap_right_3_5: w_var_5 - x_grid_var_3 + x_grid_var_5
   + 204 p_right_3_5 <= 204
 non_overlap_right_rev_3_5: - w_var_5 + x_grid_var_3 - x_grid_var_5
   - 204 p_right_3_5 <= 0
 non_overlap_down_3_5: h_var_3 + y_grid_var_3 - y_grid_var_5
   + 204 p_down_3_5 <= 204
 non_overlap_down_rev_3_5: - h_var_3 - y_grid_var_3 + y_grid_var_5
   - 204 p_down_3_5 <= 0
 non_overlap_up_3_5: h_var_5 - y_grid_var_3 + y_grid_var_5 + 204 p_up_3_5
   <= 204
 non_overlap_up_rev_3_5: - h_var_5 + y_grid_var_3 - y_grid_var_5
   - 204 p_up_3_5 <= 0
 non_overlap_any_3_6: p_left_3_6 + p_right_3_6 + p_down_3_6 + p_up_3_6
   >= 1
 non_overlap_left_3_6: w_var_3 + x_grid_var_3 - x_grid_var_6
   + 204 p_left_3_6 <= 204
 non_overlap_left_rev_3_6: - w_var_3 - x_grid_var_3 + x_grid_var_6
   - 204 p_left_3_6 <= 0
 non_overlap_right_3_6: w_var_6 - x_grid_var_3 + x_grid_var_6
   + 204 p_right_3_6 <= 204
 non_overlap_right_rev_3_6: - w_var_6 + x_grid_var_3 - x_grid_var_6
   - 204 p_right_3_6 <= 0
 non_overlap_down_3_6: h_var_3 + y_grid_var_3 - y_grid_var_6
   + 204 p_down_3_6 <= 204
 non_overlap_down_rev_3_6: - h_var_3 - y_grid_var_3 + y_grid_var_6
   - 204 p_down_3_6 <= 0
 non_overlap_up_3_6: h_var_6 - y_grid_var_3 + y_grid_var_6 + 204 p_up_3_6
   <= 204
 non_overlap_up_rev_3_6: - h_var_6 + y_grid_var_3 - y_grid_var_6
   - 204 p_up_3_6 <= 0
 non_overlap_any_3_7: p_left_3_7 + p_right_3_7 + p_down_3_7 + p_up_3_7
   >= 1
 non_overlap_left_3_7: w_var_3 + x_grid_var_3 - x_grid_var_7
   + 204 p_left_3_7 <= 204
 non_overlap_left_rev_3_7: - w_var_3 - x_grid_var_3 + x_grid_var_7
   - 204 p_left_3_7 <= 0
 non_overlap_right_3_7: w_var_7 - x_grid_var_3 + x_grid_var_7
   + 204 p_right_3_7 <= 204
 non_overlap_right_rev_3_7: - w_var_7 + x_grid_var_3 - x_grid_var_7
   - 204 p_right_3_7 <= 0
 non_overlap_down_3_7: h_var_3 + y_grid_var_3 - y_grid_var_7
   + 204 p_down_3_7 <= 204
 non_overlap_down_rev_3_7: - h_var_3 - y_grid_var_3 + y_grid_var_7
   - 204 p_down_3_7 <= 0
 non_overlap_up_3_7: h_var_7 - y_grid_var_3 + y_grid_var_7 + 204 p_up_3_7
   <= 204
 non_overlap_up_rev_3_7: - h_var_7 + y_grid_var_3 - y_grid_var_7
   - 204 p_up_3_7 <= 0
 non_overlap_any_4_5: p_left_4_5 + p_right_4_5 + p_down_4_5 + p_up_4_5
   >= 1
 non_overlap_left_4_5: w_var_4 + x_grid_var_4 - x_grid_var_5
   + 204 p_left_4_5 <= 204
 non_overlap_left_rev_4_5: - w_var_4 - x_grid_var_4 + x_grid_var_5
   - 204 p_left_4_5 <= 0
 non_overlap_right_4_5: w_var_5 - x_grid_var_4 + x_grid_var_5
   + 204 p_right_4_5 <= 204
 non_overlap_right_rev_4_5: - w_var_5 + x_grid_var_4 - x_grid_var_5
   - 204 p_right_4_5 <= 0
 non_overlap_down_4_5: h_var_4 + y_grid_var_4 - y_grid_var_5
   + 204 p_down_4_5 <= 204
 non_overlap_down_rev_4_5: - h_var_4 - y_grid_var_4 + y_grid_var_5
   - 204 p_down_4_5 <= 0
 non_overlap_up_4_5: h_var_5 - y_grid_var_4 + y_grid_var_5 + 204 p_up_4_5
   <= 204
 non_overlap_up_rev_4_5: - h_var_5 + y_grid_var_4 - y_grid_var_5
   - 204 p_up_4_5 <= 0
 non_overlap_any_4_6: p_left_4_6 + p_right_4_6 + p_down_4_6 + p_up_4_6
   >= 1
 non_overlap_left_4_6: w_var_4 + x_grid_var_4 - x_grid_var_6
   + 204 p_left_4_6 <= 204
 non_overlap_left_rev_4_6: - w_var_4 - x_grid_var_4 + x_grid_var_6
   - 204 p_left_4_6 <= 0
 non_overlap_right_4_6: w_var_6 - x_grid_var_4 + x_grid_var_6
   + 204 p_right_4_6 <= 204
 non_overlap_right_rev_4_6: - w_var_6 + x_grid_var_4 - x_grid_var_6
   - 204 p_right_4_6 <= 0
 non_overlap_down_4_6: h_var_4 + y_grid_var_4 - y_grid_var_6
   + 204 p_down_4_6 <= 204
 non_overlap_down_rev_4_6: - h_var_4 - y_grid_var_4 + y_grid_var_6
   - 204 p_down_4_6 <= 0
 non_overlap_up_4_6: h_var_6 - y_grid_var_4 + y_grid_var_6 + 204 p_up_4_6
   <= 204
 non_overlap_up_rev_4_6: - h_var_6 + y_grid_var_4 - y_grid_var_6
   - 204 p_up_4_6 <= 0
 non_overlap_any_4_7: p_left_4_7 + p_right_4_7 + p_down_4_7 + p_up_4_7
   >= 1
 non_overlap_left_4_7: w_var_4 + x_grid_var_4 - x_grid_var_7
   + 204 p_left_4_7 <= 204
 non_overlap_left_rev_4_7: - w_var_4 - x_grid_var_4 + x_grid_var_7
   - 204 p_left_4_7 <= 0
 non_overlap_right_4_7: w_var_7 - x_grid_var_4 + x_grid_var_7
   + 204 p_right_4_7 <= 204
 non_overlap_right_rev_4_7: - w_var_7 + x_grid_var_4 - x_grid_var_7
   - 204 p_right_4_7 <= 0
 non_overlap_down_4_7: h_var_4 + y_grid_var_4 - y_grid_var_7
   + 204 p_down_4_7 <= 204
 non_overlap_down_rev_4_7: - h_var_4 - y_grid_var_4 + y_grid_var_7
   - 204 p_down_4_7 <= 0
 non_overlap_up_4_7: h_var_7 - y_grid_var_4 + y_grid_var_7 + 204 p_up_4_7
   <= 204
 non_overlap_up_rev_4_7: - h_var_7 + y_grid_var_4 - y_grid_var_7
   - 204 p_up_4_7 <= 0
 non_overlap_any_5_6: p_left_5_6 + p_right_5_6 + p_down_5_6 + p_up_5_6
   >= 1
 non_overlap_left_5_6: w_var_5 + x_grid_var_5 - x_grid_var_6
   + 204 p_left_5_6 <= 204
 non_overlap_left_rev_5_6: - w_var_5 - x_grid_var_5 + x_grid_var_6
   - 204 p_left_5_6 <= 0
 non_overlap_right_5_6: w_var_6 - x_grid_var_5 + x_grid_var_6
   + 204 p_right_5_6 <= 204
 non_overlap_right_rev_5_6: - w_var_6 + x_grid_var_5 - x_grid_var_6
   - 204 p_right_5_6 <= 0
 non_overlap_down_5_6: h_var_5 + y_grid_var_5 - y_grid_var_6
   + 204 p_down_5_6 <= 204
 non_overlap_down_rev_5_6: - h_var_5 - y_grid_var_5 + y_grid_var_6
   - 204 p_down_5_6 <= 0
 non_overlap_up_5_6: h_var_6 - y_grid_var_5 + y_grid_var_6 + 204 p_up_5_6
   <= 204
 non_overlap_up_rev_5_6: - h_var_6 + y_grid_var_5 - y_grid_var_6
   - 204 p_up_5_6 <= 0
 non_overlap_any_5_7: p_left_5_7 + p_right_5_7 + p_down_5_7 + p_up_5_7
   >= 1
 non_overlap_left_5_7: w_var_5 + x_grid_var_5 - x_grid_var_7
   + 204 p_left_5_7 <= 204
 non_overlap_left_rev_5_7: - w_var_5 - x_grid_var_5 + x_grid_var_7
   - 204 p_left_5_7 <= 0
 non_overlap_right_5_7: w_var_7 - x_grid_var_5 + x_grid_var_7
   + 204 p_right_5_7 <= 204
 non_overlap_right_rev_5_7: - w_var_7 + x_grid_var_5 - x_grid_var_7
   - 204 p_right_5_7 <= 0
 non_overlap_down_5_7: h_var_5 + y_grid_var_5 - y_grid_var_7
   + 204 p_down_5_7 <= 204
 non_overlap_down_rev_5_7: - h_var_5 - y_grid_var_5 + y_grid_var_7
   - 204 p_down_5_7 <= 0
 non_overlap_up_5_7: h_var_7 - y_grid_var_5 + y_grid_var_7 + 204 p_up_5_7
   <= 204
 non_overlap_up_rev_5_7: - h_var_7 + y_grid_var_5 - y_grid_var_7
   - 204 p_up_5_7 <= 0
 non_overlap_any_6_7: p_left_6_7 + p_right_6_7 + p_down_6_7 + p_up_6_7
   >= 1
 non_overlap_left_6_7: w_var_6 + x_grid_var_6 - x_grid_var_7
   + 204 p_left_6_7 <= 204
 non_overlap_left_rev_6_7: - w_var_6 - x_grid_var_6 + x_grid_var_7
   - 204 p_left_6_7 <= 0
 non_overlap_right_6_7: w_var_7 - x_grid_var_6 + x_grid_var_7
   + 204 p_right_6_7 <= 204
 non_overlap_right_rev_6_7: - w_var_7 + x_grid_var_6 - x_grid_var_7
   - 204 p_right_6_7 <= 0
 non_overlap_down_6_7: h_var_6 + y_grid_var_6 - y_grid_var_7
   + 204 p_down_6_7 <= 204
 non_overlap_down_rev_6_7: - h_var_6 - y_grid_var_6 + y_grid_var_7
   - 204 p_down_6_7 <= 0
 non_overlap_up_6_7: h_var_7 - y_grid_var_6 + y_grid_var_7 + 204 p_up_6_7
   <= 204
 non_overlap_up_rev_6_7: - h_var_7 + y_grid_var_6 - y_grid_var_7
   - 204 p_up_6_7 <= 0
 EMIB_non_overlap_any_0_2_0_5: p_EMIB_left_0_2_0_5 + p_EMIB_right_0_2_0_5
   + p_EMIB_down_0_2_0_5 + p_EMIB_up_0_2_0_5 >= 1
 EMIB_non_overlap_left_0_2_0_5: EMIB_w_var_0_2 + EMIB_x_grid_var_0_2
   - EMIB_x_grid_var_0_5 + 204 p_EMIB_left_0_2_0_5 <= 204
 EMIB_non_overlap_left_rev_0_2_0_5: - EMIB_w_var_0_2 - EMIB_x_grid_var_0_2
   + EMIB_x_grid_var_0_5 - 204 p_EMIB_left_0_2_0_5 <= 0
 EMIB_non_overlap_right_0_2_0_5: EMIB_w_var_0_5 - EMIB_x_grid_var_0_2
   + EMIB_x_grid_var_0_5 + 204 p_EMIB_right_0_2_0_5 <= 204
 EMIB_non_overlap_right_rev_0_2_0_5: - EMIB_w_var_0_5 + EMIB_x_grid_var_0_2
   - EMIB_x_grid_var_0_5 - 204 p_EMIB_right_0_2_0_5 <= 0
 EMIB_non_overlap_down_0_2_0_5: EMIB_h_var_0_2 + EMIB_y_grid_var_0_2
   - EMIB_y_grid_var_0_5 + 204 p_EMIB_down_0_2_0_5 <= 204
 EMIB_non_overlap_down_rev_0_2_0_5: - EMIB_h_var_0_2 - EMIB_y_grid_var_0_2
   + EMIB_y_grid_var_0_5 - 204 p_EMIB_down_0_2_0_5 <= 0
 EMIB_non_overlap_up_0_2_0_5: EMIB_h_var_0_5 - EMIB_y_grid_var_0_2
   + EMIB_y_grid_var_0_5 + 204 p_EMIB_up_0_2_0_5 <= 204
 EMIB_non_overlap_up_rev_0_2_0_5: - EMIB_h_var_0_5 + EMIB_y_grid_var_0_2
   - EMIB_y_grid_var_0_5 - 204 p_EMIB_up_0_2_0_5 <= 0
 EMIB_non_overlap_any_0_2_0_7: p_EMIB_left_0_2_0_7 + p_EMIB_right_0_2_0_7
   + p_EMIB_down_0_2_0_7 + p_EMIB_up_0_2_0_7 >= 1
 EMIB_non_overlap_left_0_2_0_7: EMIB_w_var_0_2 + EMIB_x_grid_var_0_2
   - EMIB_x_grid_var_0_7 + 204 p_EMIB_left_0_2_0_7 <= 204
 EMIB_non_overlap_left_rev_0_2_0_7: - EMIB_w_var_0_2 - EMIB_x_grid_var_0_2
   + EMIB_x_grid_var_0_7 - 204 p_EMIB_left_0_2_0_7 <= 0
 EMIB_non_overlap_right_0_2_0_7: EMIB_w_var_0_7 - EMIB_x_grid_var_0_2
   + EMIB_x_grid_var_0_7 + 204 p_EMIB_right_0_2_0_7 <= 204
 EMIB_non_overlap_right_rev_0_2_0_7: - EMIB_w_var_0_7 + EMIB_x_grid_var_0_2
   - EMIB_x_grid_var_0_7 - 204 p_EMIB_right_0_2_0_7 <= 0
 EMIB_non_overlap_down_0_2_0_7: EMIB_h_var_0_2 + EMIB_y_grid_var_0_2
   - EMIB_y_grid_var_0_7 + 204 p_EMIB_down_0_2_0_7 <= 204
 EMIB_non_overlap_down_rev_0_2_0_7: - EMIB_h_var_0_2 - EMIB_y_grid_var_0_2
   + EMIB_y_grid_var_0_7 - 204 p_EMIB_down_0_2_0_7 <= 0
 EMIB_non_overlap_up_0_2_0_7: EMIB_h_var_0_7 - EMIB_y_grid_var_0_2
   + EMIB_y_grid_var_0_7 + 204 p_EMIB_up_0_2_0_7 <= 204
 EMIB_non_overlap_up_rev_0_2_0_7: - EMIB_h_var_0_7 + EMIB_y_grid_var_0_2
   - EMIB_y_grid_var_0_7 - 204 p_EMIB_up_0_2_0_7 <= 0
 EMIB_non_overlap_any_0_2_2_3: p_EMIB_left_0_2_2_3 + p_EMIB_right_0_2_2_3
   + p_EMIB_down_0_2_2_3 + p_EMIB_up_0_2_2_3 >= 1
 EMIB_non_overlap_left_0_2_2_3: EMIB_w_var_0_2 + EMIB_x_grid_var_0_2
   - EMIB_x_grid_var_2_3 + 204 p_EMIB_left_0_2_2_3 <= 204
 EMIB_non_overlap_left_rev_0_2_2_3: - EMIB_w_var_0_2 - EMIB_x_grid_var_0_2
   + EMIB_x_grid_var_2_3 - 204 p_EMIB_left_0_2_2_3 <= 0
 EMIB_non_overlap_right_0_2_2_3: EMIB_w_var_2_3 - EMIB_x_grid_var_0_2
   + EMIB_x_grid_var_2_3 + 204 p_EMIB_right_0_2_2_3 <= 204
 EMIB_non_overlap_right_rev_0_2_2_3: - EMIB_w_var_2_3 + EMIB_x_grid_var_0_2
   - EMIB_x_grid_var_2_3 - 204 p_EMIB_right_0_2_2_3 <= 0
 EMIB_non_overlap_down_0_2_2_3: EMIB_h_var_0_2 + EMIB_y_grid_var_0_2
   - EMIB_y_grid_var_2_3 + 204 p_EMIB_down_0_2_2_3 <= 204
 EMIB_non_overlap_down_rev_0_2_2_3: - EMIB_h_var_0_2 - EMIB_y_grid_var_0_2
   + EMIB_y_grid_var_2_3 - 204 p_EMIB_down_0_2_2_3 <= 0
 EMIB_non_overlap_up_0_2_2_3: EMIB_h_var_2_3 - EMIB_y_grid_var_0_2
   + EMIB_y_grid_var_2_3 + 204 p_EMIB_up_0_2_2_3 <= 204
 EMIB_non_overlap_up_rev_0_2_2_3: - EMIB_h_var_2_3 + EMIB_y_grid_var_0_2
   - EMIB_y_grid_var_2_3 - 204 p_EMIB_up_0_2_2_3 <= 0
 EMIB_non_overlap_any_0_5_0_7: p_EMIB_left_0_5_0_7 + p_EMIB_right_0_5_0_7
   + p_EMIB_down_0_5_0_7 + p_EMIB_up_0_5_0_7 >= 1
 EMIB_non_overlap_left_0_5_0_7: EMIB_w_var_0_5 + EMIB_x_grid_var_0_5
   - EMIB_x_grid_var_0_7 + 204 p_EMIB_left_0_5_0_7 <= 204
 EMIB_non_overlap_left_rev_0_5_0_7: - EMIB_w_var_0_5 - EMIB_x_grid_var_0_5
   + EMIB_x_grid_var_0_7 - 204 p_EMIB_left_0_5_0_7 <= 0
 EMIB_non_overlap_right_0_5_0_7: EMIB_w_var_0_7 - EMIB_x_grid_var_0_5
   + EMIB_x_grid_var_0_7 + 204 p_EMIB_right_0_5_0_7 <= 204
 EMIB_non_overlap_right_rev_0_5_0_7: - EMIB_w_var_0_7 + EMIB_x_grid_var_0_5
   - EMIB_x_grid_var_0_7 - 204 p_EMIB_right_0_5_0_7 <= 0
 EMIB_non_overlap_down_0_5_0_7: EMIB_h_var_0_5 + EMIB_y_grid_var_0_5
   - EMIB_y_grid_var_0_7 + 204 p_EMIB_down_0_5_0_7 <= 204
 EMIB_non_overlap_down_rev_0_5_0_7: - EMIB_h_var_0_5 - EMIB_y_grid_var_0_5
   + EMIB_y_grid_var_0_7 - 204 p_EMIB_down_0_5_0_7 <= 0
 EMIB_non_overlap_up_0_5_0_7: EMIB_h_var_0_7 - EMIB_y_grid_var_0_5
   + EMIB_y_grid_var_0_7 + 204 p_EMIB_up_0_5_0_7 <= 204
 EMIB_non_overlap_up_rev_0_5_0_7: - EMIB_h_var_0_7 + EMIB_y_grid_var_0_5
   - EMIB_y_grid_var_0_7 - 204 p_EMIB_up_0_5_0_7 <= 0
 EMIB_non_overlap_any_0_5_5_7: p_EMIB_left_0_5_5_7 + p_EMIB_right_0_5_5_7
   + p_EMIB_down_0_5_5_7 + p_EMIB_up_0_5_5_7 >= 1
 EMIB_non_overlap_left_0_5_5_7: EMIB_w_var_0_5 + EMIB_x_grid_var_0_5
   - EMIB_x_grid_var_5_7 + 204 p_EMIB_left_0_5_5_7 <= 204
 EMIB_non_overlap_left_rev_0_5_5_7: - EMIB_w_var_0_5 - EMIB_x_grid_var_0_5
   + EMIB_x_grid_var_5_7 - 204 p_EMIB_left_0_5_5_7 <= 0
 EMIB_non_overlap_right_0_5_5_7: EMIB_w_var_5_7 - EMIB_x_grid_var_0_5
   + EMIB_x_grid_var_5_7 + 204 p_EMIB_right_0_5_5_7 <= 204
 EMIB_non_overlap_right_rev_0_5_5_7: - EMIB_w_var_5_7 + EMIB_x_grid_var_0_5
   - EMIB_x_grid_var_5_7 - 204 p_EMIB_right_0_5_5_7 <= 0
 EMIB_non_overlap_down_0_5_5_7: EMIB_h_var_0_5 + EMIB_y_grid_var_0_5
   - EMIB_y_grid_var_5_7 + 204 p_EMIB_down_0_5_5_7 <= 204
 EMIB_non_overlap_down_rev_0_5_5_7: - EMIB_h_var_0_5 - EMIB_y_grid_var_0_5
   + EMIB_y_grid_var_5_7 - 204 p_EMIB_down_0_5_5_7 <= 0
 EMIB_non_overlap_up_0_5_5_7: EMIB_h_var_5_7 - EMIB_y_grid_var_0_5
   + EMIB_y_grid_var_5_7 + 204 p_EMIB_up_0_5_5_7 <= 204
 EMIB_non_overlap_up_rev_0_5_5_7: - EMIB_h_var_5_7 + EMIB_y_grid_var_0_5
   - EMIB_y_grid_var_5_7 - 204 p_EMIB_up_0_5_5_7 <= 0
 EMIB_non_overlap_any_0_7_5_7: p_EMIB_left_0_7_5_7 + p_EMIB_right_0_7_5_7
   + p_EMIB_down_0_7_5_7 + p_EMIB_up_0_7_5_7 >= 1
 EMIB_non_overlap_left_0_7_5_7: EMIB_w_var_0_7 + EMIB_x_grid_var_0_7
   - EMIB_x_grid_var_5_7 + 204 p_EMIB_left_0_7_5_7 <= 204
 EMIB_non_overlap_left_rev_0_7_5_7: - EMIB_w_var_0_7 - EMIB_x_grid_var_0_7
   + EMIB_x_grid_var_5_7 - 204 p_EMIB_left_0_7_5_7 <= 0
 EMIB_non_overlap_right_0_7_5_7: EMIB_w_var_5_7 - EMIB_x_grid_var_0_7
   + EMIB_x_grid_var_5_7 + 204 p_EMIB_right_0_7_5_7 <= 204
 EMIB_non_overlap_right_rev_0_7_5_7: - EMIB_w_var_5_7 + EMIB_x_grid_var_0_7
   - EMIB_x_grid_var_5_7 - 204 p_EMIB_right_0_7_5_7 <= 0
 EMIB_non_overlap_down_0_7_5_7: EMIB_h_var_0_7 + EMIB_y_grid_var_0_7
   - EMIB_y_grid_var_5_7 + 204 p_EMIB_down_0_7_5_7 <= 204
 EMIB_non_overlap_down_rev_0_7_5_7: - EMIB_h_var_0_7 - EMIB_y_grid_var_0_7
   + EMIB_y_grid_var_5_7 - 204 p_EMIB_down_0_7_5_7 <= 0
 EMIB_non_overlap_up_0_7_5_7: EMIB_h_var_5_7 - EMIB_y_grid_var_0_7
   + EMIB_y_grid_var_5_7 + 204 p_EMIB_up_0_7_5_7 <= 204
 EMIB_non_overlap_up_rev_0_7_5_7: - EMIB_h_var_5_7 + EMIB_y_grid_var_0_7
   - EMIB_y_grid_var_5_7 - 204 p_EMIB_up_0_7_5_7 <= 0
 EMIB_non_overlap_any_0_7_6_7: p_EMIB_left_0_7_6_7 + p_EMIB_right_0_7_6_7
   + p_EMIB_down_0_7_6_7 + p_EMIB_up_0_7_6_7 >= 1
 EMIB_non_overlap_left_0_7_6_7: EMIB_w_var_0_7 + EMIB_x_grid_var_0_7
   - EMIB_x_grid_var_6_7 + 204 p_EMIB_left_0_7_6_7 <= 204
 EMIB_non_overlap_left_rev_0_7_6_7: - EMIB_w_var_0_7 - EMIB_x_grid_var_0_7
   + EMIB_x_grid_var_6_7 - 204 p_EMIB_left_0_7_6_7 <= 0
 EMIB_non_overlap_right_0_7_6_7: EMIB_w_var_6_7 - EMIB_x_grid_var_0_7
   + EMIB_x_grid_var_6_7 + 204 p_EMIB_right_0_7_6_7 <= 204
 EMIB_non_overlap_right_rev_0_7_6_7: - EMIB_w_var_6_7 + EMIB_x_grid_var_0_7
   - EMIB_x_grid_var_6_7 - 204 p_EMIB_right_0_7_6_7 <= 0
 EMIB_non_overlap_down_0_7_6_7: EMIB_h_var_0_7 + EMIB_y_grid_var_0_7
   - EMIB_y_grid_var_6_7 + 204 p_EMIB_down_0_7_6_7 <= 204
 EMIB_non_overlap_down_rev_0_7_6_7: - EMIB_h_var_0_7 - EMIB_y_grid_var_0_7
   + EMIB_y_grid_var_6_7 - 204 p_EMIB_down_0_7_6_7 <= 0
 EMIB_non_overlap_up_0_7_6_7: EMIB_h_var_6_7 - EMIB_y_grid_var_0_7
   + EMIB_y_grid_var_6_7 + 204 p_EMIB_up_0_7_6_7 <= 204
 EMIB_non_overlap_up_rev_0_7_6_7: - EMIB_h_var_6_7 + EMIB_y_grid_var_0_7
   - EMIB_y_grid_var_6_7 - 204 p_EMIB_up_0_7_6_7 <= 0
 EMIB_non_overlap_any_4_6_6_7: p_EMIB_left_4_6_6_7 + p_EMIB_right_4_6_6_7
   + p_EMIB_down_4_6_6_7 + p_EMIB_up_4_6_6_7 >= 1
 EMIB_non_overlap_left_4_6_6_7: EMIB_w_var_4_6 + EMIB_x_grid_var_4_6
   - EMIB_x_grid_var_6_7 + 204 p_EMIB_left_4_6_6_7 <= 204
 EMIB_non_overlap_left_rev_4_6_6_7: - EMIB_w_var_4_6 - EMIB_x_grid_var_4_6
   + EMIB_x_grid_var_6_7 - 204 p_EMIB_left_4_6_6_7 <= 0
 EMIB_non_overlap_right_4_6_6_7: EMIB_w_var_6_7 - EMIB_x_grid_var_4_6
   + EMIB_x_grid_var_6_7 + 204 p_EMIB_right_4_6_6_7 <= 204
 EMIB_non_overlap_right_rev_4_6_6_7: - EMIB_w_var_6_7 + EMIB_x_grid_var_4_6
   - EMIB_x_grid_var_6_7 - 204 p_EMIB_right_4_6_6_7 <= 0
 EMIB_non_overlap_down_4_6_6_7: EMIB_h_var_4_6 + EMIB_y_grid_var_4_6
   - EMIB_y_grid_var_6_7 + 204 p_EMIB_down_4_6_6_7 <= 204
 EMIB_non_overlap_down_rev_4_6_6_7: - EMIB_h_var_4_6 - EMIB_y_grid_var_4_6
   + EMIB_y_grid_var_6_7 - 204 p_EMIB_down_4_6_6_7 <= 0
 EMIB_non_overlap_up_4_6_6_7: EMIB_h_var_6_7 - EMIB_y_grid_var_4_6
   + EMIB_y_grid_var_6_7 + 204 p_EMIB_up_4_6_6_7 <= 204
 EMIB_non_overlap_up_rev_4_6_6_7: - EMIB_h_var_6_7 + EMIB_y_grid_var_4_6
   - EMIB_y_grid_var_6_7 - 204 p_EMIB_up_4_6_6_7 <= 0
 EMIB_non_overlap_any_5_7_6_7: p_EMIB_left_5_7_6_7 + p_EMIB_right_5_7_6_7
   + p_EMIB_down_5_7_6_7 + p_EMIB_up_5_7_6_7 >= 1
 EMIB_non_overlap_left_5_7_6_7: EMIB_w_var_5_7 + EMIB_x_grid_var_5_7
   - EMIB_x_grid_var_6_7 + 204 p_EMIB_left_5_7_6_7 <= 204
 EMIB_non_overlap_left_rev_5_7_6_7: - EMIB_w_var_5_7 - EMIB_x_grid_var_5_7
   + EMIB_x_grid_var_6_7 - 204 p_EMIB_left_5_7_6_7 <= 0
 EMIB_non_overlap_right_5_7_6_7: EMIB_w_var_6_7 - EMIB_x_grid_var_5_7
   + EMIB_x_grid_var_6_7 + 204 p_EMIB_right_5_7_6_7 <= 204
 EMIB_non_overlap_right_rev_5_7_6_7: - EMIB_w_var_6_7 + EMIB_x_grid_var_5_7
   - EMIB_x_grid_var_6_7 - 204 p_EMIB_right_5_7_6_7 <= 0
 EMIB_non_overlap_down_5_7_6_7: EMIB_h_var_5_7 + EMIB_y_grid_var_5_7
   - EMIB_y_grid_var_6_7 + 204 p_EMIB_down_5_7_6_7 <= 204
 EMIB_non_overlap_down_rev_5_7_6_7: - EMIB_h_var_5_7 - EMIB_y_grid_var_5_7
   + EMIB_y_grid_var_6_7 - 204 p_EMIB_down_5_7_6_7 <= 0
 EMIB_non_overlap_up_5_7_6_7: EMIB_h_var_6_7 - EMIB_y_grid_var_5_7
   + EMIB_y_grid_var_6_7 + 204 p_EMIB_up_5_7_6_7 <= 204
 EMIB_non_overlap_up_rev_5_7_6_7: - EMIB_h_var_6_7 + EMIB_y_grid_var_5_7
   - EMIB_y_grid_var_6_7 - 204 p_EMIB_up_5_7_6_7 <= 0
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
 bbox_min_x_7: - x_grid_var_7 + bbox_min_x <= 0
 bbox_max_x_7: - w_var_7 - x_grid_var_7 + bbox_max_x >= 0
 bbox_min_y_7: - y_grid_var_7 + bbox_min_y <= 0
 bbox_max_y_7: - h_var_7 - y_grid_var_7 + bbox_max_y >= 0
 bbox_w_def: bbox_min_x - bbox_max_x + bbox_w = 0
 bbox_h_def: bbox_min_y - bbox_max_y + bbox_h = 0
 cx_center_def: cx_center - 0.5 bbox_min_x - 0.5 bbox_max_x = 0
 cy_center_def: cy_center - 0.5 bbox_min_y - 0.5 bbox_max_y = 0
 aspect_ratio_diff_ge_w_minus_h: - bbox_w + bbox_h + aspect_ratio_penalty
   >= 0
 aspect_ratio_diff_ge_h_minus_w: bbox_w - bbox_h + aspect_ratio_penalty
   >= 0
 dx_diff_def_1_4: - cx_grid_var_1 + cx_grid_var_4 + dx_diff_1_4 = 0
 dy_diff_def_1_4: - cy_grid_var_1 + cy_grid_var_4 + dy_diff_1_4 = 0
 dx_abs_1_4_abs_ge_orig: dx_abs_1_4 - dx_diff_1_4
   - 204 dx_abs_1_4_is_positive >= -204
 dx_abs_1_4_abs_le_orig: dx_abs_1_4 - dx_diff_1_4
   + 204 dx_abs_1_4_is_positive <= 204
 dx_abs_1_4_abs_ge_neg_orig: dx_abs_1_4 + dx_diff_1_4
   + 204 dx_abs_1_4_is_positive >= 0
 dx_abs_1_4_abs_le_neg_orig: dx_abs_1_4 + dx_diff_1_4
   - 204 dx_abs_1_4_is_positive <= 0
 dx_abs_1_4_force_positive: dx_diff_1_4 - 204 dx_abs_1_4_is_positive
   >= -204
 dx_abs_1_4_force_negative: dx_diff_1_4 - 204 dx_abs_1_4_is_positive <= 0
 dy_abs_1_4_abs_ge_orig: dy_abs_1_4 - dy_diff_1_4
   - 204 dy_abs_1_4_is_positive >= -204
 dy_abs_1_4_abs_le_orig: dy_abs_1_4 - dy_diff_1_4
   + 204 dy_abs_1_4_is_positive <= 204
 dy_abs_1_4_abs_ge_neg_orig: dy_abs_1_4 + dy_diff_1_4
   + 204 dy_abs_1_4_is_positive >= 0
 dy_abs_1_4_abs_le_neg_orig: dy_abs_1_4 + dy_diff_1_4
   - 204 dy_abs_1_4_is_positive <= 0
 dy_abs_1_4_force_positive: dy_diff_1_4 - 204 dy_abs_1_4_is_positive
   >= -204
 dy_abs_1_4_force_negative: dy_diff_1_4 - 204 dy_abs_1_4_is_positive <= 0
 dx_diff_def_1_5: - cx_grid_var_1 + cx_grid_var_5 + dx_diff_1_5 = 0
 dy_diff_def_1_5: - cy_grid_var_1 + cy_grid_var_5 + dy_diff_1_5 = 0
 dx_abs_1_5_abs_ge_orig: dx_abs_1_5 - dx_diff_1_5
   - 204 dx_abs_1_5_is_positive >= -204
 dx_abs_1_5_abs_le_orig: dx_abs_1_5 - dx_diff_1_5
   + 204 dx_abs_1_5_is_positive <= 204
 dx_abs_1_5_abs_ge_neg_orig: dx_abs_1_5 + dx_diff_1_5
   + 204 dx_abs_1_5_is_positive >= 0
 dx_abs_1_5_abs_le_neg_orig: dx_abs_1_5 + dx_diff_1_5
   - 204 dx_abs_1_5_is_positive <= 0
 dx_abs_1_5_force_positive: dx_diff_1_5 - 204 dx_abs_1_5_is_positive
   >= -204
 dx_abs_1_5_force_negative: dx_diff_1_5 - 204 dx_abs_1_5_is_positive <= 0
 dy_abs_1_5_abs_ge_orig: dy_abs_1_5 - dy_diff_1_5
   - 204 dy_abs_1_5_is_positive >= -204
 dy_abs_1_5_abs_le_orig: dy_abs_1_5 - dy_diff_1_5
   + 204 dy_abs_1_5_is_positive <= 204
 dy_abs_1_5_abs_ge_neg_orig: dy_abs_1_5 + dy_diff_1_5
   + 204 dy_abs_1_5_is_positive >= 0
 dy_abs_1_5_abs_le_neg_orig: dy_abs_1_5 + dy_diff_1_5
   - 204 dy_abs_1_5_is_positive <= 0
 dy_abs_1_5_force_positive: dy_diff_1_5 - 204 dy_abs_1_5_is_positive
   >= -204
 dy_abs_1_5_force_negative: dy_diff_1_5 - 204 dy_abs_1_5_is_positive <= 0
 dx_diff_def_2_6: - cx_grid_var_2 + cx_grid_var_6 + dx_diff_2_6 = 0
 dy_diff_def_2_6: - cy_grid_var_2 + cy_grid_var_6 + dy_diff_2_6 = 0
 dx_abs_2_6_abs_ge_orig: dx_abs_2_6 - dx_diff_2_6
   - 204 dx_abs_2_6_is_positive >= -204
 dx_abs_2_6_abs_le_orig: dx_abs_2_6 - dx_diff_2_6
   + 204 dx_abs_2_6_is_positive <= 204
 dx_abs_2_6_abs_ge_neg_orig: dx_abs_2_6 + dx_diff_2_6
   + 204 dx_abs_2_6_is_positive >= 0
 dx_abs_2_6_abs_le_neg_orig: dx_abs_2_6 + dx_diff_2_6
   - 204 dx_abs_2_6_is_positive <= 0
 dx_abs_2_6_force_positive: dx_diff_2_6 - 204 dx_abs_2_6_is_positive
   >= -204
 dx_abs_2_6_force_negative: dx_diff_2_6 - 204 dx_abs_2_6_is_positive <= 0
 dy_abs_2_6_abs_ge_orig: dy_abs_2_6 - dy_diff_2_6
   - 204 dy_abs_2_6_is_positive >= -204
 dy_abs_2_6_abs_le_orig: dy_abs_2_6 - dy_diff_2_6
   + 204 dy_abs_2_6_is_positive <= 204
 dy_abs_2_6_abs_ge_neg_orig: dy_abs_2_6 + dy_diff_2_6
   + 204 dy_abs_2_6_is_positive >= 0
 dy_abs_2_6_abs_le_neg_orig: dy_abs_2_6 + dy_diff_2_6
   - 204 dy_abs_2_6_is_positive <= 0
 dy_abs_2_6_force_positive: dy_diff_2_6 - 204 dy_abs_2_6_is_positive
   >= -204
 dy_abs_2_6_force_negative: dy_diff_2_6 - 204 dy_abs_2_6_is_positive <= 0
 dx_diff_def_2_7: - cx_grid_var_2 + cx_grid_var_7 + dx_diff_2_7 = 0
 dy_diff_def_2_7: - cy_grid_var_2 + cy_grid_var_7 + dy_diff_2_7 = 0
 dx_abs_2_7_abs_ge_orig: dx_abs_2_7 - dx_diff_2_7
   - 204 dx_abs_2_7_is_positive >= -204
 dx_abs_2_7_abs_le_orig: dx_abs_2_7 - dx_diff_2_7
   + 204 dx_abs_2_7_is_positive <= 204
 dx_abs_2_7_abs_ge_neg_orig: dx_abs_2_7 + dx_diff_2_7
   + 204 dx_abs_2_7_is_positive >= 0
 dx_abs_2_7_abs_le_neg_orig: dx_abs_2_7 + dx_diff_2_7
   - 204 dx_abs_2_7_is_positive <= 0
 dx_abs_2_7_force_positive: dx_diff_2_7 - 204 dx_abs_2_7_is_positive
   >= -204
 dx_abs_2_7_force_negative: dx_diff_2_7 - 204 dx_abs_2_7_is_positive <= 0
 dy_abs_2_7_abs_ge_orig: dy_abs_2_7 - dy_diff_2_7
   - 204 dy_abs_2_7_is_positive >= -204
 dy_abs_2_7_abs_le_orig: dy_abs_2_7 - dy_diff_2_7
   + 204 dy_abs_2_7_is_positive <= 204
 dy_abs_2_7_abs_ge_neg_orig: dy_abs_2_7 + dy_diff_2_7
   + 204 dy_abs_2_7_is_positive >= 0
 dy_abs_2_7_abs_le_neg_orig: dy_abs_2_7 + dy_diff_2_7
   - 204 dy_abs_2_7_is_positive <= 0
 dy_abs_2_7_force_positive: dy_diff_2_7 - 204 dy_abs_2_7_is_positive
   >= -204
 dy_abs_2_7_force_negative: dy_diff_2_7 - 204 dy_abs_2_7_is_positive <= 0
 dx_diff_def_3_6: - cx_grid_var_3 + cx_grid_var_6 + dx_diff_3_6 = 0
 dy_diff_def_3_6: - cy_grid_var_3 + cy_grid_var_6 + dy_diff_3_6 = 0
 dx_abs_3_6_abs_ge_orig: dx_abs_3_6 - dx_diff_3_6
   - 204 dx_abs_3_6_is_positive >= -204
 dx_abs_3_6_abs_le_orig: dx_abs_3_6 - dx_diff_3_6
   + 204 dx_abs_3_6_is_positive <= 204
 dx_abs_3_6_abs_ge_neg_orig: dx_abs_3_6 + dx_diff_3_6
   + 204 dx_abs_3_6_is_positive >= 0
 dx_abs_3_6_abs_le_neg_orig: dx_abs_3_6 + dx_diff_3_6
   - 204 dx_abs_3_6_is_positive <= 0
 dx_abs_3_6_force_positive: dx_diff_3_6 - 204 dx_abs_3_6_is_positive
   >= -204
 dx_abs_3_6_force_negative: dx_diff_3_6 - 204 dx_abs_3_6_is_positive <= 0
 dy_abs_3_6_abs_ge_orig: dy_abs_3_6 - dy_diff_3_6
   - 204 dy_abs_3_6_is_positive >= -204
 dy_abs_3_6_abs_le_orig: dy_abs_3_6 - dy_diff_3_6
   + 204 dy_abs_3_6_is_positive <= 204
 dy_abs_3_6_abs_ge_neg_orig: dy_abs_3_6 + dy_diff_3_6
   + 204 dy_abs_3_6_is_positive >= 0
 dy_abs_3_6_abs_le_neg_orig: dy_abs_3_6 + dy_diff_3_6
   - 204 dy_abs_3_6_is_positive <= 0
 dy_abs_3_6_force_positive: dy_diff_3_6 - 204 dy_abs_3_6_is_positive
   >= -204
 dy_abs_3_6_force_negative: dy_diff_3_6 - 204 dy_abs_3_6_is_positive <= 0
 dx_diff_def_i_0_2: EMIB_cx_grid_var_0_2 - cx_grid_var_0 + dx_diff_i_0_2
   = 0
 dx_diff_def_j_0_2: EMIB_cx_grid_var_0_2 - cx_grid_var_2 + dx_diff_j_0_2
   = 0
 dy_diff_def_i_0_2: EMIB_cy_grid_var_0_2 - cy_grid_var_0 + dy_diff_i_0_2
   = 0
 dy_diff_def_j_0_2: EMIB_cy_grid_var_0_2 - cy_grid_var_2 + dy_diff_j_0_2
   = 0
 dx_abs_i_0_2_abs_ge_orig: dx_abs_i_0_2 - dx_diff_i_0_2
   - 204 dx_abs_i_0_2_is_positive >= -204
 dx_abs_i_0_2_abs_le_orig: dx_abs_i_0_2 - dx_diff_i_0_2
   + 204 dx_abs_i_0_2_is_positive <= 204
 dx_abs_i_0_2_abs_ge_neg_orig: dx_abs_i_0_2 + dx_diff_i_0_2
   + 204 dx_abs_i_0_2_is_positive >= 0
 dx_abs_i_0_2_abs_le_neg_orig: dx_abs_i_0_2 + dx_diff_i_0_2
   - 204 dx_abs_i_0_2_is_positive <= 0
 dx_abs_i_0_2_force_positive: dx_diff_i_0_2 - 204 dx_abs_i_0_2_is_positive
   >= -204
 dx_abs_i_0_2_force_negative: dx_diff_i_0_2 - 204 dx_abs_i_0_2_is_positive
   <= 0
 dy_abs_i_0_2_abs_ge_orig: dy_abs_i_0_2 - dy_diff_i_0_2
   - 204 dy_abs_i_0_2_is_positive >= -204
 dy_abs_i_0_2_abs_le_orig: dy_abs_i_0_2 - dy_diff_i_0_2
   + 204 dy_abs_i_0_2_is_positive <= 204
 dy_abs_i_0_2_abs_ge_neg_orig: dy_abs_i_0_2 + dy_diff_i_0_2
   + 204 dy_abs_i_0_2_is_positive >= 0
 dy_abs_i_0_2_abs_le_neg_orig: dy_abs_i_0_2 + dy_diff_i_0_2
   - 204 dy_abs_i_0_2_is_positive <= 0
 dy_abs_i_0_2_force_positive: dy_diff_i_0_2 - 204 dy_abs_i_0_2_is_positive
   >= -204
 dy_abs_i_0_2_force_negative: dy_diff_i_0_2 - 204 dy_abs_i_0_2_is_positive
   <= 0
 dx_abs_j_0_2_abs_ge_orig: dx_abs_j_0_2 - dx_diff_j_0_2
   - 204 dx_abs_j_0_2_is_positive >= -204
 dx_abs_j_0_2_abs_le_orig: dx_abs_j_0_2 - dx_diff_j_0_2
   + 204 dx_abs_j_0_2_is_positive <= 204
 dx_abs_j_0_2_abs_ge_neg_orig: dx_abs_j_0_2 + dx_diff_j_0_2
   + 204 dx_abs_j_0_2_is_positive >= 0
 dx_abs_j_0_2_abs_le_neg_orig: dx_abs_j_0_2 + dx_diff_j_0_2
   - 204 dx_abs_j_0_2_is_positive <= 0
 dx_abs_j_0_2_force_positive: dx_diff_j_0_2 - 204 dx_abs_j_0_2_is_positive
   >= -204
 dx_abs_j_0_2_force_negative: dx_diff_j_0_2 - 204 dx_abs_j_0_2_is_positive
   <= 0
 dy_abs_j_0_2_abs_ge_orig: dy_abs_j_0_2 - dy_diff_j_0_2
   - 204 dy_abs_j_0_2_is_positive >= -204
 dy_abs_j_0_2_abs_le_orig: dy_abs_j_0_2 - dy_diff_j_0_2
   + 204 dy_abs_j_0_2_is_positive <= 204
 dy_abs_j_0_2_abs_ge_neg_orig: dy_abs_j_0_2 + dy_diff_j_0_2
   + 204 dy_abs_j_0_2_is_positive >= 0
 dy_abs_j_0_2_abs_le_neg_orig: dy_abs_j_0_2 + dy_diff_j_0_2
   - 204 dy_abs_j_0_2_is_positive <= 0
 dy_abs_j_0_2_force_positive: dy_diff_j_0_2 - 204 dy_abs_j_0_2_is_positive
   >= -204
 dy_abs_j_0_2_force_negative: dy_diff_j_0_2 - 204 dy_abs_j_0_2_is_positive
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
   - 204 dx_abs_i_0_5_is_positive >= -204
 dx_abs_i_0_5_abs_le_orig: dx_abs_i_0_5 - dx_diff_i_0_5
   + 204 dx_abs_i_0_5_is_positive <= 204
 dx_abs_i_0_5_abs_ge_neg_orig: dx_abs_i_0_5 + dx_diff_i_0_5
   + 204 dx_abs_i_0_5_is_positive >= 0
 dx_abs_i_0_5_abs_le_neg_orig: dx_abs_i_0_5 + dx_diff_i_0_5
   - 204 dx_abs_i_0_5_is_positive <= 0
 dx_abs_i_0_5_force_positive: dx_diff_i_0_5 - 204 dx_abs_i_0_5_is_positive
   >= -204
 dx_abs_i_0_5_force_negative: dx_diff_i_0_5 - 204 dx_abs_i_0_5_is_positive
   <= 0
 dy_abs_i_0_5_abs_ge_orig: dy_abs_i_0_5 - dy_diff_i_0_5
   - 204 dy_abs_i_0_5_is_positive >= -204
 dy_abs_i_0_5_abs_le_orig: dy_abs_i_0_5 - dy_diff_i_0_5
   + 204 dy_abs_i_0_5_is_positive <= 204
 dy_abs_i_0_5_abs_ge_neg_orig: dy_abs_i_0_5 + dy_diff_i_0_5
   + 204 dy_abs_i_0_5_is_positive >= 0
 dy_abs_i_0_5_abs_le_neg_orig: dy_abs_i_0_5 + dy_diff_i_0_5
   - 204 dy_abs_i_0_5_is_positive <= 0
 dy_abs_i_0_5_force_positive: dy_diff_i_0_5 - 204 dy_abs_i_0_5_is_positive
   >= -204
 dy_abs_i_0_5_force_negative: dy_diff_i_0_5 - 204 dy_abs_i_0_5_is_positive
   <= 0
 dx_abs_j_0_5_abs_ge_orig: dx_abs_j_0_5 - dx_diff_j_0_5
   - 204 dx_abs_j_0_5_is_positive >= -204
 dx_abs_j_0_5_abs_le_orig: dx_abs_j_0_5 - dx_diff_j_0_5
   + 204 dx_abs_j_0_5_is_positive <= 204
 dx_abs_j_0_5_abs_ge_neg_orig: dx_abs_j_0_5 + dx_diff_j_0_5
   + 204 dx_abs_j_0_5_is_positive >= 0
 dx_abs_j_0_5_abs_le_neg_orig: dx_abs_j_0_5 + dx_diff_j_0_5
   - 204 dx_abs_j_0_5_is_positive <= 0
 dx_abs_j_0_5_force_positive: dx_diff_j_0_5 - 204 dx_abs_j_0_5_is_positive
   >= -204
 dx_abs_j_0_5_force_negative: dx_diff_j_0_5 - 204 dx_abs_j_0_5_is_positive
   <= 0
 dy_abs_j_0_5_abs_ge_orig: dy_abs_j_0_5 - dy_diff_j_0_5
   - 204 dy_abs_j_0_5_is_positive >= -204
 dy_abs_j_0_5_abs_le_orig: dy_abs_j_0_5 - dy_diff_j_0_5
   + 204 dy_abs_j_0_5_is_positive <= 204
 dy_abs_j_0_5_abs_ge_neg_orig: dy_abs_j_0_5 + dy_diff_j_0_5
   + 204 dy_abs_j_0_5_is_positive >= 0
 dy_abs_j_0_5_abs_le_neg_orig: dy_abs_j_0_5 + dy_diff_j_0_5
   - 204 dy_abs_j_0_5_is_positive <= 0
 dy_abs_j_0_5_force_positive: dy_diff_j_0_5 - 204 dy_abs_j_0_5_is_positive
   >= -204
 dy_abs_j_0_5_force_negative: dy_diff_j_0_5 - 204 dy_abs_j_0_5_is_positive
   <= 0
 dx_diff_def_i_0_7: EMIB_cx_grid_var_0_7 - cx_grid_var_0 + dx_diff_i_0_7
   = 0
 dx_diff_def_j_0_7: EMIB_cx_grid_var_0_7 - cx_grid_var_7 + dx_diff_j_0_7
   = 0
 dy_diff_def_i_0_7: EMIB_cy_grid_var_0_7 - cy_grid_var_0 + dy_diff_i_0_7
   = 0
 dy_diff_def_j_0_7: EMIB_cy_grid_var_0_7 - cy_grid_var_7 + dy_diff_j_0_7
   = 0
 dx_abs_i_0_7_abs_ge_orig: dx_abs_i_0_7 - dx_diff_i_0_7
   - 204 dx_abs_i_0_7_is_positive >= -204
 dx_abs_i_0_7_abs_le_orig: dx_abs_i_0_7 - dx_diff_i_0_7
   + 204 dx_abs_i_0_7_is_positive <= 204
 dx_abs_i_0_7_abs_ge_neg_orig: dx_abs_i_0_7 + dx_diff_i_0_7
   + 204 dx_abs_i_0_7_is_positive >= 0
 dx_abs_i_0_7_abs_le_neg_orig: dx_abs_i_0_7 + dx_diff_i_0_7
   - 204 dx_abs_i_0_7_is_positive <= 0
 dx_abs_i_0_7_force_positive: dx_diff_i_0_7 - 204 dx_abs_i_0_7_is_positive
   >= -204
 dx_abs_i_0_7_force_negative: dx_diff_i_0_7 - 204 dx_abs_i_0_7_is_positive
   <= 0
 dy_abs_i_0_7_abs_ge_orig: dy_abs_i_0_7 - dy_diff_i_0_7
   - 204 dy_abs_i_0_7_is_positive >= -204
 dy_abs_i_0_7_abs_le_orig: dy_abs_i_0_7 - dy_diff_i_0_7
   + 204 dy_abs_i_0_7_is_positive <= 204
 dy_abs_i_0_7_abs_ge_neg_orig: dy_abs_i_0_7 + dy_diff_i_0_7
   + 204 dy_abs_i_0_7_is_positive >= 0
 dy_abs_i_0_7_abs_le_neg_orig: dy_abs_i_0_7 + dy_diff_i_0_7
   - 204 dy_abs_i_0_7_is_positive <= 0
 dy_abs_i_0_7_force_positive: dy_diff_i_0_7 - 204 dy_abs_i_0_7_is_positive
   >= -204
 dy_abs_i_0_7_force_negative: dy_diff_i_0_7 - 204 dy_abs_i_0_7_is_positive
   <= 0
 dx_abs_j_0_7_abs_ge_orig: dx_abs_j_0_7 - dx_diff_j_0_7
   - 204 dx_abs_j_0_7_is_positive >= -204
 dx_abs_j_0_7_abs_le_orig: dx_abs_j_0_7 - dx_diff_j_0_7
   + 204 dx_abs_j_0_7_is_positive <= 204
 dx_abs_j_0_7_abs_ge_neg_orig: dx_abs_j_0_7 + dx_diff_j_0_7
   + 204 dx_abs_j_0_7_is_positive >= 0
 dx_abs_j_0_7_abs_le_neg_orig: dx_abs_j_0_7 + dx_diff_j_0_7
   - 204 dx_abs_j_0_7_is_positive <= 0
 dx_abs_j_0_7_force_positive: dx_diff_j_0_7 - 204 dx_abs_j_0_7_is_positive
   >= -204
 dx_abs_j_0_7_force_negative: dx_diff_j_0_7 - 204 dx_abs_j_0_7_is_positive
   <= 0
 dy_abs_j_0_7_abs_ge_orig: dy_abs_j_0_7 - dy_diff_j_0_7
   - 204 dy_abs_j_0_7_is_positive >= -204
 dy_abs_j_0_7_abs_le_orig: dy_abs_j_0_7 - dy_diff_j_0_7
   + 204 dy_abs_j_0_7_is_positive <= 204
 dy_abs_j_0_7_abs_ge_neg_orig: dy_abs_j_0_7 + dy_diff_j_0_7
   + 204 dy_abs_j_0_7_is_positive >= 0
 dy_abs_j_0_7_abs_le_neg_orig: dy_abs_j_0_7 + dy_diff_j_0_7
   - 204 dy_abs_j_0_7_is_positive <= 0
 dy_abs_j_0_7_force_positive: dy_diff_j_0_7 - 204 dy_abs_j_0_7_is_positive
   >= -204
 dy_abs_j_0_7_force_negative: dy_diff_j_0_7 - 204 dy_abs_j_0_7_is_positive
   <= 0
 dx_diff_def_i_2_3: EMIB_cx_grid_var_2_3 - cx_grid_var_2 + dx_diff_i_2_3
   = 0
 dx_diff_def_j_2_3: EMIB_cx_grid_var_2_3 - cx_grid_var_3 + dx_diff_j_2_3
   = 0
 dy_diff_def_i_2_3: EMIB_cy_grid_var_2_3 - cy_grid_var_2 + dy_diff_i_2_3
   = 0
 dy_diff_def_j_2_3: EMIB_cy_grid_var_2_3 - cy_grid_var_3 + dy_diff_j_2_3
   = 0
 dx_abs_i_2_3_abs_ge_orig: dx_abs_i_2_3 - dx_diff_i_2_3
   - 204 dx_abs_i_2_3_is_positive >= -204
 dx_abs_i_2_3_abs_le_orig: dx_abs_i_2_3 - dx_diff_i_2_3
   + 204 dx_abs_i_2_3_is_positive <= 204
 dx_abs_i_2_3_abs_ge_neg_orig: dx_abs_i_2_3 + dx_diff_i_2_3
   + 204 dx_abs_i_2_3_is_positive >= 0
 dx_abs_i_2_3_abs_le_neg_orig: dx_abs_i_2_3 + dx_diff_i_2_3
   - 204 dx_abs_i_2_3_is_positive <= 0
 dx_abs_i_2_3_force_positive: dx_diff_i_2_3 - 204 dx_abs_i_2_3_is_positive
   >= -204
 dx_abs_i_2_3_force_negative: dx_diff_i_2_3 - 204 dx_abs_i_2_3_is_positive
   <= 0
 dy_abs_i_2_3_abs_ge_orig: dy_abs_i_2_3 - dy_diff_i_2_3
   - 204 dy_abs_i_2_3_is_positive >= -204
 dy_abs_i_2_3_abs_le_orig: dy_abs_i_2_3 - dy_diff_i_2_3
   + 204 dy_abs_i_2_3_is_positive <= 204
 dy_abs_i_2_3_abs_ge_neg_orig: dy_abs_i_2_3 + dy_diff_i_2_3
   + 204 dy_abs_i_2_3_is_positive >= 0
 dy_abs_i_2_3_abs_le_neg_orig: dy_abs_i_2_3 + dy_diff_i_2_3
   - 204 dy_abs_i_2_3_is_positive <= 0
 dy_abs_i_2_3_force_positive: dy_diff_i_2_3 - 204 dy_abs_i_2_3_is_positive
   >= -204
 dy_abs_i_2_3_force_negative: dy_diff_i_2_3 - 204 dy_abs_i_2_3_is_positive
   <= 0
 dx_abs_j_2_3_abs_ge_orig: dx_abs_j_2_3 - dx_diff_j_2_3
   - 204 dx_abs_j_2_3_is_positive >= -204
 dx_abs_j_2_3_abs_le_orig: dx_abs_j_2_3 - dx_diff_j_2_3
   + 204 dx_abs_j_2_3_is_positive <= 204
 dx_abs_j_2_3_abs_ge_neg_orig: dx_abs_j_2_3 + dx_diff_j_2_3
   + 204 dx_abs_j_2_3_is_positive >= 0
 dx_abs_j_2_3_abs_le_neg_orig: dx_abs_j_2_3 + dx_diff_j_2_3
   - 204 dx_abs_j_2_3_is_positive <= 0
 dx_abs_j_2_3_force_positive: dx_diff_j_2_3 - 204 dx_abs_j_2_3_is_positive
   >= -204
 dx_abs_j_2_3_force_negative: dx_diff_j_2_3 - 204 dx_abs_j_2_3_is_positive
   <= 0
 dy_abs_j_2_3_abs_ge_orig: dy_abs_j_2_3 - dy_diff_j_2_3
   - 204 dy_abs_j_2_3_is_positive >= -204
 dy_abs_j_2_3_abs_le_orig: dy_abs_j_2_3 - dy_diff_j_2_3
   + 204 dy_abs_j_2_3_is_positive <= 204
 dy_abs_j_2_3_abs_ge_neg_orig: dy_abs_j_2_3 + dy_diff_j_2_3
   + 204 dy_abs_j_2_3_is_positive >= 0
 dy_abs_j_2_3_abs_le_neg_orig: dy_abs_j_2_3 + dy_diff_j_2_3
   - 204 dy_abs_j_2_3_is_positive <= 0
 dy_abs_j_2_3_force_positive: dy_diff_j_2_3 - 204 dy_abs_j_2_3_is_positive
   >= -204
 dy_abs_j_2_3_force_negative: dy_diff_j_2_3 - 204 dy_abs_j_2_3_is_positive
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
   - 204 dx_abs_i_4_6_is_positive >= -204
 dx_abs_i_4_6_abs_le_orig: dx_abs_i_4_6 - dx_diff_i_4_6
   + 204 dx_abs_i_4_6_is_positive <= 204
 dx_abs_i_4_6_abs_ge_neg_orig: dx_abs_i_4_6 + dx_diff_i_4_6
   + 204 dx_abs_i_4_6_is_positive >= 0
 dx_abs_i_4_6_abs_le_neg_orig: dx_abs_i_4_6 + dx_diff_i_4_6
   - 204 dx_abs_i_4_6_is_positive <= 0
 dx_abs_i_4_6_force_positive: dx_diff_i_4_6 - 204 dx_abs_i_4_6_is_positive
   >= -204
 dx_abs_i_4_6_force_negative: dx_diff_i_4_6 - 204 dx_abs_i_4_6_is_positive
   <= 0
 dy_abs_i_4_6_abs_ge_orig: dy_abs_i_4_6 - dy_diff_i_4_6
   - 204 dy_abs_i_4_6_is_positive >= -204
 dy_abs_i_4_6_abs_le_orig: dy_abs_i_4_6 - dy_diff_i_4_6
   + 204 dy_abs_i_4_6_is_positive <= 204
 dy_abs_i_4_6_abs_ge_neg_orig: dy_abs_i_4_6 + dy_diff_i_4_6
   + 204 dy_abs_i_4_6_is_positive >= 0
 dy_abs_i_4_6_abs_le_neg_orig: dy_abs_i_4_6 + dy_diff_i_4_6
   - 204 dy_abs_i_4_6_is_positive <= 0
 dy_abs_i_4_6_force_positive: dy_diff_i_4_6 - 204 dy_abs_i_4_6_is_positive
   >= -204
 dy_abs_i_4_6_force_negative: dy_diff_i_4_6 - 204 dy_abs_i_4_6_is_positive
   <= 0
 dx_abs_j_4_6_abs_ge_orig: dx_abs_j_4_6 - dx_diff_j_4_6
   - 204 dx_abs_j_4_6_is_positive >= -204
 dx_abs_j_4_6_abs_le_orig: dx_abs_j_4_6 - dx_diff_j_4_6
   + 204 dx_abs_j_4_6_is_positive <= 204
 dx_abs_j_4_6_abs_ge_neg_orig: dx_abs_j_4_6 + dx_diff_j_4_6
   + 204 dx_abs_j_4_6_is_positive >= 0
 dx_abs_j_4_6_abs_le_neg_orig: dx_abs_j_4_6 + dx_diff_j_4_6
   - 204 dx_abs_j_4_6_is_positive <= 0
 dx_abs_j_4_6_force_positive: dx_diff_j_4_6 - 204 dx_abs_j_4_6_is_positive
   >= -204
 dx_abs_j_4_6_force_negative: dx_diff_j_4_6 - 204 dx_abs_j_4_6_is_positive
   <= 0
 dy_abs_j_4_6_abs_ge_orig: dy_abs_j_4_6 - dy_diff_j_4_6
   - 204 dy_abs_j_4_6_is_positive >= -204
 dy_abs_j_4_6_abs_le_orig: dy_abs_j_4_6 - dy_diff_j_4_6
   + 204 dy_abs_j_4_6_is_positive <= 204
 dy_abs_j_4_6_abs_ge_neg_orig: dy_abs_j_4_6 + dy_diff_j_4_6
   + 204 dy_abs_j_4_6_is_positive >= 0
 dy_abs_j_4_6_abs_le_neg_orig: dy_abs_j_4_6 + dy_diff_j_4_6
   - 204 dy_abs_j_4_6_is_positive <= 0
 dy_abs_j_4_6_force_positive: dy_diff_j_4_6 - 204 dy_abs_j_4_6_is_positive
   >= -204
 dy_abs_j_4_6_force_negative: dy_diff_j_4_6 - 204 dy_abs_j_4_6_is_positive
   <= 0
 dx_diff_def_i_5_7: EMIB_cx_grid_var_5_7 - cx_grid_var_5 + dx_diff_i_5_7
   = 0
 dx_diff_def_j_5_7: EMIB_cx_grid_var_5_7 - cx_grid_var_7 + dx_diff_j_5_7
   = 0
 dy_diff_def_i_5_7: EMIB_cy_grid_var_5_7 - cy_grid_var_5 + dy_diff_i_5_7
   = 0
 dy_diff_def_j_5_7: EMIB_cy_grid_var_5_7 - cy_grid_var_7 + dy_diff_j_5_7
   = 0
 dx_abs_i_5_7_abs_ge_orig: dx_abs_i_5_7 - dx_diff_i_5_7
   - 204 dx_abs_i_5_7_is_positive >= -204
 dx_abs_i_5_7_abs_le_orig: dx_abs_i_5_7 - dx_diff_i_5_7
   + 204 dx_abs_i_5_7_is_positive <= 204
 dx_abs_i_5_7_abs_ge_neg_orig: dx_abs_i_5_7 + dx_diff_i_5_7
   + 204 dx_abs_i_5_7_is_positive >= 0
 dx_abs_i_5_7_abs_le_neg_orig: dx_abs_i_5_7 + dx_diff_i_5_7
   - 204 dx_abs_i_5_7_is_positive <= 0
 dx_abs_i_5_7_force_positive: dx_diff_i_5_7 - 204 dx_abs_i_5_7_is_positive
   >= -204
 dx_abs_i_5_7_force_negative: dx_diff_i_5_7 - 204 dx_abs_i_5_7_is_positive
   <= 0
 dy_abs_i_5_7_abs_ge_orig: dy_abs_i_5_7 - dy_diff_i_5_7
   - 204 dy_abs_i_5_7_is_positive >= -204
 dy_abs_i_5_7_abs_le_orig: dy_abs_i_5_7 - dy_diff_i_5_7
   + 204 dy_abs_i_5_7_is_positive <= 204
 dy_abs_i_5_7_abs_ge_neg_orig: dy_abs_i_5_7 + dy_diff_i_5_7
   + 204 dy_abs_i_5_7_is_positive >= 0
 dy_abs_i_5_7_abs_le_neg_orig: dy_abs_i_5_7 + dy_diff_i_5_7
   - 204 dy_abs_i_5_7_is_positive <= 0
 dy_abs_i_5_7_force_positive: dy_diff_i_5_7 - 204 dy_abs_i_5_7_is_positive
   >= -204
 dy_abs_i_5_7_force_negative: dy_diff_i_5_7 - 204 dy_abs_i_5_7_is_positive
   <= 0
 dx_abs_j_5_7_abs_ge_orig: dx_abs_j_5_7 - dx_diff_j_5_7
   - 204 dx_abs_j_5_7_is_positive >= -204
 dx_abs_j_5_7_abs_le_orig: dx_abs_j_5_7 - dx_diff_j_5_7
   + 204 dx_abs_j_5_7_is_positive <= 204
 dx_abs_j_5_7_abs_ge_neg_orig: dx_abs_j_5_7 + dx_diff_j_5_7
   + 204 dx_abs_j_5_7_is_positive >= 0
 dx_abs_j_5_7_abs_le_neg_orig: dx_abs_j_5_7 + dx_diff_j_5_7
   - 204 dx_abs_j_5_7_is_positive <= 0
 dx_abs_j_5_7_force_positive: dx_diff_j_5_7 - 204 dx_abs_j_5_7_is_positive
   >= -204
 dx_abs_j_5_7_force_negative: dx_diff_j_5_7 - 204 dx_abs_j_5_7_is_positive
   <= 0
 dy_abs_j_5_7_abs_ge_orig: dy_abs_j_5_7 - dy_diff_j_5_7
   - 204 dy_abs_j_5_7_is_positive >= -204
 dy_abs_j_5_7_abs_le_orig: dy_abs_j_5_7 - dy_diff_j_5_7
   + 204 dy_abs_j_5_7_is_positive <= 204
 dy_abs_j_5_7_abs_ge_neg_orig: dy_abs_j_5_7 + dy_diff_j_5_7
   + 204 dy_abs_j_5_7_is_positive >= 0
 dy_abs_j_5_7_abs_le_neg_orig: dy_abs_j_5_7 + dy_diff_j_5_7
   - 204 dy_abs_j_5_7_is_positive <= 0
 dy_abs_j_5_7_force_positive: dy_diff_j_5_7 - 204 dy_abs_j_5_7_is_positive
   >= -204
 dy_abs_j_5_7_force_negative: dy_diff_j_5_7 - 204 dy_abs_j_5_7_is_positive
   <= 0
 dx_diff_def_i_6_7: EMIB_cx_grid_var_6_7 - cx_grid_var_6 + dx_diff_i_6_7
   = 0
 dx_diff_def_j_6_7: EMIB_cx_grid_var_6_7 - cx_grid_var_7 + dx_diff_j_6_7
   = 0
 dy_diff_def_i_6_7: EMIB_cy_grid_var_6_7 - cy_grid_var_6 + dy_diff_i_6_7
   = 0
 dy_diff_def_j_6_7: EMIB_cy_grid_var_6_7 - cy_grid_var_7 + dy_diff_j_6_7
   = 0
 dx_abs_i_6_7_abs_ge_orig: dx_abs_i_6_7 - dx_diff_i_6_7
   - 204 dx_abs_i_6_7_is_positive >= -204
 dx_abs_i_6_7_abs_le_orig: dx_abs_i_6_7 - dx_diff_i_6_7
   + 204 dx_abs_i_6_7_is_positive <= 204
 dx_abs_i_6_7_abs_ge_neg_orig: dx_abs_i_6_7 + dx_diff_i_6_7
   + 204 dx_abs_i_6_7_is_positive >= 0
 dx_abs_i_6_7_abs_le_neg_orig: dx_abs_i_6_7 + dx_diff_i_6_7
   - 204 dx_abs_i_6_7_is_positive <= 0
 dx_abs_i_6_7_force_positive: dx_diff_i_6_7 - 204 dx_abs_i_6_7_is_positive
   >= -204
 dx_abs_i_6_7_force_negative: dx_diff_i_6_7 - 204 dx_abs_i_6_7_is_positive
   <= 0
 dy_abs_i_6_7_abs_ge_orig: dy_abs_i_6_7 - dy_diff_i_6_7
   - 204 dy_abs_i_6_7_is_positive >= -204
 dy_abs_i_6_7_abs_le_orig: dy_abs_i_6_7 - dy_diff_i_6_7
   + 204 dy_abs_i_6_7_is_positive <= 204
 dy_abs_i_6_7_abs_ge_neg_orig: dy_abs_i_6_7 + dy_diff_i_6_7
   + 204 dy_abs_i_6_7_is_positive >= 0
 dy_abs_i_6_7_abs_le_neg_orig: dy_abs_i_6_7 + dy_diff_i_6_7
   - 204 dy_abs_i_6_7_is_positive <= 0
 dy_abs_i_6_7_force_positive: dy_diff_i_6_7 - 204 dy_abs_i_6_7_is_positive
   >= -204
 dy_abs_i_6_7_force_negative: dy_diff_i_6_7 - 204 dy_abs_i_6_7_is_positive
   <= 0
 dx_abs_j_6_7_abs_ge_orig: dx_abs_j_6_7 - dx_diff_j_6_7
   - 204 dx_abs_j_6_7_is_positive >= -204
 dx_abs_j_6_7_abs_le_orig: dx_abs_j_6_7 - dx_diff_j_6_7
   + 204 dx_abs_j_6_7_is_positive <= 204
 dx_abs_j_6_7_abs_ge_neg_orig: dx_abs_j_6_7 + dx_diff_j_6_7
   + 204 dx_abs_j_6_7_is_positive >= 0
 dx_abs_j_6_7_abs_le_neg_orig: dx_abs_j_6_7 + dx_diff_j_6_7
   - 204 dx_abs_j_6_7_is_positive <= 0
 dx_abs_j_6_7_force_positive: dx_diff_j_6_7 - 204 dx_abs_j_6_7_is_positive
   >= -204
 dx_abs_j_6_7_force_negative: dx_diff_j_6_7 - 204 dx_abs_j_6_7_is_positive
   <= 0
 dy_abs_j_6_7_abs_ge_orig: dy_abs_j_6_7 - dy_diff_j_6_7
   - 204 dy_abs_j_6_7_is_positive >= -204
 dy_abs_j_6_7_abs_le_orig: dy_abs_j_6_7 - dy_diff_j_6_7
   + 204 dy_abs_j_6_7_is_positive <= 204
 dy_abs_j_6_7_abs_ge_neg_orig: dy_abs_j_6_7 + dy_diff_j_6_7
   + 204 dy_abs_j_6_7_is_positive >= 0
 dy_abs_j_6_7_abs_le_neg_orig: dy_abs_j_6_7 + dy_diff_j_6_7
   - 204 dy_abs_j_6_7_is_positive <= 0
 dy_abs_j_6_7_force_positive: dy_diff_j_6_7 - 204 dy_abs_j_6_7_is_positive
   >= -204
 dy_abs_j_6_7_force_negative: dy_diff_j_6_7 - 204 dy_abs_j_6_7_is_positive
   <= 0
 wirelength_def: wirelength - 128 dx_abs_1_4 - 128 dy_abs_1_4
   - 128 dx_abs_1_5 - 128 dy_abs_1_5 - 128 dx_abs_2_6 - 128 dy_abs_2_6
   - 128 dx_abs_2_7 - 128 dy_abs_2_7 - 128 dx_abs_3_6 - 128 dy_abs_3_6
   - 512 dx_abs_i_0_2 - 512 dy_abs_i_0_2 - 512 dx_abs_j_0_2
   - 512 dy_abs_j_0_2 - 256 dx_abs_i_0_5 - 256 dy_abs_i_0_5
   - 256 dx_abs_j_0_5 - 256 dy_abs_j_0_5 - 512 dx_abs_i_0_7
   - 512 dy_abs_i_0_7 - 512 dx_abs_j_0_7 - 512 dy_abs_j_0_7
   - 256 dx_abs_i_2_3 - 256 dy_abs_i_2_3 - 256 dx_abs_j_2_3
   - 256 dy_abs_j_2_3 - 256 dx_abs_i_4_6 - 256 dy_abs_i_4_6
   - 256 dx_abs_j_4_6 - 256 dy_abs_j_4_6 - 512 dx_abs_i_5_7
   - 512 dy_abs_i_5_7 - 512 dx_abs_j_5_7 - 512 dy_abs_j_5_7
   - 256 dx_abs_i_6_7 - 256 dy_abs_i_6_7 - 256 dx_abs_j_6_7
   - 256 dy_abs_j_6_7 = 0
 t_ge_scaled_mean: - 0.8 bbox_w - 0.8 bbox_h + bbox_area_proxy_t >= 0
Bounds
 4.62 <= w_var_0 <= 10.36
 4.62 <= h_var_0 <= 10.36
 3.78 <= w_var_1 <= 7
 3.78 <= h_var_1 <= 7
 2.1 <= w_var_2 <= 9.8
 2.1 <= h_var_2 <= 9.8
 2.1 <= w_var_3 <= 9.8
 2.1 <= h_var_3 <= 9.8
 2.1 <= w_var_4 <= 9.8
 2.1 <= h_var_4 <= 9.8
 5.46 <= w_var_5 <= 33.04
 5.46 <= h_var_5 <= 33.04
 5.46 <= w_var_6 <= 33.04
 5.46 <= h_var_6 <= 33.04
 2.52 <= w_var_7 <= 20.16
 2.52 <= h_var_7 <= 20.16
 1.7067 <= EMIB_w_var_0_2 <= 2
 1.7067 <= EMIB_h_var_0_2 <= 2
 0.8533 <= EMIB_w_var_0_5 <= 2
 0.8533 <= EMIB_h_var_0_5 <= 2
 1.7067 <= EMIB_w_var_0_7 <= 2
 1.7067 <= EMIB_h_var_0_7 <= 2
 0.8533 <= EMIB_w_var_2_3 <= 2
 0.8533 <= EMIB_h_var_2_3 <= 2
 0.8533 <= EMIB_w_var_4_6 <= 2
 0.8533 <= EMIB_h_var_4_6 <= 2
 1.7067 <= EMIB_w_var_5_7 <= 2
 1.7067 <= EMIB_h_var_5_7 <= 2
 0.8533 <= EMIB_w_var_6_7 <= 2
 0.8533 <= EMIB_h_var_6_7 <= 2
 x_grid_var_0 <= 102
 y_grid_var_0 <= 102
 x_grid_var_1 <= 102
 y_grid_var_1 <= 102
 x_grid_var_2 <= 102
 y_grid_var_2 <= 102
 x_grid_var_3 <= 102
 y_grid_var_3 <= 102
 x_grid_var_4 <= 102
 y_grid_var_4 <= 102
 x_grid_var_5 <= 102
 y_grid_var_5 <= 102
 x_grid_var_6 <= 102
 y_grid_var_6 <= 102
 x_grid_var_7 <= 102
 y_grid_var_7 <= 102
 EMIB_x_grid_var_0_2 <= 102
 EMIB_y_grid_var_0_2 <= 102
 EMIB_x_grid_var_0_5 <= 102
 EMIB_y_grid_var_0_5 <= 102
 EMIB_x_grid_var_0_7 <= 102
 EMIB_y_grid_var_0_7 <= 102
 EMIB_x_grid_var_2_3 <= 102
 EMIB_y_grid_var_2_3 <= 102
 EMIB_x_grid_var_4_6 <= 102
 EMIB_y_grid_var_4_6 <= 102
 EMIB_x_grid_var_5_7 <= 102
 EMIB_y_grid_var_5_7 <= 102
 EMIB_x_grid_var_6_7 <= 102
 EMIB_y_grid_var_6_7 <= 102
 EMIB_cx_grid_var_0_2 <= 204
 EMIB_cy_grid_var_0_2 <= 204
 EMIB_cx_grid_var_0_5 <= 204
 EMIB_cy_grid_var_0_5 <= 204
 EMIB_cx_grid_var_0_7 <= 204
 EMIB_cy_grid_var_0_7 <= 204
 EMIB_cx_grid_var_2_3 <= 204
 EMIB_cy_grid_var_2_3 <= 204
 EMIB_cx_grid_var_4_6 <= 204
 EMIB_cy_grid_var_4_6 <= 204
 EMIB_cx_grid_var_5_7 <= 204
 EMIB_cy_grid_var_5_7 <= 204
 EMIB_cx_grid_var_6_7 <= 204
 EMIB_cy_grid_var_6_7 <= 204
 cx_grid_var_0 <= 204
 cy_grid_var_0 <= 204
 cx_grid_var_1 <= 204
 cy_grid_var_1 <= 204
 cx_grid_var_2 <= 204
 cy_grid_var_2 <= 204
 cx_grid_var_3 <= 204
 cy_grid_var_3 <= 204
 cx_grid_var_4 <= 204
 cy_grid_var_4 <= 204
 cx_grid_var_5 <= 204
 cy_grid_var_5 <= 204
 cx_grid_var_6 <= 204
 cy_grid_var_6 <= 204
 cx_grid_var_7 <= 204
 cy_grid_var_7 <= 204
 cx_center <= 102
 cy_center <= 102
 bbox_min_x <= 102
 bbox_max_x <= 102
 bbox_min_y <= 102
 bbox_max_y <= 102
 bbox_w <= 102
 bbox_h <= 102
 aspect_ratio_penalty <= 102
 wirelength <= 1.0027008e+07
 -102 <= dx_diff_1_4 <= 102
 -102 <= dy_diff_1_4 <= 102
 -102 <= dx_diff_1_5 <= 102
 -102 <= dy_diff_1_5 <= 102
 -102 <= dx_diff_2_6 <= 102
 -102 <= dy_diff_2_6 <= 102
 -102 <= dx_diff_2_7 <= 102
 -102 <= dy_diff_2_7 <= 102
 -102 <= dx_diff_3_6 <= 102
 -102 <= dy_diff_3_6 <= 102
 -102 <= dx_diff_i_0_2 <= 102
 -102 <= dy_diff_i_0_2 <= 102
 -102 <= dx_diff_j_0_2 <= 102
 -102 <= dy_diff_j_0_2 <= 102
 -102 <= dx_diff_i_0_5 <= 102
 -102 <= dy_diff_i_0_5 <= 102
 -102 <= dx_diff_j_0_5 <= 102
 -102 <= dy_diff_j_0_5 <= 102
 -102 <= dx_diff_i_0_7 <= 102
 -102 <= dy_diff_i_0_7 <= 102
 -102 <= dx_diff_j_0_7 <= 102
 -102 <= dy_diff_j_0_7 <= 102
 -102 <= dx_diff_i_2_3 <= 102
 -102 <= dy_diff_i_2_3 <= 102
 -102 <= dx_diff_j_2_3 <= 102
 -102 <= dy_diff_j_2_3 <= 102
 -102 <= dx_diff_i_4_6 <= 102
 -102 <= dy_diff_i_4_6 <= 102
 -102 <= dx_diff_j_4_6 <= 102
 -102 <= dy_diff_j_4_6 <= 102
 -102 <= dx_diff_i_5_7 <= 102
 -102 <= dy_diff_i_5_7 <= 102
 -102 <= dx_diff_j_5_7 <= 102
 -102 <= dy_diff_j_5_7 <= 102
 -102 <= dx_diff_i_6_7 <= 102
 -102 <= dy_diff_i_6_7 <= 102
 -102 <= dx_diff_j_6_7 <= 102
 -102 <= dy_diff_j_6_7 <= 102
 bbox_area_proxy_t <= 204
Binaries
 r_0 r_1 r_2 r_3 r_4 r_5 r_6 r_7 r_EMIB_0_2 r_EMIB_0_5 r_EMIB_0_7
 r_EMIB_2_3 r_EMIB_4_6 r_EMIB_5_7 r_EMIB_6_7 z1_0_2 z2_0_2 z1L_0_2 z1R_0_2
 z2D_0_2 z2U_0_2 z1_0_5 z2_0_5 z1L_0_5 z1R_0_5 z2D_0_5 z2U_0_5 z1_0_7
 z2_0_7 z1L_0_7 z1R_0_7 z2D_0_7 z2U_0_7 z1_2_3 z2_2_3 z1L_2_3 z1R_2_3
 z2D_2_3 z2U_2_3 z1_4_6 z2_4_6 z1L_4_6 z1R_4_6 z2D_4_6 z2U_4_6 z1_5_7
 z2_5_7 z1L_5_7 z1R_5_7 z2D_5_7 z2U_5_7 z1_6_7 z2_6_7 z1L_6_7 z1R_6_7
 z2D_6_7 z2U_6_7 p_left_0_1 p_right_0_1 p_down_0_1 p_up_0_1 p_left_0_2
 p_right_0_2 p_down_0_2 p_up_0_2 p_left_0_3 p_right_0_3 p_down_0_3 p_up_0_3
 p_left_0_4 p_right_0_4 p_down_0_4 p_up_0_4 p_left_0_5 p_right_0_5
 p_down_0_5 p_up_0_5 p_left_0_6 p_right_0_6 p_down_0_6 p_up_0_6 p_left_0_7
 p_right_0_7 p_down_0_7 p_up_0_7 p_left_1_2 p_right_1_2 p_down_1_2 p_up_1_2
 p_left_1_3 p_right_1_3 p_down_1_3 p_up_1_3 p_left_1_4 p_right_1_4
 p_down_1_4 p_up_1_4 p_left_1_5 p_right_1_5 p_down_1_5 p_up_1_5 p_left_1_6
 p_right_1_6 p_down_1_6 p_up_1_6 p_left_1_7 p_right_1_7 p_down_1_7 p_up_1_7
 p_left_2_3 p_right_2_3 p_down_2_3 p_up_2_3 p_left_2_4 p_right_2_4
 p_down_2_4 p_up_2_4 p_left_2_5 p_right_2_5 p_down_2_5 p_up_2_5 p_left_2_6
 p_right_2_6 p_down_2_6 p_up_2_6 p_left_2_7 p_right_2_7 p_down_2_7 p_up_2_7
 p_left_3_4 p_right_3_4 p_down_3_4 p_up_3_4 p_left_3_5 p_right_3_5
 p_down_3_5 p_up_3_5 p_left_3_6 p_right_3_6 p_down_3_6 p_up_3_6 p_left_3_7
 p_right_3_7 p_down_3_7 p_up_3_7 p_left_4_5 p_right_4_5 p_down_4_5 p_up_4_5
 p_left_4_6 p_right_4_6 p_down_4_6 p_up_4_6 p_left_4_7 p_right_4_7
 p_down_4_7 p_up_4_7 p_left_5_6 p_right_5_6 p_down_5_6 p_up_5_6 p_left_5_7
 p_right_5_7 p_down_5_7 p_up_5_7 p_left_6_7 p_right_6_7 p_down_6_7 p_up_6_7
 p_EMIB_left_0_2_0_5 p_EMIB_right_0_2_0_5 p_EMIB_down_0_2_0_5
 p_EMIB_up_0_2_0_5 p_EMIB_left_0_2_0_7 p_EMIB_right_0_2_0_7
 p_EMIB_down_0_2_0_7 p_EMIB_up_0_2_0_7 p_EMIB_left_0_2_2_3
 p_EMIB_right_0_2_2_3 p_EMIB_down_0_2_2_3 p_EMIB_up_0_2_2_3
 p_EMIB_left_0_5_0_7 p_EMIB_right_0_5_0_7 p_EMIB_down_0_5_0_7
 p_EMIB_up_0_5_0_7 p_EMIB_left_0_5_5_7 p_EMIB_right_0_5_5_7
 p_EMIB_down_0_5_5_7 p_EMIB_up_0_5_5_7 p_EMIB_left_0_7_5_7
 p_EMIB_right_0_7_5_7 p_EMIB_down_0_7_5_7 p_EMIB_up_0_7_5_7
 p_EMIB_left_0_7_6_7 p_EMIB_right_0_7_6_7 p_EMIB_down_0_7_6_7
 p_EMIB_up_0_7_6_7 p_EMIB_left_4_6_6_7 p_EMIB_right_4_6_6_7
 p_EMIB_down_4_6_6_7 p_EMIB_up_4_6_6_7 p_EMIB_left_5_7_6_7
 p_EMIB_right_5_7_6_7 p_EMIB_down_5_7_6_7 p_EMIB_up_5_7_6_7
 dx_abs_1_4_is_positive dy_abs_1_4_is_positive dx_abs_1_5_is_positive
 dy_abs_1_5_is_positive dx_abs_2_6_is_positive dy_abs_2_6_is_positive
 dx_abs_2_7_is_positive dy_abs_2_7_is_positive dx_abs_3_6_is_positive
 dy_abs_3_6_is_positive dx_abs_i_0_2_is_positive dy_abs_i_0_2_is_positive
 dx_abs_j_0_2_is_positive dy_abs_j_0_2_is_positive dx_abs_i_0_5_is_positive
 dy_abs_i_0_5_is_positive dx_abs_j_0_5_is_positive dy_abs_j_0_5_is_positive
 dx_abs_i_0_7_is_positive dy_abs_i_0_7_is_positive dx_abs_j_0_7_is_positive
 dy_abs_j_0_7_is_positive dx_abs_i_2_3_is_positive dy_abs_i_2_3_is_positive
 dx_abs_j_2_3_is_positive dy_abs_j_2_3_is_positive dx_abs_i_4_6_is_positive
 dy_abs_i_4_6_is_positive dx_abs_j_4_6_is_positive dy_abs_j_4_6_is_positive
 dx_abs_i_5_7_is_positive dy_abs_i_5_7_is_positive dx_abs_j_5_7_is_positive
 dy_abs_j_5_7_is_positive dx_abs_i_6_7_is_positive dy_abs_i_6_7_is_positive
 dx_abs_j_6_7_is_positive dy_abs_j_6_7_is_positive
End
