\ Model ChipletPlacementGrid
\ LP format - for model browsing. Use MPS format to capture full model detail.
\ Signature: 0x922159b39211fbcc
Minimize
  0 r_1 + 0 r_4 + 0 r_5 + 0 r_7 + 0 r_10 + 0 r_13
   + 0.00666666666666667 aspect_ratio_penalty
   - 3.6281e-06 power_aware_penalty + 6.19572e-05 wirelength
   + 0.1189577378577216 bbox_area_proxy_t
Subject To
 width_rotation_0: 2 r_0 + w_var_0 = 7
 height_rotation_0: - 2 r_0 + h_var_0 = 5
 x_grid_var_ub_0: w_var_0 + x_grid_var_0 <= 108
 y_grid_var_ub_0: h_var_0 + y_grid_var_0 <= 108
 width_rotation_1: w_var_1 = 5
 height_rotation_1: h_var_1 = 5
 x_grid_var_ub_1: w_var_1 + x_grid_var_1 <= 108
 y_grid_var_ub_1: h_var_1 + y_grid_var_1 <= 108
 width_rotation_2: r_2 + w_var_2 = 6
 height_rotation_2: - r_2 + h_var_2 = 5
 x_grid_var_ub_2: w_var_2 + x_grid_var_2 <= 108
 y_grid_var_ub_2: h_var_2 + y_grid_var_2 <= 108
 width_rotation_3: - r_3 + w_var_3 = 7
 height_rotation_3: r_3 + h_var_3 = 8
 x_grid_var_ub_3: w_var_3 + x_grid_var_3 <= 108
 y_grid_var_ub_3: h_var_3 + y_grid_var_3 <= 108
 width_rotation_4: w_var_4 = 5
 height_rotation_4: h_var_4 = 5
 x_grid_var_ub_4: w_var_4 + x_grid_var_4 <= 108
 y_grid_var_ub_4: h_var_4 + y_grid_var_4 <= 108
 width_rotation_5: w_var_5 = 5
 height_rotation_5: h_var_5 = 5
 x_grid_var_ub_5: w_var_5 + x_grid_var_5 <= 108
 y_grid_var_ub_5: h_var_5 + y_grid_var_5 <= 108
 width_rotation_6: 3 r_6 + w_var_6 = 9
 height_rotation_6: - 3 r_6 + h_var_6 = 6
 x_grid_var_ub_6: w_var_6 + x_grid_var_6 <= 108
 y_grid_var_ub_6: h_var_6 + y_grid_var_6 <= 108
 width_rotation_7: w_var_7 = 8
 height_rotation_7: h_var_7 = 8
 x_grid_var_ub_7: w_var_7 + x_grid_var_7 <= 108
 y_grid_var_ub_7: h_var_7 + y_grid_var_7 <= 108
 width_rotation_8: - 2 r_8 + w_var_8 = 6
 height_rotation_8: 2 r_8 + h_var_8 = 8
 x_grid_var_ub_8: w_var_8 + x_grid_var_8 <= 108
 y_grid_var_ub_8: h_var_8 + y_grid_var_8 <= 108
 width_rotation_9: - r_9 + w_var_9 = 8
 height_rotation_9: r_9 + h_var_9 = 9
 x_grid_var_ub_9: w_var_9 + x_grid_var_9 <= 108
 y_grid_var_ub_9: h_var_9 + y_grid_var_9 <= 108
 width_rotation_10: w_var_10 = 6
 height_rotation_10: h_var_10 = 6
 x_grid_var_ub_10: w_var_10 + x_grid_var_10 <= 108
 y_grid_var_ub_10: h_var_10 + y_grid_var_10 <= 108
 width_rotation_11: - r_11 + w_var_11 = 8
 height_rotation_11: r_11 + h_var_11 = 9
 x_grid_var_ub_11: w_var_11 + x_grid_var_11 <= 108
 y_grid_var_ub_11: h_var_11 + y_grid_var_11 <= 108
 width_rotation_12: 4 r_12 + w_var_12 = 9
 height_rotation_12: - 4 r_12 + h_var_12 = 5
 x_grid_var_ub_12: w_var_12 + x_grid_var_12 <= 108
 y_grid_var_ub_12: h_var_12 + y_grid_var_12 <= 108
 width_rotation_13: w_var_13 = 7
 height_rotation_13: h_var_13 = 7
 x_grid_var_ub_13: w_var_13 + x_grid_var_13 <= 108
 y_grid_var_ub_13: h_var_13 + y_grid_var_13 <= 108
 EMIB_width_rotation_0_3: 1.1467 r_EMIB_0_3 + EMIB_w_var_0_3 = 2
 EMIB_height_rotation_0_3: - 1.1467 r_EMIB_0_3 + EMIB_h_var_0_3 = 0.8533
 EMIB_x_grid_var_ub_0_3: EMIB_w_var_0_3 + EMIB_x_grid_var_0_3 <= 108
 EMIB_y_grid_var_ub_0_3: EMIB_h_var_0_3 + EMIB_y_grid_var_0_3 <= 108
 EMIB_width_rotation_1_7: 1.1467 r_EMIB_1_7 + EMIB_w_var_1_7 = 2
 EMIB_height_rotation_1_7: - 1.1467 r_EMIB_1_7 + EMIB_h_var_1_7 = 0.8533
 EMIB_x_grid_var_ub_1_7: EMIB_w_var_1_7 + EMIB_x_grid_var_1_7 <= 108
 EMIB_y_grid_var_ub_1_7: EMIB_h_var_1_7 + EMIB_y_grid_var_1_7 <= 108
 EMIB_width_rotation_2_11: 1.1467 r_EMIB_2_11 + EMIB_w_var_2_11 = 2
 EMIB_height_rotation_2_11: - 1.1467 r_EMIB_2_11 + EMIB_h_var_2_11
   = 0.8533
 EMIB_x_grid_var_ub_2_11: EMIB_w_var_2_11 + EMIB_x_grid_var_2_11 <= 108
 EMIB_y_grid_var_ub_2_11: EMIB_h_var_2_11 + EMIB_y_grid_var_2_11 <= 108
 EMIB_width_rotation_2_12: 1.1467 r_EMIB_2_12 + EMIB_w_var_2_12 = 2
 EMIB_height_rotation_2_12: - 1.1467 r_EMIB_2_12 + EMIB_h_var_2_12
   = 0.8533
 EMIB_x_grid_var_ub_2_12: EMIB_w_var_2_12 + EMIB_x_grid_var_2_12 <= 108
 EMIB_y_grid_var_ub_2_12: EMIB_h_var_2_12 + EMIB_y_grid_var_2_12 <= 108
 EMIB_width_rotation_3_7: 0.2933 r_EMIB_3_7 + EMIB_w_var_3_7 = 2
 EMIB_height_rotation_3_7: - 0.2933 r_EMIB_3_7 + EMIB_h_var_3_7 = 1.7067
 EMIB_x_grid_var_ub_3_7: EMIB_w_var_3_7 + EMIB_x_grid_var_3_7 <= 108
 EMIB_y_grid_var_ub_3_7: EMIB_h_var_3_7 + EMIB_y_grid_var_3_7 <= 108
 EMIB_width_rotation_3_10: 0.2933 r_EMIB_3_10 + EMIB_w_var_3_10 = 2
 EMIB_height_rotation_3_10: - 0.2933 r_EMIB_3_10 + EMIB_h_var_3_10
   = 1.7067
 EMIB_x_grid_var_ub_3_10: EMIB_w_var_3_10 + EMIB_x_grid_var_3_10 <= 108
 EMIB_y_grid_var_ub_3_10: EMIB_h_var_3_10 + EMIB_y_grid_var_3_10 <= 108
 EMIB_width_rotation_4_6: 1.1467 r_EMIB_4_6 + EMIB_w_var_4_6 = 2
 EMIB_height_rotation_4_6: - 1.1467 r_EMIB_4_6 + EMIB_h_var_4_6 = 0.8533
 EMIB_x_grid_var_ub_4_6: EMIB_w_var_4_6 + EMIB_x_grid_var_4_6 <= 108
 EMIB_y_grid_var_ub_4_6: EMIB_h_var_4_6 + EMIB_y_grid_var_4_6 <= 108
 EMIB_width_rotation_4_8: 1.1467 r_EMIB_4_8 + EMIB_w_var_4_8 = 2
 EMIB_height_rotation_4_8: - 1.1467 r_EMIB_4_8 + EMIB_h_var_4_8 = 0.8533
 EMIB_x_grid_var_ub_4_8: EMIB_w_var_4_8 + EMIB_x_grid_var_4_8 <= 108
 EMIB_y_grid_var_ub_4_8: EMIB_h_var_4_8 + EMIB_y_grid_var_4_8 <= 108
 EMIB_width_rotation_5_13: 1.1467 r_EMIB_5_13 + EMIB_w_var_5_13 = 2
 EMIB_height_rotation_5_13: - 1.1467 r_EMIB_5_13 + EMIB_h_var_5_13
   = 0.8533
 EMIB_x_grid_var_ub_5_13: EMIB_w_var_5_13 + EMIB_x_grid_var_5_13 <= 108
 EMIB_y_grid_var_ub_5_13: EMIB_h_var_5_13 + EMIB_y_grid_var_5_13 <= 108
 EMIB_width_rotation_6_10: 0.2933 r_EMIB_6_10 + EMIB_w_var_6_10 = 2
 EMIB_height_rotation_6_10: - 0.2933 r_EMIB_6_10 + EMIB_h_var_6_10
   = 1.7067
 EMIB_x_grid_var_ub_6_10: EMIB_w_var_6_10 + EMIB_x_grid_var_6_10 <= 108
 EMIB_y_grid_var_ub_6_10: EMIB_h_var_6_10 + EMIB_y_grid_var_6_10 <= 108
 EMIB_width_rotation_7_11: 1.1467 r_EMIB_7_11 + EMIB_w_var_7_11 = 2
 EMIB_height_rotation_7_11: - 1.1467 r_EMIB_7_11 + EMIB_h_var_7_11
   = 0.8533
 EMIB_x_grid_var_ub_7_11: EMIB_w_var_7_11 + EMIB_x_grid_var_7_11 <= 108
 EMIB_y_grid_var_ub_7_11: EMIB_h_var_7_11 + EMIB_y_grid_var_7_11 <= 108
 EMIB_width_rotation_8_12: 0.2933 r_EMIB_8_12 + EMIB_w_var_8_12 = 2
 EMIB_height_rotation_8_12: - 0.2933 r_EMIB_8_12 + EMIB_h_var_8_12
   = 1.7067
 EMIB_x_grid_var_ub_8_12: EMIB_w_var_8_12 + EMIB_x_grid_var_8_12 <= 108
 EMIB_y_grid_var_ub_8_12: EMIB_h_var_8_12 + EMIB_y_grid_var_8_12 <= 108
 EMIB_width_rotation_10_12: 1.1467 r_EMIB_10_12 + EMIB_w_var_10_12 = 2
 EMIB_height_rotation_10_12: - 1.1467 r_EMIB_10_12 + EMIB_h_var_10_12
   = 0.8533
 EMIB_x_grid_var_ub_10_12: EMIB_w_var_10_12 + EMIB_x_grid_var_10_12 <= 108
 EMIB_y_grid_var_ub_10_12: EMIB_h_var_10_12 + EMIB_y_grid_var_10_12 <= 108
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
 cx_def_8: - 0.5 w_var_8 - x_grid_var_8 + cx_grid_var_8 = 0
 cy_def_8: - 0.5 h_var_8 - y_grid_var_8 + cy_grid_var_8 = 0
 cx_def_9: - 0.5 w_var_9 - x_grid_var_9 + cx_grid_var_9 = 0
 cy_def_9: - 0.5 h_var_9 - y_grid_var_9 + cy_grid_var_9 = 0
 cx_def_10: - 0.5 w_var_10 - x_grid_var_10 + cx_grid_var_10 = 0
 cy_def_10: - 0.5 h_var_10 - y_grid_var_10 + cy_grid_var_10 = 0
 cx_def_11: - 0.5 w_var_11 - x_grid_var_11 + cx_grid_var_11 = 0
 cy_def_11: - 0.5 h_var_11 - y_grid_var_11 + cy_grid_var_11 = 0
 cx_def_12: - 0.5 w_var_12 - x_grid_var_12 + cx_grid_var_12 = 0
 cy_def_12: - 0.5 h_var_12 - y_grid_var_12 + cy_grid_var_12 = 0
 cx_def_13: - 0.5 w_var_13 - x_grid_var_13 + cx_grid_var_13 = 0
 cy_def_13: - 0.5 h_var_13 - y_grid_var_13 + cy_grid_var_13 = 0
 EMIB_cx_def_0_3: - 0.5 EMIB_w_var_0_3 - EMIB_x_grid_var_0_3
   + EMIB_cx_grid_var_0_3 = 0
 EMIB_cy_def_0_3: - 0.5 EMIB_h_var_0_3 - EMIB_y_grid_var_0_3
   + EMIB_cy_grid_var_0_3 = 0
 EMIB_cx_def_1_7: - 0.5 EMIB_w_var_1_7 - EMIB_x_grid_var_1_7
   + EMIB_cx_grid_var_1_7 = 0
 EMIB_cy_def_1_7: - 0.5 EMIB_h_var_1_7 - EMIB_y_grid_var_1_7
   + EMIB_cy_grid_var_1_7 = 0
 EMIB_cx_def_2_11: - 0.5 EMIB_w_var_2_11 - EMIB_x_grid_var_2_11
   + EMIB_cx_grid_var_2_11 = 0
 EMIB_cy_def_2_11: - 0.5 EMIB_h_var_2_11 - EMIB_y_grid_var_2_11
   + EMIB_cy_grid_var_2_11 = 0
 EMIB_cx_def_2_12: - 0.5 EMIB_w_var_2_12 - EMIB_x_grid_var_2_12
   + EMIB_cx_grid_var_2_12 = 0
 EMIB_cy_def_2_12: - 0.5 EMIB_h_var_2_12 - EMIB_y_grid_var_2_12
   + EMIB_cy_grid_var_2_12 = 0
 EMIB_cx_def_3_7: - 0.5 EMIB_w_var_3_7 - EMIB_x_grid_var_3_7
   + EMIB_cx_grid_var_3_7 = 0
 EMIB_cy_def_3_7: - 0.5 EMIB_h_var_3_7 - EMIB_y_grid_var_3_7
   + EMIB_cy_grid_var_3_7 = 0
 EMIB_cx_def_3_10: - 0.5 EMIB_w_var_3_10 - EMIB_x_grid_var_3_10
   + EMIB_cx_grid_var_3_10 = 0
 EMIB_cy_def_3_10: - 0.5 EMIB_h_var_3_10 - EMIB_y_grid_var_3_10
   + EMIB_cy_grid_var_3_10 = 0
 EMIB_cx_def_4_6: - 0.5 EMIB_w_var_4_6 - EMIB_x_grid_var_4_6
   + EMIB_cx_grid_var_4_6 = 0
 EMIB_cy_def_4_6: - 0.5 EMIB_h_var_4_6 - EMIB_y_grid_var_4_6
   + EMIB_cy_grid_var_4_6 = 0
 EMIB_cx_def_4_8: - 0.5 EMIB_w_var_4_8 - EMIB_x_grid_var_4_8
   + EMIB_cx_grid_var_4_8 = 0
 EMIB_cy_def_4_8: - 0.5 EMIB_h_var_4_8 - EMIB_y_grid_var_4_8
   + EMIB_cy_grid_var_4_8 = 0
 EMIB_cx_def_5_13: - 0.5 EMIB_w_var_5_13 - EMIB_x_grid_var_5_13
   + EMIB_cx_grid_var_5_13 = 0
 EMIB_cy_def_5_13: - 0.5 EMIB_h_var_5_13 - EMIB_y_grid_var_5_13
   + EMIB_cy_grid_var_5_13 = 0
 EMIB_cx_def_6_10: - 0.5 EMIB_w_var_6_10 - EMIB_x_grid_var_6_10
   + EMIB_cx_grid_var_6_10 = 0
 EMIB_cy_def_6_10: - 0.5 EMIB_h_var_6_10 - EMIB_y_grid_var_6_10
   + EMIB_cy_grid_var_6_10 = 0
 EMIB_cx_def_7_11: - 0.5 EMIB_w_var_7_11 - EMIB_x_grid_var_7_11
   + EMIB_cx_grid_var_7_11 = 0
 EMIB_cy_def_7_11: - 0.5 EMIB_h_var_7_11 - EMIB_y_grid_var_7_11
   + EMIB_cy_grid_var_7_11 = 0
 EMIB_cx_def_8_12: - 0.5 EMIB_w_var_8_12 - EMIB_x_grid_var_8_12
   + EMIB_cx_grid_var_8_12 = 0
 EMIB_cy_def_8_12: - 0.5 EMIB_h_var_8_12 - EMIB_y_grid_var_8_12
   + EMIB_cy_grid_var_8_12 = 0
 EMIB_cx_def_10_12: - 0.5 EMIB_w_var_10_12 - EMIB_x_grid_var_10_12
   + EMIB_cx_grid_var_10_12 = 0
 EMIB_cy_def_10_12: - 0.5 EMIB_h_var_10_12 - EMIB_y_grid_var_10_12
   + EMIB_cy_grid_var_10_12 = 0
 must_adjacent_sb_0_3: z1_0_3 + z2_0_3 = 1
 horizontal_direction_sb_0_3: - z1_0_3 + z1L_0_3 + z1R_0_3 = 0
 vertical_direction_sb_0_3: - z2_0_3 + z2D_0_3 + z2U_0_3 = 0
 EMIB_rotate_eq_z2_0_3: r_EMIB_0_3 - z2_0_3 = 0
 horizontal_left_dist_lb_0_3: - w_var_0 - x_grid_var_0 + x_grid_var_3
   - 216 z1L_0_3 >= -216
 EMIB_left_overlap_0_3: w_var_0 + x_grid_var_0 - EMIB_x_grid_var_0_3
   - 216 z1L_0_3 >= -215.001
 EMIB_right_overlap_0_3: EMIB_w_var_0_3 - x_grid_var_3
   + EMIB_x_grid_var_0_3 - 216 z1L_0_3 >= -215.001
 horizontal_right_dist_lb_0_3: - w_var_3 + x_grid_var_0 - x_grid_var_3
   - 216 z1R_0_3 >= -216
 EMIB_left_overlap_right_0_3: w_var_3 + x_grid_var_3 - EMIB_x_grid_var_0_3
   - 216 z1R_0_3 >= -215.001
 EMIB_right_overlap_right_0_3: EMIB_w_var_0_3 - x_grid_var_0
   + EMIB_x_grid_var_0_3 - 216 z1R_0_3 >= -215.001
 vertical_down_dist_lb_0_3: - h_var_0 - y_grid_var_0 + y_grid_var_3
   - 216 z2D_0_3 >= -216
 EMIB_bottom_overlap_down_0_3: h_var_0 + y_grid_var_0 - EMIB_y_grid_var_0_3
   - 216 z2D_0_3 >= -215.001
 EMIB_top_overlap_down_0_3: EMIB_h_var_0_3 - y_grid_var_3
   + EMIB_y_grid_var_0_3 - 216 z2D_0_3 >= -215.001
 vertical_up_dist_lb_0_3: - h_var_3 + y_grid_var_0 - y_grid_var_3
   - 216 z2U_0_3 >= -216
 EMIB_bottom_overlap_up_0_3: h_var_3 + y_grid_var_3 - EMIB_y_grid_var_0_3
   - 216 z2U_0_3 >= -215.001
 EMIB_top_overlap_up_0_3: EMIB_h_var_0_3 - y_grid_var_0
   + EMIB_y_grid_var_0_3 - 216 z2U_0_3 >= -215.001
 shared_yi_ub1_0_3: h_var_0 - EMIB_h_var_0_3 + y_grid_var_0
   - EMIB_y_grid_var_0_3 - 216 z1_0_3 >= -216
 shared_yi_ub2_0_3: y_grid_var_0 - EMIB_y_grid_var_0_3 + 216 z1_0_3 <= 216
 shared_yj_ub1_0_3: h_var_3 - EMIB_h_var_0_3 + y_grid_var_3
   - EMIB_y_grid_var_0_3 - 216 z1_0_3 >= -216
 shared_yj_ub2_0_3: y_grid_var_3 - EMIB_y_grid_var_0_3 + 216 z1_0_3 <= 216
 shared_xi_ub1_0_3: w_var_0 - EMIB_w_var_0_3 + x_grid_var_0
   - EMIB_x_grid_var_0_3 - 216 z2_0_3 >= -216
 shared_xi_ub2_0_3: x_grid_var_0 - EMIB_x_grid_var_0_3 + 216 z2_0_3 <= 216
 shared_xj_ub1_0_3: w_var_3 - EMIB_w_var_0_3 + x_grid_var_3
   - EMIB_x_grid_var_0_3 - 216 z2_0_3 >= -216
 shared_xj_ub2_0_3: x_grid_var_3 - EMIB_x_grid_var_0_3 + 216 z2_0_3 <= 216
 must_adjacent_sb_1_7: z1_1_7 + z2_1_7 = 1
 horizontal_direction_sb_1_7: - z1_1_7 + z1L_1_7 + z1R_1_7 = 0
 vertical_direction_sb_1_7: - z2_1_7 + z2D_1_7 + z2U_1_7 = 0
 EMIB_rotate_eq_z2_1_7: r_EMIB_1_7 - z2_1_7 = 0
 horizontal_left_dist_lb_1_7: - w_var_1 - x_grid_var_1 + x_grid_var_7
   - 216 z1L_1_7 >= -216
 EMIB_left_overlap_1_7: w_var_1 + x_grid_var_1 - EMIB_x_grid_var_1_7
   - 216 z1L_1_7 >= -215.001
 EMIB_right_overlap_1_7: EMIB_w_var_1_7 - x_grid_var_7
   + EMIB_x_grid_var_1_7 - 216 z1L_1_7 >= -215.001
 horizontal_right_dist_lb_1_7: - w_var_7 + x_grid_var_1 - x_grid_var_7
   - 216 z1R_1_7 >= -216
 EMIB_left_overlap_right_1_7: w_var_7 + x_grid_var_7 - EMIB_x_grid_var_1_7
   - 216 z1R_1_7 >= -215.001
 EMIB_right_overlap_right_1_7: EMIB_w_var_1_7 - x_grid_var_1
   + EMIB_x_grid_var_1_7 - 216 z1R_1_7 >= -215.001
 vertical_down_dist_lb_1_7: - h_var_1 - y_grid_var_1 + y_grid_var_7
   - 216 z2D_1_7 >= -216
 EMIB_bottom_overlap_down_1_7: h_var_1 + y_grid_var_1 - EMIB_y_grid_var_1_7
   - 216 z2D_1_7 >= -215.001
 EMIB_top_overlap_down_1_7: EMIB_h_var_1_7 - y_grid_var_7
   + EMIB_y_grid_var_1_7 - 216 z2D_1_7 >= -215.001
 vertical_up_dist_lb_1_7: - h_var_7 + y_grid_var_1 - y_grid_var_7
   - 216 z2U_1_7 >= -216
 EMIB_bottom_overlap_up_1_7: h_var_7 + y_grid_var_7 - EMIB_y_grid_var_1_7
   - 216 z2U_1_7 >= -215.001
 EMIB_top_overlap_up_1_7: EMIB_h_var_1_7 - y_grid_var_1
   + EMIB_y_grid_var_1_7 - 216 z2U_1_7 >= -215.001
 shared_yi_ub1_1_7: h_var_1 - EMIB_h_var_1_7 + y_grid_var_1
   - EMIB_y_grid_var_1_7 - 216 z1_1_7 >= -216
 shared_yi_ub2_1_7: y_grid_var_1 - EMIB_y_grid_var_1_7 + 216 z1_1_7 <= 216
 shared_yj_ub1_1_7: h_var_7 - EMIB_h_var_1_7 + y_grid_var_7
   - EMIB_y_grid_var_1_7 - 216 z1_1_7 >= -216
 shared_yj_ub2_1_7: y_grid_var_7 - EMIB_y_grid_var_1_7 + 216 z1_1_7 <= 216
 shared_xi_ub1_1_7: w_var_1 - EMIB_w_var_1_7 + x_grid_var_1
   - EMIB_x_grid_var_1_7 - 216 z2_1_7 >= -216
 shared_xi_ub2_1_7: x_grid_var_1 - EMIB_x_grid_var_1_7 + 216 z2_1_7 <= 216
 shared_xj_ub1_1_7: w_var_7 - EMIB_w_var_1_7 + x_grid_var_7
   - EMIB_x_grid_var_1_7 - 216 z2_1_7 >= -216
 shared_xj_ub2_1_7: x_grid_var_7 - EMIB_x_grid_var_1_7 + 216 z2_1_7 <= 216
 must_adjacent_sb_2_11: z1_2_11 + z2_2_11 = 1
 horizontal_direction_sb_2_11: - z1_2_11 + z1L_2_11 + z1R_2_11 = 0
 vertical_direction_sb_2_11: - z2_2_11 + z2D_2_11 + z2U_2_11 = 0
 EMIB_rotate_eq_z2_2_11: r_EMIB_2_11 - z2_2_11 = 0
 horizontal_left_dist_lb_2_11: - w_var_2 - x_grid_var_2 + x_grid_var_11
   - 216 z1L_2_11 >= -216
 EMIB_left_overlap_2_11: w_var_2 + x_grid_var_2 - EMIB_x_grid_var_2_11
   - 216 z1L_2_11 >= -215.001
 EMIB_right_overlap_2_11: EMIB_w_var_2_11 - x_grid_var_11
   + EMIB_x_grid_var_2_11 - 216 z1L_2_11 >= -215.001
 horizontal_right_dist_lb_2_11: - w_var_11 + x_grid_var_2 - x_grid_var_11
   - 216 z1R_2_11 >= -216
 EMIB_left_overlap_right_2_11: w_var_11 + x_grid_var_11
   - EMIB_x_grid_var_2_11 - 216 z1R_2_11 >= -215.001
 EMIB_right_overlap_right_2_11: EMIB_w_var_2_11 - x_grid_var_2
   + EMIB_x_grid_var_2_11 - 216 z1R_2_11 >= -215.001
 vertical_down_dist_lb_2_11: - h_var_2 - y_grid_var_2 + y_grid_var_11
   - 216 z2D_2_11 >= -216
 EMIB_bottom_overlap_down_2_11: h_var_2 + y_grid_var_2
   - EMIB_y_grid_var_2_11 - 216 z2D_2_11 >= -215.001
 EMIB_top_overlap_down_2_11: EMIB_h_var_2_11 - y_grid_var_11
   + EMIB_y_grid_var_2_11 - 216 z2D_2_11 >= -215.001
 vertical_up_dist_lb_2_11: - h_var_11 + y_grid_var_2 - y_grid_var_11
   - 216 z2U_2_11 >= -216
 EMIB_bottom_overlap_up_2_11: h_var_11 + y_grid_var_11
   - EMIB_y_grid_var_2_11 - 216 z2U_2_11 >= -215.001
 EMIB_top_overlap_up_2_11: EMIB_h_var_2_11 - y_grid_var_2
   + EMIB_y_grid_var_2_11 - 216 z2U_2_11 >= -215.001
 shared_yi_ub1_2_11: h_var_2 - EMIB_h_var_2_11 + y_grid_var_2
   - EMIB_y_grid_var_2_11 - 216 z1_2_11 >= -216
 shared_yi_ub2_2_11: y_grid_var_2 - EMIB_y_grid_var_2_11 + 216 z1_2_11
   <= 216
 shared_yj_ub1_2_11: h_var_11 - EMIB_h_var_2_11 + y_grid_var_11
   - EMIB_y_grid_var_2_11 - 216 z1_2_11 >= -216
 shared_yj_ub2_2_11: y_grid_var_11 - EMIB_y_grid_var_2_11 + 216 z1_2_11
   <= 216
 shared_xi_ub1_2_11: w_var_2 - EMIB_w_var_2_11 + x_grid_var_2
   - EMIB_x_grid_var_2_11 - 216 z2_2_11 >= -216
 shared_xi_ub2_2_11: x_grid_var_2 - EMIB_x_grid_var_2_11 + 216 z2_2_11
   <= 216
 shared_xj_ub1_2_11: w_var_11 - EMIB_w_var_2_11 + x_grid_var_11
   - EMIB_x_grid_var_2_11 - 216 z2_2_11 >= -216
 shared_xj_ub2_2_11: x_grid_var_11 - EMIB_x_grid_var_2_11 + 216 z2_2_11
   <= 216
 must_adjacent_sb_2_12: z1_2_12 + z2_2_12 = 1
 horizontal_direction_sb_2_12: - z1_2_12 + z1L_2_12 + z1R_2_12 = 0
 vertical_direction_sb_2_12: - z2_2_12 + z2D_2_12 + z2U_2_12 = 0
 EMIB_rotate_eq_z2_2_12: r_EMIB_2_12 - z2_2_12 = 0
 horizontal_left_dist_lb_2_12: - w_var_2 - x_grid_var_2 + x_grid_var_12
   - 216 z1L_2_12 >= -216
 EMIB_left_overlap_2_12: w_var_2 + x_grid_var_2 - EMIB_x_grid_var_2_12
   - 216 z1L_2_12 >= -215.001
 EMIB_right_overlap_2_12: EMIB_w_var_2_12 - x_grid_var_12
   + EMIB_x_grid_var_2_12 - 216 z1L_2_12 >= -215.001
 horizontal_right_dist_lb_2_12: - w_var_12 + x_grid_var_2 - x_grid_var_12
   - 216 z1R_2_12 >= -216
 EMIB_left_overlap_right_2_12: w_var_12 + x_grid_var_12
   - EMIB_x_grid_var_2_12 - 216 z1R_2_12 >= -215.001
 EMIB_right_overlap_right_2_12: EMIB_w_var_2_12 - x_grid_var_2
   + EMIB_x_grid_var_2_12 - 216 z1R_2_12 >= -215.001
 vertical_down_dist_lb_2_12: - h_var_2 - y_grid_var_2 + y_grid_var_12
   - 216 z2D_2_12 >= -216
 EMIB_bottom_overlap_down_2_12: h_var_2 + y_grid_var_2
   - EMIB_y_grid_var_2_12 - 216 z2D_2_12 >= -215.001
 EMIB_top_overlap_down_2_12: EMIB_h_var_2_12 - y_grid_var_12
   + EMIB_y_grid_var_2_12 - 216 z2D_2_12 >= -215.001
 vertical_up_dist_lb_2_12: - h_var_12 + y_grid_var_2 - y_grid_var_12
   - 216 z2U_2_12 >= -216
 EMIB_bottom_overlap_up_2_12: h_var_12 + y_grid_var_12
   - EMIB_y_grid_var_2_12 - 216 z2U_2_12 >= -215.001
 EMIB_top_overlap_up_2_12: EMIB_h_var_2_12 - y_grid_var_2
   + EMIB_y_grid_var_2_12 - 216 z2U_2_12 >= -215.001
 shared_yi_ub1_2_12: h_var_2 - EMIB_h_var_2_12 + y_grid_var_2
   - EMIB_y_grid_var_2_12 - 216 z1_2_12 >= -216
 shared_yi_ub2_2_12: y_grid_var_2 - EMIB_y_grid_var_2_12 + 216 z1_2_12
   <= 216
 shared_yj_ub1_2_12: h_var_12 - EMIB_h_var_2_12 + y_grid_var_12
   - EMIB_y_grid_var_2_12 - 216 z1_2_12 >= -216
 shared_yj_ub2_2_12: y_grid_var_12 - EMIB_y_grid_var_2_12 + 216 z1_2_12
   <= 216
 shared_xi_ub1_2_12: w_var_2 - EMIB_w_var_2_12 + x_grid_var_2
   - EMIB_x_grid_var_2_12 - 216 z2_2_12 >= -216
 shared_xi_ub2_2_12: x_grid_var_2 - EMIB_x_grid_var_2_12 + 216 z2_2_12
   <= 216
 shared_xj_ub1_2_12: w_var_12 - EMIB_w_var_2_12 + x_grid_var_12
   - EMIB_x_grid_var_2_12 - 216 z2_2_12 >= -216
 shared_xj_ub2_2_12: x_grid_var_12 - EMIB_x_grid_var_2_12 + 216 z2_2_12
   <= 216
 must_adjacent_sb_3_7: z1_3_7 + z2_3_7 = 1
 horizontal_direction_sb_3_7: - z1_3_7 + z1L_3_7 + z1R_3_7 = 0
 vertical_direction_sb_3_7: - z2_3_7 + z2D_3_7 + z2U_3_7 = 0
 EMIB_rotate_eq_z2_3_7: r_EMIB_3_7 - z2_3_7 = 0
 horizontal_left_dist_lb_3_7: - w_var_3 - x_grid_var_3 + x_grid_var_7
   - 216 z1L_3_7 >= -216
 EMIB_left_overlap_3_7: w_var_3 + x_grid_var_3 - EMIB_x_grid_var_3_7
   - 216 z1L_3_7 >= -215.001
 EMIB_right_overlap_3_7: EMIB_w_var_3_7 - x_grid_var_7
   + EMIB_x_grid_var_3_7 - 216 z1L_3_7 >= -215.001
 horizontal_right_dist_lb_3_7: - w_var_7 + x_grid_var_3 - x_grid_var_7
   - 216 z1R_3_7 >= -216
 EMIB_left_overlap_right_3_7: w_var_7 + x_grid_var_7 - EMIB_x_grid_var_3_7
   - 216 z1R_3_7 >= -215.001
 EMIB_right_overlap_right_3_7: EMIB_w_var_3_7 - x_grid_var_3
   + EMIB_x_grid_var_3_7 - 216 z1R_3_7 >= -215.001
 vertical_down_dist_lb_3_7: - h_var_3 - y_grid_var_3 + y_grid_var_7
   - 216 z2D_3_7 >= -216
 EMIB_bottom_overlap_down_3_7: h_var_3 + y_grid_var_3 - EMIB_y_grid_var_3_7
   - 216 z2D_3_7 >= -215.001
 EMIB_top_overlap_down_3_7: EMIB_h_var_3_7 - y_grid_var_7
   + EMIB_y_grid_var_3_7 - 216 z2D_3_7 >= -215.001
 vertical_up_dist_lb_3_7: - h_var_7 + y_grid_var_3 - y_grid_var_7
   - 216 z2U_3_7 >= -216
 EMIB_bottom_overlap_up_3_7: h_var_7 + y_grid_var_7 - EMIB_y_grid_var_3_7
   - 216 z2U_3_7 >= -215.001
 EMIB_top_overlap_up_3_7: EMIB_h_var_3_7 - y_grid_var_3
   + EMIB_y_grid_var_3_7 - 216 z2U_3_7 >= -215.001
 shared_yi_ub1_3_7: h_var_3 - EMIB_h_var_3_7 + y_grid_var_3
   - EMIB_y_grid_var_3_7 - 216 z1_3_7 >= -216
 shared_yi_ub2_3_7: y_grid_var_3 - EMIB_y_grid_var_3_7 + 216 z1_3_7 <= 216
 shared_yj_ub1_3_7: h_var_7 - EMIB_h_var_3_7 + y_grid_var_7
   - EMIB_y_grid_var_3_7 - 216 z1_3_7 >= -216
 shared_yj_ub2_3_7: y_grid_var_7 - EMIB_y_grid_var_3_7 + 216 z1_3_7 <= 216
 shared_xi_ub1_3_7: w_var_3 - EMIB_w_var_3_7 + x_grid_var_3
   - EMIB_x_grid_var_3_7 - 216 z2_3_7 >= -216
 shared_xi_ub2_3_7: x_grid_var_3 - EMIB_x_grid_var_3_7 + 216 z2_3_7 <= 216
 shared_xj_ub1_3_7: w_var_7 - EMIB_w_var_3_7 + x_grid_var_7
   - EMIB_x_grid_var_3_7 - 216 z2_3_7 >= -216
 shared_xj_ub2_3_7: x_grid_var_7 - EMIB_x_grid_var_3_7 + 216 z2_3_7 <= 216
 must_adjacent_sb_3_10: z1_3_10 + z2_3_10 = 1
 horizontal_direction_sb_3_10: - z1_3_10 + z1L_3_10 + z1R_3_10 = 0
 vertical_direction_sb_3_10: - z2_3_10 + z2D_3_10 + z2U_3_10 = 0
 EMIB_rotate_eq_z2_3_10: r_EMIB_3_10 - z2_3_10 = 0
 horizontal_left_dist_lb_3_10: - w_var_3 - x_grid_var_3 + x_grid_var_10
   - 216 z1L_3_10 >= -216
 EMIB_left_overlap_3_10: w_var_3 + x_grid_var_3 - EMIB_x_grid_var_3_10
   - 216 z1L_3_10 >= -215.001
 EMIB_right_overlap_3_10: EMIB_w_var_3_10 - x_grid_var_10
   + EMIB_x_grid_var_3_10 - 216 z1L_3_10 >= -215.001
 horizontal_right_dist_lb_3_10: - w_var_10 + x_grid_var_3 - x_grid_var_10
   - 216 z1R_3_10 >= -216
 EMIB_left_overlap_right_3_10: w_var_10 + x_grid_var_10
   - EMIB_x_grid_var_3_10 - 216 z1R_3_10 >= -215.001
 EMIB_right_overlap_right_3_10: EMIB_w_var_3_10 - x_grid_var_3
   + EMIB_x_grid_var_3_10 - 216 z1R_3_10 >= -215.001
 vertical_down_dist_lb_3_10: - h_var_3 - y_grid_var_3 + y_grid_var_10
   - 216 z2D_3_10 >= -216
 EMIB_bottom_overlap_down_3_10: h_var_3 + y_grid_var_3
   - EMIB_y_grid_var_3_10 - 216 z2D_3_10 >= -215.001
 EMIB_top_overlap_down_3_10: EMIB_h_var_3_10 - y_grid_var_10
   + EMIB_y_grid_var_3_10 - 216 z2D_3_10 >= -215.001
 vertical_up_dist_lb_3_10: - h_var_10 + y_grid_var_3 - y_grid_var_10
   - 216 z2U_3_10 >= -216
 EMIB_bottom_overlap_up_3_10: h_var_10 + y_grid_var_10
   - EMIB_y_grid_var_3_10 - 216 z2U_3_10 >= -215.001
 EMIB_top_overlap_up_3_10: EMIB_h_var_3_10 - y_grid_var_3
   + EMIB_y_grid_var_3_10 - 216 z2U_3_10 >= -215.001
 shared_yi_ub1_3_10: h_var_3 - EMIB_h_var_3_10 + y_grid_var_3
   - EMIB_y_grid_var_3_10 - 216 z1_3_10 >= -216
 shared_yi_ub2_3_10: y_grid_var_3 - EMIB_y_grid_var_3_10 + 216 z1_3_10
   <= 216
 shared_yj_ub1_3_10: h_var_10 - EMIB_h_var_3_10 + y_grid_var_10
   - EMIB_y_grid_var_3_10 - 216 z1_3_10 >= -216
 shared_yj_ub2_3_10: y_grid_var_10 - EMIB_y_grid_var_3_10 + 216 z1_3_10
   <= 216
 shared_xi_ub1_3_10: w_var_3 - EMIB_w_var_3_10 + x_grid_var_3
   - EMIB_x_grid_var_3_10 - 216 z2_3_10 >= -216
 shared_xi_ub2_3_10: x_grid_var_3 - EMIB_x_grid_var_3_10 + 216 z2_3_10
   <= 216
 shared_xj_ub1_3_10: w_var_10 - EMIB_w_var_3_10 + x_grid_var_10
   - EMIB_x_grid_var_3_10 - 216 z2_3_10 >= -216
 shared_xj_ub2_3_10: x_grid_var_10 - EMIB_x_grid_var_3_10 + 216 z2_3_10
   <= 216
 must_adjacent_sb_4_6: z1_4_6 + z2_4_6 = 1
 horizontal_direction_sb_4_6: - z1_4_6 + z1L_4_6 + z1R_4_6 = 0
 vertical_direction_sb_4_6: - z2_4_6 + z2D_4_6 + z2U_4_6 = 0
 EMIB_rotate_eq_z2_4_6: r_EMIB_4_6 - z2_4_6 = 0
 horizontal_left_dist_lb_4_6: - w_var_4 - x_grid_var_4 + x_grid_var_6
   - 216 z1L_4_6 >= -216
 EMIB_left_overlap_4_6: w_var_4 + x_grid_var_4 - EMIB_x_grid_var_4_6
   - 216 z1L_4_6 >= -215.001
 EMIB_right_overlap_4_6: EMIB_w_var_4_6 - x_grid_var_6
   + EMIB_x_grid_var_4_6 - 216 z1L_4_6 >= -215.001
 horizontal_right_dist_lb_4_6: - w_var_6 + x_grid_var_4 - x_grid_var_6
   - 216 z1R_4_6 >= -216
 EMIB_left_overlap_right_4_6: w_var_6 + x_grid_var_6 - EMIB_x_grid_var_4_6
   - 216 z1R_4_6 >= -215.001
 EMIB_right_overlap_right_4_6: EMIB_w_var_4_6 - x_grid_var_4
   + EMIB_x_grid_var_4_6 - 216 z1R_4_6 >= -215.001
 vertical_down_dist_lb_4_6: - h_var_4 - y_grid_var_4 + y_grid_var_6
   - 216 z2D_4_6 >= -216
 EMIB_bottom_overlap_down_4_6: h_var_4 + y_grid_var_4 - EMIB_y_grid_var_4_6
   - 216 z2D_4_6 >= -215.001
 EMIB_top_overlap_down_4_6: EMIB_h_var_4_6 - y_grid_var_6
   + EMIB_y_grid_var_4_6 - 216 z2D_4_6 >= -215.001
 vertical_up_dist_lb_4_6: - h_var_6 + y_grid_var_4 - y_grid_var_6
   - 216 z2U_4_6 >= -216
 EMIB_bottom_overlap_up_4_6: h_var_6 + y_grid_var_6 - EMIB_y_grid_var_4_6
   - 216 z2U_4_6 >= -215.001
 EMIB_top_overlap_up_4_6: EMIB_h_var_4_6 - y_grid_var_4
   + EMIB_y_grid_var_4_6 - 216 z2U_4_6 >= -215.001
 shared_yi_ub1_4_6: h_var_4 - EMIB_h_var_4_6 + y_grid_var_4
   - EMIB_y_grid_var_4_6 - 216 z1_4_6 >= -216
 shared_yi_ub2_4_6: y_grid_var_4 - EMIB_y_grid_var_4_6 + 216 z1_4_6 <= 216
 shared_yj_ub1_4_6: h_var_6 - EMIB_h_var_4_6 + y_grid_var_6
   - EMIB_y_grid_var_4_6 - 216 z1_4_6 >= -216
 shared_yj_ub2_4_6: y_grid_var_6 - EMIB_y_grid_var_4_6 + 216 z1_4_6 <= 216
 shared_xi_ub1_4_6: w_var_4 - EMIB_w_var_4_6 + x_grid_var_4
   - EMIB_x_grid_var_4_6 - 216 z2_4_6 >= -216
 shared_xi_ub2_4_6: x_grid_var_4 - EMIB_x_grid_var_4_6 + 216 z2_4_6 <= 216
 shared_xj_ub1_4_6: w_var_6 - EMIB_w_var_4_6 + x_grid_var_6
   - EMIB_x_grid_var_4_6 - 216 z2_4_6 >= -216
 shared_xj_ub2_4_6: x_grid_var_6 - EMIB_x_grid_var_4_6 + 216 z2_4_6 <= 216
 must_adjacent_sb_4_8: z1_4_8 + z2_4_8 = 1
 horizontal_direction_sb_4_8: - z1_4_8 + z1L_4_8 + z1R_4_8 = 0
 vertical_direction_sb_4_8: - z2_4_8 + z2D_4_8 + z2U_4_8 = 0
 EMIB_rotate_eq_z2_4_8: r_EMIB_4_8 - z2_4_8 = 0
 horizontal_left_dist_lb_4_8: - w_var_4 - x_grid_var_4 + x_grid_var_8
   - 216 z1L_4_8 >= -216
 EMIB_left_overlap_4_8: w_var_4 + x_grid_var_4 - EMIB_x_grid_var_4_8
   - 216 z1L_4_8 >= -215.001
 EMIB_right_overlap_4_8: EMIB_w_var_4_8 - x_grid_var_8
   + EMIB_x_grid_var_4_8 - 216 z1L_4_8 >= -215.001
 horizontal_right_dist_lb_4_8: - w_var_8 + x_grid_var_4 - x_grid_var_8
   - 216 z1R_4_8 >= -216
 EMIB_left_overlap_right_4_8: w_var_8 + x_grid_var_8 - EMIB_x_grid_var_4_8
   - 216 z1R_4_8 >= -215.001
 EMIB_right_overlap_right_4_8: EMIB_w_var_4_8 - x_grid_var_4
   + EMIB_x_grid_var_4_8 - 216 z1R_4_8 >= -215.001
 vertical_down_dist_lb_4_8: - h_var_4 - y_grid_var_4 + y_grid_var_8
   - 216 z2D_4_8 >= -216
 EMIB_bottom_overlap_down_4_8: h_var_4 + y_grid_var_4 - EMIB_y_grid_var_4_8
   - 216 z2D_4_8 >= -215.001
 EMIB_top_overlap_down_4_8: EMIB_h_var_4_8 - y_grid_var_8
   + EMIB_y_grid_var_4_8 - 216 z2D_4_8 >= -215.001
 vertical_up_dist_lb_4_8: - h_var_8 + y_grid_var_4 - y_grid_var_8
   - 216 z2U_4_8 >= -216
 EMIB_bottom_overlap_up_4_8: h_var_8 + y_grid_var_8 - EMIB_y_grid_var_4_8
   - 216 z2U_4_8 >= -215.001
 EMIB_top_overlap_up_4_8: EMIB_h_var_4_8 - y_grid_var_4
   + EMIB_y_grid_var_4_8 - 216 z2U_4_8 >= -215.001
 shared_yi_ub1_4_8: h_var_4 - EMIB_h_var_4_8 + y_grid_var_4
   - EMIB_y_grid_var_4_8 - 216 z1_4_8 >= -216
 shared_yi_ub2_4_8: y_grid_var_4 - EMIB_y_grid_var_4_8 + 216 z1_4_8 <= 216
 shared_yj_ub1_4_8: h_var_8 - EMIB_h_var_4_8 + y_grid_var_8
   - EMIB_y_grid_var_4_8 - 216 z1_4_8 >= -216
 shared_yj_ub2_4_8: y_grid_var_8 - EMIB_y_grid_var_4_8 + 216 z1_4_8 <= 216
 shared_xi_ub1_4_8: w_var_4 - EMIB_w_var_4_8 + x_grid_var_4
   - EMIB_x_grid_var_4_8 - 216 z2_4_8 >= -216
 shared_xi_ub2_4_8: x_grid_var_4 - EMIB_x_grid_var_4_8 + 216 z2_4_8 <= 216
 shared_xj_ub1_4_8: w_var_8 - EMIB_w_var_4_8 + x_grid_var_8
   - EMIB_x_grid_var_4_8 - 216 z2_4_8 >= -216
 shared_xj_ub2_4_8: x_grid_var_8 - EMIB_x_grid_var_4_8 + 216 z2_4_8 <= 216
 must_adjacent_sb_5_13: z1_5_13 + z2_5_13 = 1
 horizontal_direction_sb_5_13: - z1_5_13 + z1L_5_13 + z1R_5_13 = 0
 vertical_direction_sb_5_13: - z2_5_13 + z2D_5_13 + z2U_5_13 = 0
 EMIB_rotate_eq_z2_5_13: r_EMIB_5_13 - z2_5_13 = 0
 horizontal_left_dist_lb_5_13: - w_var_5 - x_grid_var_5 + x_grid_var_13
   - 216 z1L_5_13 >= -216
 EMIB_left_overlap_5_13: w_var_5 + x_grid_var_5 - EMIB_x_grid_var_5_13
   - 216 z1L_5_13 >= -215.001
 EMIB_right_overlap_5_13: EMIB_w_var_5_13 - x_grid_var_13
   + EMIB_x_grid_var_5_13 - 216 z1L_5_13 >= -215.001
 horizontal_right_dist_lb_5_13: - w_var_13 + x_grid_var_5 - x_grid_var_13
   - 216 z1R_5_13 >= -216
 EMIB_left_overlap_right_5_13: w_var_13 + x_grid_var_13
   - EMIB_x_grid_var_5_13 - 216 z1R_5_13 >= -215.001
 EMIB_right_overlap_right_5_13: EMIB_w_var_5_13 - x_grid_var_5
   + EMIB_x_grid_var_5_13 - 216 z1R_5_13 >= -215.001
 vertical_down_dist_lb_5_13: - h_var_5 - y_grid_var_5 + y_grid_var_13
   - 216 z2D_5_13 >= -216
 EMIB_bottom_overlap_down_5_13: h_var_5 + y_grid_var_5
   - EMIB_y_grid_var_5_13 - 216 z2D_5_13 >= -215.001
 EMIB_top_overlap_down_5_13: EMIB_h_var_5_13 - y_grid_var_13
   + EMIB_y_grid_var_5_13 - 216 z2D_5_13 >= -215.001
 vertical_up_dist_lb_5_13: - h_var_13 + y_grid_var_5 - y_grid_var_13
   - 216 z2U_5_13 >= -216
 EMIB_bottom_overlap_up_5_13: h_var_13 + y_grid_var_13
   - EMIB_y_grid_var_5_13 - 216 z2U_5_13 >= -215.001
 EMIB_top_overlap_up_5_13: EMIB_h_var_5_13 - y_grid_var_5
   + EMIB_y_grid_var_5_13 - 216 z2U_5_13 >= -215.001
 shared_yi_ub1_5_13: h_var_5 - EMIB_h_var_5_13 + y_grid_var_5
   - EMIB_y_grid_var_5_13 - 216 z1_5_13 >= -216
 shared_yi_ub2_5_13: y_grid_var_5 - EMIB_y_grid_var_5_13 + 216 z1_5_13
   <= 216
 shared_yj_ub1_5_13: h_var_13 - EMIB_h_var_5_13 + y_grid_var_13
   - EMIB_y_grid_var_5_13 - 216 z1_5_13 >= -216
 shared_yj_ub2_5_13: y_grid_var_13 - EMIB_y_grid_var_5_13 + 216 z1_5_13
   <= 216
 shared_xi_ub1_5_13: w_var_5 - EMIB_w_var_5_13 + x_grid_var_5
   - EMIB_x_grid_var_5_13 - 216 z2_5_13 >= -216
 shared_xi_ub2_5_13: x_grid_var_5 - EMIB_x_grid_var_5_13 + 216 z2_5_13
   <= 216
 shared_xj_ub1_5_13: w_var_13 - EMIB_w_var_5_13 + x_grid_var_13
   - EMIB_x_grid_var_5_13 - 216 z2_5_13 >= -216
 shared_xj_ub2_5_13: x_grid_var_13 - EMIB_x_grid_var_5_13 + 216 z2_5_13
   <= 216
 must_adjacent_sb_6_10: z1_6_10 + z2_6_10 = 1
 horizontal_direction_sb_6_10: - z1_6_10 + z1L_6_10 + z1R_6_10 = 0
 vertical_direction_sb_6_10: - z2_6_10 + z2D_6_10 + z2U_6_10 = 0
 EMIB_rotate_eq_z2_6_10: r_EMIB_6_10 - z2_6_10 = 0
 horizontal_left_dist_lb_6_10: - w_var_6 - x_grid_var_6 + x_grid_var_10
   - 216 z1L_6_10 >= -216
 EMIB_left_overlap_6_10: w_var_6 + x_grid_var_6 - EMIB_x_grid_var_6_10
   - 216 z1L_6_10 >= -215.001
 EMIB_right_overlap_6_10: EMIB_w_var_6_10 - x_grid_var_10
   + EMIB_x_grid_var_6_10 - 216 z1L_6_10 >= -215.001
 horizontal_right_dist_lb_6_10: - w_var_10 + x_grid_var_6 - x_grid_var_10
   - 216 z1R_6_10 >= -216
 EMIB_left_overlap_right_6_10: w_var_10 + x_grid_var_10
   - EMIB_x_grid_var_6_10 - 216 z1R_6_10 >= -215.001
 EMIB_right_overlap_right_6_10: EMIB_w_var_6_10 - x_grid_var_6
   + EMIB_x_grid_var_6_10 - 216 z1R_6_10 >= -215.001
 vertical_down_dist_lb_6_10: - h_var_6 - y_grid_var_6 + y_grid_var_10
   - 216 z2D_6_10 >= -216
 EMIB_bottom_overlap_down_6_10: h_var_6 + y_grid_var_6
   - EMIB_y_grid_var_6_10 - 216 z2D_6_10 >= -215.001
 EMIB_top_overlap_down_6_10: EMIB_h_var_6_10 - y_grid_var_10
   + EMIB_y_grid_var_6_10 - 216 z2D_6_10 >= -215.001
 vertical_up_dist_lb_6_10: - h_var_10 + y_grid_var_6 - y_grid_var_10
   - 216 z2U_6_10 >= -216
 EMIB_bottom_overlap_up_6_10: h_var_10 + y_grid_var_10
   - EMIB_y_grid_var_6_10 - 216 z2U_6_10 >= -215.001
 EMIB_top_overlap_up_6_10: EMIB_h_var_6_10 - y_grid_var_6
   + EMIB_y_grid_var_6_10 - 216 z2U_6_10 >= -215.001
 shared_yi_ub1_6_10: h_var_6 - EMIB_h_var_6_10 + y_grid_var_6
   - EMIB_y_grid_var_6_10 - 216 z1_6_10 >= -216
 shared_yi_ub2_6_10: y_grid_var_6 - EMIB_y_grid_var_6_10 + 216 z1_6_10
   <= 216
 shared_yj_ub1_6_10: h_var_10 - EMIB_h_var_6_10 + y_grid_var_10
   - EMIB_y_grid_var_6_10 - 216 z1_6_10 >= -216
 shared_yj_ub2_6_10: y_grid_var_10 - EMIB_y_grid_var_6_10 + 216 z1_6_10
   <= 216
 shared_xi_ub1_6_10: w_var_6 - EMIB_w_var_6_10 + x_grid_var_6
   - EMIB_x_grid_var_6_10 - 216 z2_6_10 >= -216
 shared_xi_ub2_6_10: x_grid_var_6 - EMIB_x_grid_var_6_10 + 216 z2_6_10
   <= 216
 shared_xj_ub1_6_10: w_var_10 - EMIB_w_var_6_10 + x_grid_var_10
   - EMIB_x_grid_var_6_10 - 216 z2_6_10 >= -216
 shared_xj_ub2_6_10: x_grid_var_10 - EMIB_x_grid_var_6_10 + 216 z2_6_10
   <= 216
 must_adjacent_sb_7_11: z1_7_11 + z2_7_11 = 1
 horizontal_direction_sb_7_11: - z1_7_11 + z1L_7_11 + z1R_7_11 = 0
 vertical_direction_sb_7_11: - z2_7_11 + z2D_7_11 + z2U_7_11 = 0
 EMIB_rotate_eq_z2_7_11: r_EMIB_7_11 - z2_7_11 = 0
 horizontal_left_dist_lb_7_11: - w_var_7 - x_grid_var_7 + x_grid_var_11
   - 216 z1L_7_11 >= -216
 EMIB_left_overlap_7_11: w_var_7 + x_grid_var_7 - EMIB_x_grid_var_7_11
   - 216 z1L_7_11 >= -215.001
 EMIB_right_overlap_7_11: EMIB_w_var_7_11 - x_grid_var_11
   + EMIB_x_grid_var_7_11 - 216 z1L_7_11 >= -215.001
 horizontal_right_dist_lb_7_11: - w_var_11 + x_grid_var_7 - x_grid_var_11
   - 216 z1R_7_11 >= -216
 EMIB_left_overlap_right_7_11: w_var_11 + x_grid_var_11
   - EMIB_x_grid_var_7_11 - 216 z1R_7_11 >= -215.001
 EMIB_right_overlap_right_7_11: EMIB_w_var_7_11 - x_grid_var_7
   + EMIB_x_grid_var_7_11 - 216 z1R_7_11 >= -215.001
 vertical_down_dist_lb_7_11: - h_var_7 - y_grid_var_7 + y_grid_var_11
   - 216 z2D_7_11 >= -216
 EMIB_bottom_overlap_down_7_11: h_var_7 + y_grid_var_7
   - EMIB_y_grid_var_7_11 - 216 z2D_7_11 >= -215.001
 EMIB_top_overlap_down_7_11: EMIB_h_var_7_11 - y_grid_var_11
   + EMIB_y_grid_var_7_11 - 216 z2D_7_11 >= -215.001
 vertical_up_dist_lb_7_11: - h_var_11 + y_grid_var_7 - y_grid_var_11
   - 216 z2U_7_11 >= -216
 EMIB_bottom_overlap_up_7_11: h_var_11 + y_grid_var_11
   - EMIB_y_grid_var_7_11 - 216 z2U_7_11 >= -215.001
 EMIB_top_overlap_up_7_11: EMIB_h_var_7_11 - y_grid_var_7
   + EMIB_y_grid_var_7_11 - 216 z2U_7_11 >= -215.001
 shared_yi_ub1_7_11: h_var_7 - EMIB_h_var_7_11 + y_grid_var_7
   - EMIB_y_grid_var_7_11 - 216 z1_7_11 >= -216
 shared_yi_ub2_7_11: y_grid_var_7 - EMIB_y_grid_var_7_11 + 216 z1_7_11
   <= 216
 shared_yj_ub1_7_11: h_var_11 - EMIB_h_var_7_11 + y_grid_var_11
   - EMIB_y_grid_var_7_11 - 216 z1_7_11 >= -216
 shared_yj_ub2_7_11: y_grid_var_11 - EMIB_y_grid_var_7_11 + 216 z1_7_11
   <= 216
 shared_xi_ub1_7_11: w_var_7 - EMIB_w_var_7_11 + x_grid_var_7
   - EMIB_x_grid_var_7_11 - 216 z2_7_11 >= -216
 shared_xi_ub2_7_11: x_grid_var_7 - EMIB_x_grid_var_7_11 + 216 z2_7_11
   <= 216
 shared_xj_ub1_7_11: w_var_11 - EMIB_w_var_7_11 + x_grid_var_11
   - EMIB_x_grid_var_7_11 - 216 z2_7_11 >= -216
 shared_xj_ub2_7_11: x_grid_var_11 - EMIB_x_grid_var_7_11 + 216 z2_7_11
   <= 216
 must_adjacent_sb_8_12: z1_8_12 + z2_8_12 = 1
 horizontal_direction_sb_8_12: - z1_8_12 + z1L_8_12 + z1R_8_12 = 0
 vertical_direction_sb_8_12: - z2_8_12 + z2D_8_12 + z2U_8_12 = 0
 EMIB_rotate_eq_z2_8_12: r_EMIB_8_12 - z2_8_12 = 0
 horizontal_left_dist_lb_8_12: - w_var_8 - x_grid_var_8 + x_grid_var_12
   - 216 z1L_8_12 >= -216
 EMIB_left_overlap_8_12: w_var_8 + x_grid_var_8 - EMIB_x_grid_var_8_12
   - 216 z1L_8_12 >= -215.001
 EMIB_right_overlap_8_12: EMIB_w_var_8_12 - x_grid_var_12
   + EMIB_x_grid_var_8_12 - 216 z1L_8_12 >= -215.001
 horizontal_right_dist_lb_8_12: - w_var_12 + x_grid_var_8 - x_grid_var_12
   - 216 z1R_8_12 >= -216
 EMIB_left_overlap_right_8_12: w_var_12 + x_grid_var_12
   - EMIB_x_grid_var_8_12 - 216 z1R_8_12 >= -215.001
 EMIB_right_overlap_right_8_12: EMIB_w_var_8_12 - x_grid_var_8
   + EMIB_x_grid_var_8_12 - 216 z1R_8_12 >= -215.001
 vertical_down_dist_lb_8_12: - h_var_8 - y_grid_var_8 + y_grid_var_12
   - 216 z2D_8_12 >= -216
 EMIB_bottom_overlap_down_8_12: h_var_8 + y_grid_var_8
   - EMIB_y_grid_var_8_12 - 216 z2D_8_12 >= -215.001
 EMIB_top_overlap_down_8_12: EMIB_h_var_8_12 - y_grid_var_12
   + EMIB_y_grid_var_8_12 - 216 z2D_8_12 >= -215.001
 vertical_up_dist_lb_8_12: - h_var_12 + y_grid_var_8 - y_grid_var_12
   - 216 z2U_8_12 >= -216
 EMIB_bottom_overlap_up_8_12: h_var_12 + y_grid_var_12
   - EMIB_y_grid_var_8_12 - 216 z2U_8_12 >= -215.001
 EMIB_top_overlap_up_8_12: EMIB_h_var_8_12 - y_grid_var_8
   + EMIB_y_grid_var_8_12 - 216 z2U_8_12 >= -215.001
 shared_yi_ub1_8_12: h_var_8 - EMIB_h_var_8_12 + y_grid_var_8
   - EMIB_y_grid_var_8_12 - 216 z1_8_12 >= -216
 shared_yi_ub2_8_12: y_grid_var_8 - EMIB_y_grid_var_8_12 + 216 z1_8_12
   <= 216
 shared_yj_ub1_8_12: h_var_12 - EMIB_h_var_8_12 + y_grid_var_12
   - EMIB_y_grid_var_8_12 - 216 z1_8_12 >= -216
 shared_yj_ub2_8_12: y_grid_var_12 - EMIB_y_grid_var_8_12 + 216 z1_8_12
   <= 216
 shared_xi_ub1_8_12: w_var_8 - EMIB_w_var_8_12 + x_grid_var_8
   - EMIB_x_grid_var_8_12 - 216 z2_8_12 >= -216
 shared_xi_ub2_8_12: x_grid_var_8 - EMIB_x_grid_var_8_12 + 216 z2_8_12
   <= 216
 shared_xj_ub1_8_12: w_var_12 - EMIB_w_var_8_12 + x_grid_var_12
   - EMIB_x_grid_var_8_12 - 216 z2_8_12 >= -216
 shared_xj_ub2_8_12: x_grid_var_12 - EMIB_x_grid_var_8_12 + 216 z2_8_12
   <= 216
 must_adjacent_sb_10_12: z1_10_12 + z2_10_12 = 1
 horizontal_direction_sb_10_12: - z1_10_12 + z1L_10_12 + z1R_10_12 = 0
 vertical_direction_sb_10_12: - z2_10_12 + z2D_10_12 + z2U_10_12 = 0
 EMIB_rotate_eq_z2_10_12: r_EMIB_10_12 - z2_10_12 = 0
 horizontal_left_dist_lb_10_12: - w_var_10 - x_grid_var_10 + x_grid_var_12
   - 216 z1L_10_12 >= -216
 EMIB_left_overlap_10_12: w_var_10 + x_grid_var_10 - EMIB_x_grid_var_10_12
   - 216 z1L_10_12 >= -215.001
 EMIB_right_overlap_10_12: EMIB_w_var_10_12 - x_grid_var_12
   + EMIB_x_grid_var_10_12 - 216 z1L_10_12 >= -215.001
 horizontal_right_dist_lb_10_12: - w_var_12 + x_grid_var_10 - x_grid_var_12
   - 216 z1R_10_12 >= -216
 EMIB_left_overlap_right_10_12: w_var_12 + x_grid_var_12
   - EMIB_x_grid_var_10_12 - 216 z1R_10_12 >= -215.001
 EMIB_right_overlap_right_10_12: EMIB_w_var_10_12 - x_grid_var_10
   + EMIB_x_grid_var_10_12 - 216 z1R_10_12 >= -215.001
 vertical_down_dist_lb_10_12: - h_var_10 - y_grid_var_10 + y_grid_var_12
   - 216 z2D_10_12 >= -216
 EMIB_bottom_overlap_down_10_12: h_var_10 + y_grid_var_10
   - EMIB_y_grid_var_10_12 - 216 z2D_10_12 >= -215.001
 EMIB_top_overlap_down_10_12: EMIB_h_var_10_12 - y_grid_var_12
   + EMIB_y_grid_var_10_12 - 216 z2D_10_12 >= -215.001
 vertical_up_dist_lb_10_12: - h_var_12 + y_grid_var_10 - y_grid_var_12
   - 216 z2U_10_12 >= -216
 EMIB_bottom_overlap_up_10_12: h_var_12 + y_grid_var_12
   - EMIB_y_grid_var_10_12 - 216 z2U_10_12 >= -215.001
 EMIB_top_overlap_up_10_12: EMIB_h_var_10_12 - y_grid_var_10
   + EMIB_y_grid_var_10_12 - 216 z2U_10_12 >= -215.001
 shared_yi_ub1_10_12: h_var_10 - EMIB_h_var_10_12 + y_grid_var_10
   - EMIB_y_grid_var_10_12 - 216 z1_10_12 >= -216
 shared_yi_ub2_10_12: y_grid_var_10 - EMIB_y_grid_var_10_12 + 216 z1_10_12
   <= 216
 shared_yj_ub1_10_12: h_var_12 - EMIB_h_var_10_12 + y_grid_var_12
   - EMIB_y_grid_var_10_12 - 216 z1_10_12 >= -216
 shared_yj_ub2_10_12: y_grid_var_12 - EMIB_y_grid_var_10_12 + 216 z1_10_12
   <= 216
 shared_xi_ub1_10_12: w_var_10 - EMIB_w_var_10_12 + x_grid_var_10
   - EMIB_x_grid_var_10_12 - 216 z2_10_12 >= -216
 shared_xi_ub2_10_12: x_grid_var_10 - EMIB_x_grid_var_10_12 + 216 z2_10_12
   <= 216
 shared_xj_ub1_10_12: w_var_12 - EMIB_w_var_10_12 + x_grid_var_12
   - EMIB_x_grid_var_10_12 - 216 z2_10_12 >= -216
 shared_xj_ub2_10_12: x_grid_var_12 - EMIB_x_grid_var_10_12 + 216 z2_10_12
   <= 216
 non_overlap_any_0_1: p_left_0_1 + p_right_0_1 + p_down_0_1 + p_up_0_1
   >= 1
 non_overlap_left_0_1: w_var_0 + x_grid_var_0 - x_grid_var_1
   + 216 p_left_0_1 <= 216
 non_overlap_left_rev_0_1: - w_var_0 - x_grid_var_0 + x_grid_var_1
   - 216 p_left_0_1 <= 0
 non_overlap_right_0_1: w_var_1 - x_grid_var_0 + x_grid_var_1
   + 216 p_right_0_1 <= 216
 non_overlap_right_rev_0_1: - w_var_1 + x_grid_var_0 - x_grid_var_1
   - 216 p_right_0_1 <= 0
 non_overlap_down_0_1: h_var_0 + y_grid_var_0 - y_grid_var_1
   + 216 p_down_0_1 <= 216
 non_overlap_down_rev_0_1: - h_var_0 - y_grid_var_0 + y_grid_var_1
   - 216 p_down_0_1 <= 0
 non_overlap_up_0_1: h_var_1 - y_grid_var_0 + y_grid_var_1 + 216 p_up_0_1
   <= 216
 non_overlap_up_rev_0_1: - h_var_1 + y_grid_var_0 - y_grid_var_1
   - 216 p_up_0_1 <= 0
 non_overlap_any_0_2: p_left_0_2 + p_right_0_2 + p_down_0_2 + p_up_0_2
   >= 1
 non_overlap_left_0_2: w_var_0 + x_grid_var_0 - x_grid_var_2
   + 216 p_left_0_2 <= 216
 non_overlap_left_rev_0_2: - w_var_0 - x_grid_var_0 + x_grid_var_2
   - 216 p_left_0_2 <= 0
 non_overlap_right_0_2: w_var_2 - x_grid_var_0 + x_grid_var_2
   + 216 p_right_0_2 <= 216
 non_overlap_right_rev_0_2: - w_var_2 + x_grid_var_0 - x_grid_var_2
   - 216 p_right_0_2 <= 0
 non_overlap_down_0_2: h_var_0 + y_grid_var_0 - y_grid_var_2
   + 216 p_down_0_2 <= 216
 non_overlap_down_rev_0_2: - h_var_0 - y_grid_var_0 + y_grid_var_2
   - 216 p_down_0_2 <= 0
 non_overlap_up_0_2: h_var_2 - y_grid_var_0 + y_grid_var_2 + 216 p_up_0_2
   <= 216
 non_overlap_up_rev_0_2: - h_var_2 + y_grid_var_0 - y_grid_var_2
   - 216 p_up_0_2 <= 0
 non_overlap_any_0_3: p_left_0_3 + p_right_0_3 + p_down_0_3 + p_up_0_3
   >= 1
 non_overlap_left_0_3: w_var_0 + x_grid_var_0 - x_grid_var_3
   + 216 p_left_0_3 <= 216
 non_overlap_left_rev_0_3: - w_var_0 - x_grid_var_0 + x_grid_var_3
   - 216 p_left_0_3 <= 0
 non_overlap_right_0_3: w_var_3 - x_grid_var_0 + x_grid_var_3
   + 216 p_right_0_3 <= 216
 non_overlap_right_rev_0_3: - w_var_3 + x_grid_var_0 - x_grid_var_3
   - 216 p_right_0_3 <= 0
 non_overlap_down_0_3: h_var_0 + y_grid_var_0 - y_grid_var_3
   + 216 p_down_0_3 <= 216
 non_overlap_down_rev_0_3: - h_var_0 - y_grid_var_0 + y_grid_var_3
   - 216 p_down_0_3 <= 0
 non_overlap_up_0_3: h_var_3 - y_grid_var_0 + y_grid_var_3 + 216 p_up_0_3
   <= 216
 non_overlap_up_rev_0_3: - h_var_3 + y_grid_var_0 - y_grid_var_3
   - 216 p_up_0_3 <= 0
 non_overlap_any_0_4: p_left_0_4 + p_right_0_4 + p_down_0_4 + p_up_0_4
   >= 1
 non_overlap_left_0_4: w_var_0 + x_grid_var_0 - x_grid_var_4
   + 216 p_left_0_4 <= 216
 non_overlap_left_rev_0_4: - w_var_0 - x_grid_var_0 + x_grid_var_4
   - 216 p_left_0_4 <= 0
 non_overlap_right_0_4: w_var_4 - x_grid_var_0 + x_grid_var_4
   + 216 p_right_0_4 <= 216
 non_overlap_right_rev_0_4: - w_var_4 + x_grid_var_0 - x_grid_var_4
   - 216 p_right_0_4 <= 0
 non_overlap_down_0_4: h_var_0 + y_grid_var_0 - y_grid_var_4
   + 216 p_down_0_4 <= 216
 non_overlap_down_rev_0_4: - h_var_0 - y_grid_var_0 + y_grid_var_4
   - 216 p_down_0_4 <= 0
 non_overlap_up_0_4: h_var_4 - y_grid_var_0 + y_grid_var_4 + 216 p_up_0_4
   <= 216
 non_overlap_up_rev_0_4: - h_var_4 + y_grid_var_0 - y_grid_var_4
   - 216 p_up_0_4 <= 0
 non_overlap_any_0_5: p_left_0_5 + p_right_0_5 + p_down_0_5 + p_up_0_5
   >= 1
 non_overlap_left_0_5: w_var_0 + x_grid_var_0 - x_grid_var_5
   + 216 p_left_0_5 <= 216
 non_overlap_left_rev_0_5: - w_var_0 - x_grid_var_0 + x_grid_var_5
   - 216 p_left_0_5 <= 0
 non_overlap_right_0_5: w_var_5 - x_grid_var_0 + x_grid_var_5
   + 216 p_right_0_5 <= 216
 non_overlap_right_rev_0_5: - w_var_5 + x_grid_var_0 - x_grid_var_5
   - 216 p_right_0_5 <= 0
 non_overlap_down_0_5: h_var_0 + y_grid_var_0 - y_grid_var_5
   + 216 p_down_0_5 <= 216
 non_overlap_down_rev_0_5: - h_var_0 - y_grid_var_0 + y_grid_var_5
   - 216 p_down_0_5 <= 0
 non_overlap_up_0_5: h_var_5 - y_grid_var_0 + y_grid_var_5 + 216 p_up_0_5
   <= 216
 non_overlap_up_rev_0_5: - h_var_5 + y_grid_var_0 - y_grid_var_5
   - 216 p_up_0_5 <= 0
 non_overlap_any_0_6: p_left_0_6 + p_right_0_6 + p_down_0_6 + p_up_0_6
   >= 1
 non_overlap_left_0_6: w_var_0 + x_grid_var_0 - x_grid_var_6
   + 216 p_left_0_6 <= 216
 non_overlap_left_rev_0_6: - w_var_0 - x_grid_var_0 + x_grid_var_6
   - 216 p_left_0_6 <= 0
 non_overlap_right_0_6: w_var_6 - x_grid_var_0 + x_grid_var_6
   + 216 p_right_0_6 <= 216
 non_overlap_right_rev_0_6: - w_var_6 + x_grid_var_0 - x_grid_var_6
   - 216 p_right_0_6 <= 0
 non_overlap_down_0_6: h_var_0 + y_grid_var_0 - y_grid_var_6
   + 216 p_down_0_6 <= 216
 non_overlap_down_rev_0_6: - h_var_0 - y_grid_var_0 + y_grid_var_6
   - 216 p_down_0_6 <= 0
 non_overlap_up_0_6: h_var_6 - y_grid_var_0 + y_grid_var_6 + 216 p_up_0_6
   <= 216
 non_overlap_up_rev_0_6: - h_var_6 + y_grid_var_0 - y_grid_var_6
   - 216 p_up_0_6 <= 0
 non_overlap_any_0_7: p_left_0_7 + p_right_0_7 + p_down_0_7 + p_up_0_7
   >= 1
 non_overlap_left_0_7: w_var_0 + x_grid_var_0 - x_grid_var_7
   + 216 p_left_0_7 <= 216
 non_overlap_left_rev_0_7: - w_var_0 - x_grid_var_0 + x_grid_var_7
   - 216 p_left_0_7 <= 0
 non_overlap_right_0_7: w_var_7 - x_grid_var_0 + x_grid_var_7
   + 216 p_right_0_7 <= 216
 non_overlap_right_rev_0_7: - w_var_7 + x_grid_var_0 - x_grid_var_7
   - 216 p_right_0_7 <= 0
 non_overlap_down_0_7: h_var_0 + y_grid_var_0 - y_grid_var_7
   + 216 p_down_0_7 <= 216
 non_overlap_down_rev_0_7: - h_var_0 - y_grid_var_0 + y_grid_var_7
   - 216 p_down_0_7 <= 0
 non_overlap_up_0_7: h_var_7 - y_grid_var_0 + y_grid_var_7 + 216 p_up_0_7
   <= 216
 non_overlap_up_rev_0_7: - h_var_7 + y_grid_var_0 - y_grid_var_7
   - 216 p_up_0_7 <= 0
 non_overlap_any_0_8: p_left_0_8 + p_right_0_8 + p_down_0_8 + p_up_0_8
   >= 1
 non_overlap_left_0_8: w_var_0 + x_grid_var_0 - x_grid_var_8
   + 216 p_left_0_8 <= 216
 non_overlap_left_rev_0_8: - w_var_0 - x_grid_var_0 + x_grid_var_8
   - 216 p_left_0_8 <= 0
 non_overlap_right_0_8: w_var_8 - x_grid_var_0 + x_grid_var_8
   + 216 p_right_0_8 <= 216
 non_overlap_right_rev_0_8: - w_var_8 + x_grid_var_0 - x_grid_var_8
   - 216 p_right_0_8 <= 0
 non_overlap_down_0_8: h_var_0 + y_grid_var_0 - y_grid_var_8
   + 216 p_down_0_8 <= 216
 non_overlap_down_rev_0_8: - h_var_0 - y_grid_var_0 + y_grid_var_8
   - 216 p_down_0_8 <= 0
 non_overlap_up_0_8: h_var_8 - y_grid_var_0 + y_grid_var_8 + 216 p_up_0_8
   <= 216
 non_overlap_up_rev_0_8: - h_var_8 + y_grid_var_0 - y_grid_var_8
   - 216 p_up_0_8 <= 0
 non_overlap_any_0_9: p_left_0_9 + p_right_0_9 + p_down_0_9 + p_up_0_9
   >= 1
 non_overlap_left_0_9: w_var_0 + x_grid_var_0 - x_grid_var_9
   + 216 p_left_0_9 <= 216
 non_overlap_left_rev_0_9: - w_var_0 - x_grid_var_0 + x_grid_var_9
   - 216 p_left_0_9 <= 0
 non_overlap_right_0_9: w_var_9 - x_grid_var_0 + x_grid_var_9
   + 216 p_right_0_9 <= 216
 non_overlap_right_rev_0_9: - w_var_9 + x_grid_var_0 - x_grid_var_9
   - 216 p_right_0_9 <= 0
 non_overlap_down_0_9: h_var_0 + y_grid_var_0 - y_grid_var_9
   + 216 p_down_0_9 <= 216
 non_overlap_down_rev_0_9: - h_var_0 - y_grid_var_0 + y_grid_var_9
   - 216 p_down_0_9 <= 0
 non_overlap_up_0_9: h_var_9 - y_grid_var_0 + y_grid_var_9 + 216 p_up_0_9
   <= 216
 non_overlap_up_rev_0_9: - h_var_9 + y_grid_var_0 - y_grid_var_9
   - 216 p_up_0_9 <= 0
 non_overlap_any_0_10: p_left_0_10 + p_right_0_10 + p_down_0_10 + p_up_0_10
   >= 1
 non_overlap_left_0_10: w_var_0 + x_grid_var_0 - x_grid_var_10
   + 216 p_left_0_10 <= 216
 non_overlap_left_rev_0_10: - w_var_0 - x_grid_var_0 + x_grid_var_10
   - 216 p_left_0_10 <= 0
 non_overlap_right_0_10: w_var_10 - x_grid_var_0 + x_grid_var_10
   + 216 p_right_0_10 <= 216
 non_overlap_right_rev_0_10: - w_var_10 + x_grid_var_0 - x_grid_var_10
   - 216 p_right_0_10 <= 0
 non_overlap_down_0_10: h_var_0 + y_grid_var_0 - y_grid_var_10
   + 216 p_down_0_10 <= 216
 non_overlap_down_rev_0_10: - h_var_0 - y_grid_var_0 + y_grid_var_10
   - 216 p_down_0_10 <= 0
 non_overlap_up_0_10: h_var_10 - y_grid_var_0 + y_grid_var_10
   + 216 p_up_0_10 <= 216
 non_overlap_up_rev_0_10: - h_var_10 + y_grid_var_0 - y_grid_var_10
   - 216 p_up_0_10 <= 0
 non_overlap_any_0_11: p_left_0_11 + p_right_0_11 + p_down_0_11 + p_up_0_11
   >= 1
 non_overlap_left_0_11: w_var_0 + x_grid_var_0 - x_grid_var_11
   + 216 p_left_0_11 <= 216
 non_overlap_left_rev_0_11: - w_var_0 - x_grid_var_0 + x_grid_var_11
   - 216 p_left_0_11 <= 0
 non_overlap_right_0_11: w_var_11 - x_grid_var_0 + x_grid_var_11
   + 216 p_right_0_11 <= 216
 non_overlap_right_rev_0_11: - w_var_11 + x_grid_var_0 - x_grid_var_11
   - 216 p_right_0_11 <= 0
 non_overlap_down_0_11: h_var_0 + y_grid_var_0 - y_grid_var_11
   + 216 p_down_0_11 <= 216
 non_overlap_down_rev_0_11: - h_var_0 - y_grid_var_0 + y_grid_var_11
   - 216 p_down_0_11 <= 0
 non_overlap_up_0_11: h_var_11 - y_grid_var_0 + y_grid_var_11
   + 216 p_up_0_11 <= 216
 non_overlap_up_rev_0_11: - h_var_11 + y_grid_var_0 - y_grid_var_11
   - 216 p_up_0_11 <= 0
 non_overlap_any_0_12: p_left_0_12 + p_right_0_12 + p_down_0_12 + p_up_0_12
   >= 1
 non_overlap_left_0_12: w_var_0 + x_grid_var_0 - x_grid_var_12
   + 216 p_left_0_12 <= 216
 non_overlap_left_rev_0_12: - w_var_0 - x_grid_var_0 + x_grid_var_12
   - 216 p_left_0_12 <= 0
 non_overlap_right_0_12: w_var_12 - x_grid_var_0 + x_grid_var_12
   + 216 p_right_0_12 <= 216
 non_overlap_right_rev_0_12: - w_var_12 + x_grid_var_0 - x_grid_var_12
   - 216 p_right_0_12 <= 0
 non_overlap_down_0_12: h_var_0 + y_grid_var_0 - y_grid_var_12
   + 216 p_down_0_12 <= 216
 non_overlap_down_rev_0_12: - h_var_0 - y_grid_var_0 + y_grid_var_12
   - 216 p_down_0_12 <= 0
 non_overlap_up_0_12: h_var_12 - y_grid_var_0 + y_grid_var_12
   + 216 p_up_0_12 <= 216
 non_overlap_up_rev_0_12: - h_var_12 + y_grid_var_0 - y_grid_var_12
   - 216 p_up_0_12 <= 0
 non_overlap_any_0_13: p_left_0_13 + p_right_0_13 + p_down_0_13 + p_up_0_13
   >= 1
 non_overlap_left_0_13: w_var_0 + x_grid_var_0 - x_grid_var_13
   + 216 p_left_0_13 <= 216
 non_overlap_left_rev_0_13: - w_var_0 - x_grid_var_0 + x_grid_var_13
   - 216 p_left_0_13 <= 0
 non_overlap_right_0_13: w_var_13 - x_grid_var_0 + x_grid_var_13
   + 216 p_right_0_13 <= 216
 non_overlap_right_rev_0_13: - w_var_13 + x_grid_var_0 - x_grid_var_13
   - 216 p_right_0_13 <= 0
 non_overlap_down_0_13: h_var_0 + y_grid_var_0 - y_grid_var_13
   + 216 p_down_0_13 <= 216
 non_overlap_down_rev_0_13: - h_var_0 - y_grid_var_0 + y_grid_var_13
   - 216 p_down_0_13 <= 0
 non_overlap_up_0_13: h_var_13 - y_grid_var_0 + y_grid_var_13
   + 216 p_up_0_13 <= 216
 non_overlap_up_rev_0_13: - h_var_13 + y_grid_var_0 - y_grid_var_13
   - 216 p_up_0_13 <= 0
 non_overlap_any_1_2: p_left_1_2 + p_right_1_2 + p_down_1_2 + p_up_1_2
   >= 1
 non_overlap_left_1_2: w_var_1 + x_grid_var_1 - x_grid_var_2
   + 216 p_left_1_2 <= 216
 non_overlap_left_rev_1_2: - w_var_1 - x_grid_var_1 + x_grid_var_2
   - 216 p_left_1_2 <= 0
 non_overlap_right_1_2: w_var_2 - x_grid_var_1 + x_grid_var_2
   + 216 p_right_1_2 <= 216
 non_overlap_right_rev_1_2: - w_var_2 + x_grid_var_1 - x_grid_var_2
   - 216 p_right_1_2 <= 0
 non_overlap_down_1_2: h_var_1 + y_grid_var_1 - y_grid_var_2
   + 216 p_down_1_2 <= 216
 non_overlap_down_rev_1_2: - h_var_1 - y_grid_var_1 + y_grid_var_2
   - 216 p_down_1_2 <= 0
 non_overlap_up_1_2: h_var_2 - y_grid_var_1 + y_grid_var_2 + 216 p_up_1_2
   <= 216
 non_overlap_up_rev_1_2: - h_var_2 + y_grid_var_1 - y_grid_var_2
   - 216 p_up_1_2 <= 0
 non_overlap_any_1_3: p_left_1_3 + p_right_1_3 + p_down_1_3 + p_up_1_3
   >= 1
 non_overlap_left_1_3: w_var_1 + x_grid_var_1 - x_grid_var_3
   + 216 p_left_1_3 <= 216
 non_overlap_left_rev_1_3: - w_var_1 - x_grid_var_1 + x_grid_var_3
   - 216 p_left_1_3 <= 0
 non_overlap_right_1_3: w_var_3 - x_grid_var_1 + x_grid_var_3
   + 216 p_right_1_3 <= 216
 non_overlap_right_rev_1_3: - w_var_3 + x_grid_var_1 - x_grid_var_3
   - 216 p_right_1_3 <= 0
 non_overlap_down_1_3: h_var_1 + y_grid_var_1 - y_grid_var_3
   + 216 p_down_1_3 <= 216
 non_overlap_down_rev_1_3: - h_var_1 - y_grid_var_1 + y_grid_var_3
   - 216 p_down_1_3 <= 0
 non_overlap_up_1_3: h_var_3 - y_grid_var_1 + y_grid_var_3 + 216 p_up_1_3
   <= 216
 non_overlap_up_rev_1_3: - h_var_3 + y_grid_var_1 - y_grid_var_3
   - 216 p_up_1_3 <= 0
 non_overlap_any_1_4: p_left_1_4 + p_right_1_4 + p_down_1_4 + p_up_1_4
   >= 1
 non_overlap_left_1_4: w_var_1 + x_grid_var_1 - x_grid_var_4
   + 216 p_left_1_4 <= 216
 non_overlap_left_rev_1_4: - w_var_1 - x_grid_var_1 + x_grid_var_4
   - 216 p_left_1_4 <= 0
 non_overlap_right_1_4: w_var_4 - x_grid_var_1 + x_grid_var_4
   + 216 p_right_1_4 <= 216
 non_overlap_right_rev_1_4: - w_var_4 + x_grid_var_1 - x_grid_var_4
   - 216 p_right_1_4 <= 0
 non_overlap_down_1_4: h_var_1 + y_grid_var_1 - y_grid_var_4
   + 216 p_down_1_4 <= 216
 non_overlap_down_rev_1_4: - h_var_1 - y_grid_var_1 + y_grid_var_4
   - 216 p_down_1_4 <= 0
 non_overlap_up_1_4: h_var_4 - y_grid_var_1 + y_grid_var_4 + 216 p_up_1_4
   <= 216
 non_overlap_up_rev_1_4: - h_var_4 + y_grid_var_1 - y_grid_var_4
   - 216 p_up_1_4 <= 0
 non_overlap_any_1_5: p_left_1_5 + p_right_1_5 + p_down_1_5 + p_up_1_5
   >= 1
 non_overlap_left_1_5: w_var_1 + x_grid_var_1 - x_grid_var_5
   + 216 p_left_1_5 <= 216
 non_overlap_left_rev_1_5: - w_var_1 - x_grid_var_1 + x_grid_var_5
   - 216 p_left_1_5 <= 0
 non_overlap_right_1_5: w_var_5 - x_grid_var_1 + x_grid_var_5
   + 216 p_right_1_5 <= 216
 non_overlap_right_rev_1_5: - w_var_5 + x_grid_var_1 - x_grid_var_5
   - 216 p_right_1_5 <= 0
 non_overlap_down_1_5: h_var_1 + y_grid_var_1 - y_grid_var_5
   + 216 p_down_1_5 <= 216
 non_overlap_down_rev_1_5: - h_var_1 - y_grid_var_1 + y_grid_var_5
   - 216 p_down_1_5 <= 0
 non_overlap_up_1_5: h_var_5 - y_grid_var_1 + y_grid_var_5 + 216 p_up_1_5
   <= 216
 non_overlap_up_rev_1_5: - h_var_5 + y_grid_var_1 - y_grid_var_5
   - 216 p_up_1_5 <= 0
 non_overlap_any_1_6: p_left_1_6 + p_right_1_6 + p_down_1_6 + p_up_1_6
   >= 1
 non_overlap_left_1_6: w_var_1 + x_grid_var_1 - x_grid_var_6
   + 216 p_left_1_6 <= 216
 non_overlap_left_rev_1_6: - w_var_1 - x_grid_var_1 + x_grid_var_6
   - 216 p_left_1_6 <= 0
 non_overlap_right_1_6: w_var_6 - x_grid_var_1 + x_grid_var_6
   + 216 p_right_1_6 <= 216
 non_overlap_right_rev_1_6: - w_var_6 + x_grid_var_1 - x_grid_var_6
   - 216 p_right_1_6 <= 0
 non_overlap_down_1_6: h_var_1 + y_grid_var_1 - y_grid_var_6
   + 216 p_down_1_6 <= 216
 non_overlap_down_rev_1_6: - h_var_1 - y_grid_var_1 + y_grid_var_6
   - 216 p_down_1_6 <= 0
 non_overlap_up_1_6: h_var_6 - y_grid_var_1 + y_grid_var_6 + 216 p_up_1_6
   <= 216
 non_overlap_up_rev_1_6: - h_var_6 + y_grid_var_1 - y_grid_var_6
   - 216 p_up_1_6 <= 0
 non_overlap_any_1_7: p_left_1_7 + p_right_1_7 + p_down_1_7 + p_up_1_7
   >= 1
 non_overlap_left_1_7: w_var_1 + x_grid_var_1 - x_grid_var_7
   + 216 p_left_1_7 <= 216
 non_overlap_left_rev_1_7: - w_var_1 - x_grid_var_1 + x_grid_var_7
   - 216 p_left_1_7 <= 0
 non_overlap_right_1_7: w_var_7 - x_grid_var_1 + x_grid_var_7
   + 216 p_right_1_7 <= 216
 non_overlap_right_rev_1_7: - w_var_7 + x_grid_var_1 - x_grid_var_7
   - 216 p_right_1_7 <= 0
 non_overlap_down_1_7: h_var_1 + y_grid_var_1 - y_grid_var_7
   + 216 p_down_1_7 <= 216
 non_overlap_down_rev_1_7: - h_var_1 - y_grid_var_1 + y_grid_var_7
   - 216 p_down_1_7 <= 0
 non_overlap_up_1_7: h_var_7 - y_grid_var_1 + y_grid_var_7 + 216 p_up_1_7
   <= 216
 non_overlap_up_rev_1_7: - h_var_7 + y_grid_var_1 - y_grid_var_7
   - 216 p_up_1_7 <= 0
 non_overlap_any_1_8: p_left_1_8 + p_right_1_8 + p_down_1_8 + p_up_1_8
   >= 1
 non_overlap_left_1_8: w_var_1 + x_grid_var_1 - x_grid_var_8
   + 216 p_left_1_8 <= 216
 non_overlap_left_rev_1_8: - w_var_1 - x_grid_var_1 + x_grid_var_8
   - 216 p_left_1_8 <= 0
 non_overlap_right_1_8: w_var_8 - x_grid_var_1 + x_grid_var_8
   + 216 p_right_1_8 <= 216
 non_overlap_right_rev_1_8: - w_var_8 + x_grid_var_1 - x_grid_var_8
   - 216 p_right_1_8 <= 0
 non_overlap_down_1_8: h_var_1 + y_grid_var_1 - y_grid_var_8
   + 216 p_down_1_8 <= 216
 non_overlap_down_rev_1_8: - h_var_1 - y_grid_var_1 + y_grid_var_8
   - 216 p_down_1_8 <= 0
 non_overlap_up_1_8: h_var_8 - y_grid_var_1 + y_grid_var_8 + 216 p_up_1_8
   <= 216
 non_overlap_up_rev_1_8: - h_var_8 + y_grid_var_1 - y_grid_var_8
   - 216 p_up_1_8 <= 0
 non_overlap_any_1_9: p_left_1_9 + p_right_1_9 + p_down_1_9 + p_up_1_9
   >= 1
 non_overlap_left_1_9: w_var_1 + x_grid_var_1 - x_grid_var_9
   + 216 p_left_1_9 <= 216
 non_overlap_left_rev_1_9: - w_var_1 - x_grid_var_1 + x_grid_var_9
   - 216 p_left_1_9 <= 0
 non_overlap_right_1_9: w_var_9 - x_grid_var_1 + x_grid_var_9
   + 216 p_right_1_9 <= 216
 non_overlap_right_rev_1_9: - w_var_9 + x_grid_var_1 - x_grid_var_9
   - 216 p_right_1_9 <= 0
 non_overlap_down_1_9: h_var_1 + y_grid_var_1 - y_grid_var_9
   + 216 p_down_1_9 <= 216
 non_overlap_down_rev_1_9: - h_var_1 - y_grid_var_1 + y_grid_var_9
   - 216 p_down_1_9 <= 0
 non_overlap_up_1_9: h_var_9 - y_grid_var_1 + y_grid_var_9 + 216 p_up_1_9
   <= 216
 non_overlap_up_rev_1_9: - h_var_9 + y_grid_var_1 - y_grid_var_9
   - 216 p_up_1_9 <= 0
 non_overlap_any_1_10: p_left_1_10 + p_right_1_10 + p_down_1_10 + p_up_1_10
   >= 1
 non_overlap_left_1_10: w_var_1 + x_grid_var_1 - x_grid_var_10
   + 216 p_left_1_10 <= 216
 non_overlap_left_rev_1_10: - w_var_1 - x_grid_var_1 + x_grid_var_10
   - 216 p_left_1_10 <= 0
 non_overlap_right_1_10: w_var_10 - x_grid_var_1 + x_grid_var_10
   + 216 p_right_1_10 <= 216
 non_overlap_right_rev_1_10: - w_var_10 + x_grid_var_1 - x_grid_var_10
   - 216 p_right_1_10 <= 0
 non_overlap_down_1_10: h_var_1 + y_grid_var_1 - y_grid_var_10
   + 216 p_down_1_10 <= 216
 non_overlap_down_rev_1_10: - h_var_1 - y_grid_var_1 + y_grid_var_10
   - 216 p_down_1_10 <= 0
 non_overlap_up_1_10: h_var_10 - y_grid_var_1 + y_grid_var_10
   + 216 p_up_1_10 <= 216
 non_overlap_up_rev_1_10: - h_var_10 + y_grid_var_1 - y_grid_var_10
   - 216 p_up_1_10 <= 0
 non_overlap_any_1_11: p_left_1_11 + p_right_1_11 + p_down_1_11 + p_up_1_11
   >= 1
 non_overlap_left_1_11: w_var_1 + x_grid_var_1 - x_grid_var_11
   + 216 p_left_1_11 <= 216
 non_overlap_left_rev_1_11: - w_var_1 - x_grid_var_1 + x_grid_var_11
   - 216 p_left_1_11 <= 0
 non_overlap_right_1_11: w_var_11 - x_grid_var_1 + x_grid_var_11
   + 216 p_right_1_11 <= 216
 non_overlap_right_rev_1_11: - w_var_11 + x_grid_var_1 - x_grid_var_11
   - 216 p_right_1_11 <= 0
 non_overlap_down_1_11: h_var_1 + y_grid_var_1 - y_grid_var_11
   + 216 p_down_1_11 <= 216
 non_overlap_down_rev_1_11: - h_var_1 - y_grid_var_1 + y_grid_var_11
   - 216 p_down_1_11 <= 0
 non_overlap_up_1_11: h_var_11 - y_grid_var_1 + y_grid_var_11
   + 216 p_up_1_11 <= 216
 non_overlap_up_rev_1_11: - h_var_11 + y_grid_var_1 - y_grid_var_11
   - 216 p_up_1_11 <= 0
 non_overlap_any_1_12: p_left_1_12 + p_right_1_12 + p_down_1_12 + p_up_1_12
   >= 1
 non_overlap_left_1_12: w_var_1 + x_grid_var_1 - x_grid_var_12
   + 216 p_left_1_12 <= 216
 non_overlap_left_rev_1_12: - w_var_1 - x_grid_var_1 + x_grid_var_12
   - 216 p_left_1_12 <= 0
 non_overlap_right_1_12: w_var_12 - x_grid_var_1 + x_grid_var_12
   + 216 p_right_1_12 <= 216
 non_overlap_right_rev_1_12: - w_var_12 + x_grid_var_1 - x_grid_var_12
   - 216 p_right_1_12 <= 0
 non_overlap_down_1_12: h_var_1 + y_grid_var_1 - y_grid_var_12
   + 216 p_down_1_12 <= 216
 non_overlap_down_rev_1_12: - h_var_1 - y_grid_var_1 + y_grid_var_12
   - 216 p_down_1_12 <= 0
 non_overlap_up_1_12: h_var_12 - y_grid_var_1 + y_grid_var_12
   + 216 p_up_1_12 <= 216
 non_overlap_up_rev_1_12: - h_var_12 + y_grid_var_1 - y_grid_var_12
   - 216 p_up_1_12 <= 0
 non_overlap_any_1_13: p_left_1_13 + p_right_1_13 + p_down_1_13 + p_up_1_13
   >= 1
 non_overlap_left_1_13: w_var_1 + x_grid_var_1 - x_grid_var_13
   + 216 p_left_1_13 <= 216
 non_overlap_left_rev_1_13: - w_var_1 - x_grid_var_1 + x_grid_var_13
   - 216 p_left_1_13 <= 0
 non_overlap_right_1_13: w_var_13 - x_grid_var_1 + x_grid_var_13
   + 216 p_right_1_13 <= 216
 non_overlap_right_rev_1_13: - w_var_13 + x_grid_var_1 - x_grid_var_13
   - 216 p_right_1_13 <= 0
 non_overlap_down_1_13: h_var_1 + y_grid_var_1 - y_grid_var_13
   + 216 p_down_1_13 <= 216
 non_overlap_down_rev_1_13: - h_var_1 - y_grid_var_1 + y_grid_var_13
   - 216 p_down_1_13 <= 0
 non_overlap_up_1_13: h_var_13 - y_grid_var_1 + y_grid_var_13
   + 216 p_up_1_13 <= 216
 non_overlap_up_rev_1_13: - h_var_13 + y_grid_var_1 - y_grid_var_13
   - 216 p_up_1_13 <= 0
 non_overlap_any_2_3: p_left_2_3 + p_right_2_3 + p_down_2_3 + p_up_2_3
   >= 1
 non_overlap_left_2_3: w_var_2 + x_grid_var_2 - x_grid_var_3
   + 216 p_left_2_3 <= 216
 non_overlap_left_rev_2_3: - w_var_2 - x_grid_var_2 + x_grid_var_3
   - 216 p_left_2_3 <= 0
 non_overlap_right_2_3: w_var_3 - x_grid_var_2 + x_grid_var_3
   + 216 p_right_2_3 <= 216
 non_overlap_right_rev_2_3: - w_var_3 + x_grid_var_2 - x_grid_var_3
   - 216 p_right_2_3 <= 0
 non_overlap_down_2_3: h_var_2 + y_grid_var_2 - y_grid_var_3
   + 216 p_down_2_3 <= 216
 non_overlap_down_rev_2_3: - h_var_2 - y_grid_var_2 + y_grid_var_3
   - 216 p_down_2_3 <= 0
 non_overlap_up_2_3: h_var_3 - y_grid_var_2 + y_grid_var_3 + 216 p_up_2_3
   <= 216
 non_overlap_up_rev_2_3: - h_var_3 + y_grid_var_2 - y_grid_var_3
   - 216 p_up_2_3 <= 0
 non_overlap_any_2_4: p_left_2_4 + p_right_2_4 + p_down_2_4 + p_up_2_4
   >= 1
 non_overlap_left_2_4: w_var_2 + x_grid_var_2 - x_grid_var_4
   + 216 p_left_2_4 <= 216
 non_overlap_left_rev_2_4: - w_var_2 - x_grid_var_2 + x_grid_var_4
   - 216 p_left_2_4 <= 0
 non_overlap_right_2_4: w_var_4 - x_grid_var_2 + x_grid_var_4
   + 216 p_right_2_4 <= 216
 non_overlap_right_rev_2_4: - w_var_4 + x_grid_var_2 - x_grid_var_4
   - 216 p_right_2_4 <= 0
 non_overlap_down_2_4: h_var_2 + y_grid_var_2 - y_grid_var_4
   + 216 p_down_2_4 <= 216
 non_overlap_down_rev_2_4: - h_var_2 - y_grid_var_2 + y_grid_var_4
   - 216 p_down_2_4 <= 0
 non_overlap_up_2_4: h_var_4 - y_grid_var_2 + y_grid_var_4 + 216 p_up_2_4
   <= 216
 non_overlap_up_rev_2_4: - h_var_4 + y_grid_var_2 - y_grid_var_4
   - 216 p_up_2_4 <= 0
 non_overlap_any_2_5: p_left_2_5 + p_right_2_5 + p_down_2_5 + p_up_2_5
   >= 1
 non_overlap_left_2_5: w_var_2 + x_grid_var_2 - x_grid_var_5
   + 216 p_left_2_5 <= 216
 non_overlap_left_rev_2_5: - w_var_2 - x_grid_var_2 + x_grid_var_5
   - 216 p_left_2_5 <= 0
 non_overlap_right_2_5: w_var_5 - x_grid_var_2 + x_grid_var_5
   + 216 p_right_2_5 <= 216
 non_overlap_right_rev_2_5: - w_var_5 + x_grid_var_2 - x_grid_var_5
   - 216 p_right_2_5 <= 0
 non_overlap_down_2_5: h_var_2 + y_grid_var_2 - y_grid_var_5
   + 216 p_down_2_5 <= 216
 non_overlap_down_rev_2_5: - h_var_2 - y_grid_var_2 + y_grid_var_5
   - 216 p_down_2_5 <= 0
 non_overlap_up_2_5: h_var_5 - y_grid_var_2 + y_grid_var_5 + 216 p_up_2_5
   <= 216
 non_overlap_up_rev_2_5: - h_var_5 + y_grid_var_2 - y_grid_var_5
   - 216 p_up_2_5 <= 0
 non_overlap_any_2_6: p_left_2_6 + p_right_2_6 + p_down_2_6 + p_up_2_6
   >= 1
 non_overlap_left_2_6: w_var_2 + x_grid_var_2 - x_grid_var_6
   + 216 p_left_2_6 <= 216
 non_overlap_left_rev_2_6: - w_var_2 - x_grid_var_2 + x_grid_var_6
   - 216 p_left_2_6 <= 0
 non_overlap_right_2_6: w_var_6 - x_grid_var_2 + x_grid_var_6
   + 216 p_right_2_6 <= 216
 non_overlap_right_rev_2_6: - w_var_6 + x_grid_var_2 - x_grid_var_6
   - 216 p_right_2_6 <= 0
 non_overlap_down_2_6: h_var_2 + y_grid_var_2 - y_grid_var_6
   + 216 p_down_2_6 <= 216
 non_overlap_down_rev_2_6: - h_var_2 - y_grid_var_2 + y_grid_var_6
   - 216 p_down_2_6 <= 0
 non_overlap_up_2_6: h_var_6 - y_grid_var_2 + y_grid_var_6 + 216 p_up_2_6
   <= 216
 non_overlap_up_rev_2_6: - h_var_6 + y_grid_var_2 - y_grid_var_6
   - 216 p_up_2_6 <= 0
 non_overlap_any_2_7: p_left_2_7 + p_right_2_7 + p_down_2_7 + p_up_2_7
   >= 1
 non_overlap_left_2_7: w_var_2 + x_grid_var_2 - x_grid_var_7
   + 216 p_left_2_7 <= 216
 non_overlap_left_rev_2_7: - w_var_2 - x_grid_var_2 + x_grid_var_7
   - 216 p_left_2_7 <= 0
 non_overlap_right_2_7: w_var_7 - x_grid_var_2 + x_grid_var_7
   + 216 p_right_2_7 <= 216
 non_overlap_right_rev_2_7: - w_var_7 + x_grid_var_2 - x_grid_var_7
   - 216 p_right_2_7 <= 0
 non_overlap_down_2_7: h_var_2 + y_grid_var_2 - y_grid_var_7
   + 216 p_down_2_7 <= 216
 non_overlap_down_rev_2_7: - h_var_2 - y_grid_var_2 + y_grid_var_7
   - 216 p_down_2_7 <= 0
 non_overlap_up_2_7: h_var_7 - y_grid_var_2 + y_grid_var_7 + 216 p_up_2_7
   <= 216
 non_overlap_up_rev_2_7: - h_var_7 + y_grid_var_2 - y_grid_var_7
   - 216 p_up_2_7 <= 0
 non_overlap_any_2_8: p_left_2_8 + p_right_2_8 + p_down_2_8 + p_up_2_8
   >= 1
 non_overlap_left_2_8: w_var_2 + x_grid_var_2 - x_grid_var_8
   + 216 p_left_2_8 <= 216
 non_overlap_left_rev_2_8: - w_var_2 - x_grid_var_2 + x_grid_var_8
   - 216 p_left_2_8 <= 0
 non_overlap_right_2_8: w_var_8 - x_grid_var_2 + x_grid_var_8
   + 216 p_right_2_8 <= 216
 non_overlap_right_rev_2_8: - w_var_8 + x_grid_var_2 - x_grid_var_8
   - 216 p_right_2_8 <= 0
 non_overlap_down_2_8: h_var_2 + y_grid_var_2 - y_grid_var_8
   + 216 p_down_2_8 <= 216
 non_overlap_down_rev_2_8: - h_var_2 - y_grid_var_2 + y_grid_var_8
   - 216 p_down_2_8 <= 0
 non_overlap_up_2_8: h_var_8 - y_grid_var_2 + y_grid_var_8 + 216 p_up_2_8
   <= 216
 non_overlap_up_rev_2_8: - h_var_8 + y_grid_var_2 - y_grid_var_8
   - 216 p_up_2_8 <= 0
 non_overlap_any_2_9: p_left_2_9 + p_right_2_9 + p_down_2_9 + p_up_2_9
   >= 1
 non_overlap_left_2_9: w_var_2 + x_grid_var_2 - x_grid_var_9
   + 216 p_left_2_9 <= 216
 non_overlap_left_rev_2_9: - w_var_2 - x_grid_var_2 + x_grid_var_9
   - 216 p_left_2_9 <= 0
 non_overlap_right_2_9: w_var_9 - x_grid_var_2 + x_grid_var_9
   + 216 p_right_2_9 <= 216
 non_overlap_right_rev_2_9: - w_var_9 + x_grid_var_2 - x_grid_var_9
   - 216 p_right_2_9 <= 0
 non_overlap_down_2_9: h_var_2 + y_grid_var_2 - y_grid_var_9
   + 216 p_down_2_9 <= 216
 non_overlap_down_rev_2_9: - h_var_2 - y_grid_var_2 + y_grid_var_9
   - 216 p_down_2_9 <= 0
 non_overlap_up_2_9: h_var_9 - y_grid_var_2 + y_grid_var_9 + 216 p_up_2_9
   <= 216
 non_overlap_up_rev_2_9: - h_var_9 + y_grid_var_2 - y_grid_var_9
   - 216 p_up_2_9 <= 0
 non_overlap_any_2_10: p_left_2_10 + p_right_2_10 + p_down_2_10 + p_up_2_10
   >= 1
 non_overlap_left_2_10: w_var_2 + x_grid_var_2 - x_grid_var_10
   + 216 p_left_2_10 <= 216
 non_overlap_left_rev_2_10: - w_var_2 - x_grid_var_2 + x_grid_var_10
   - 216 p_left_2_10 <= 0
 non_overlap_right_2_10: w_var_10 - x_grid_var_2 + x_grid_var_10
   + 216 p_right_2_10 <= 216
 non_overlap_right_rev_2_10: - w_var_10 + x_grid_var_2 - x_grid_var_10
   - 216 p_right_2_10 <= 0
 non_overlap_down_2_10: h_var_2 + y_grid_var_2 - y_grid_var_10
   + 216 p_down_2_10 <= 216
 non_overlap_down_rev_2_10: - h_var_2 - y_grid_var_2 + y_grid_var_10
   - 216 p_down_2_10 <= 0
 non_overlap_up_2_10: h_var_10 - y_grid_var_2 + y_grid_var_10
   + 216 p_up_2_10 <= 216
 non_overlap_up_rev_2_10: - h_var_10 + y_grid_var_2 - y_grid_var_10
   - 216 p_up_2_10 <= 0
 non_overlap_any_2_11: p_left_2_11 + p_right_2_11 + p_down_2_11 + p_up_2_11
   >= 1
 non_overlap_left_2_11: w_var_2 + x_grid_var_2 - x_grid_var_11
   + 216 p_left_2_11 <= 216
 non_overlap_left_rev_2_11: - w_var_2 - x_grid_var_2 + x_grid_var_11
   - 216 p_left_2_11 <= 0
 non_overlap_right_2_11: w_var_11 - x_grid_var_2 + x_grid_var_11
   + 216 p_right_2_11 <= 216
 non_overlap_right_rev_2_11: - w_var_11 + x_grid_var_2 - x_grid_var_11
   - 216 p_right_2_11 <= 0
 non_overlap_down_2_11: h_var_2 + y_grid_var_2 - y_grid_var_11
   + 216 p_down_2_11 <= 216
 non_overlap_down_rev_2_11: - h_var_2 - y_grid_var_2 + y_grid_var_11
   - 216 p_down_2_11 <= 0
 non_overlap_up_2_11: h_var_11 - y_grid_var_2 + y_grid_var_11
   + 216 p_up_2_11 <= 216
 non_overlap_up_rev_2_11: - h_var_11 + y_grid_var_2 - y_grid_var_11
   - 216 p_up_2_11 <= 0
 non_overlap_any_2_12: p_left_2_12 + p_right_2_12 + p_down_2_12 + p_up_2_12
   >= 1
 non_overlap_left_2_12: w_var_2 + x_grid_var_2 - x_grid_var_12
   + 216 p_left_2_12 <= 216
 non_overlap_left_rev_2_12: - w_var_2 - x_grid_var_2 + x_grid_var_12
   - 216 p_left_2_12 <= 0
 non_overlap_right_2_12: w_var_12 - x_grid_var_2 + x_grid_var_12
   + 216 p_right_2_12 <= 216
 non_overlap_right_rev_2_12: - w_var_12 + x_grid_var_2 - x_grid_var_12
   - 216 p_right_2_12 <= 0
 non_overlap_down_2_12: h_var_2 + y_grid_var_2 - y_grid_var_12
   + 216 p_down_2_12 <= 216
 non_overlap_down_rev_2_12: - h_var_2 - y_grid_var_2 + y_grid_var_12
   - 216 p_down_2_12 <= 0
 non_overlap_up_2_12: h_var_12 - y_grid_var_2 + y_grid_var_12
   + 216 p_up_2_12 <= 216
 non_overlap_up_rev_2_12: - h_var_12 + y_grid_var_2 - y_grid_var_12
   - 216 p_up_2_12 <= 0
 non_overlap_any_2_13: p_left_2_13 + p_right_2_13 + p_down_2_13 + p_up_2_13
   >= 1
 non_overlap_left_2_13: w_var_2 + x_grid_var_2 - x_grid_var_13
   + 216 p_left_2_13 <= 216
 non_overlap_left_rev_2_13: - w_var_2 - x_grid_var_2 + x_grid_var_13
   - 216 p_left_2_13 <= 0
 non_overlap_right_2_13: w_var_13 - x_grid_var_2 + x_grid_var_13
   + 216 p_right_2_13 <= 216
 non_overlap_right_rev_2_13: - w_var_13 + x_grid_var_2 - x_grid_var_13
   - 216 p_right_2_13 <= 0
 non_overlap_down_2_13: h_var_2 + y_grid_var_2 - y_grid_var_13
   + 216 p_down_2_13 <= 216
 non_overlap_down_rev_2_13: - h_var_2 - y_grid_var_2 + y_grid_var_13
   - 216 p_down_2_13 <= 0
 non_overlap_up_2_13: h_var_13 - y_grid_var_2 + y_grid_var_13
   + 216 p_up_2_13 <= 216
 non_overlap_up_rev_2_13: - h_var_13 + y_grid_var_2 - y_grid_var_13
   - 216 p_up_2_13 <= 0
 non_overlap_any_3_4: p_left_3_4 + p_right_3_4 + p_down_3_4 + p_up_3_4
   >= 1
 non_overlap_left_3_4: w_var_3 + x_grid_var_3 - x_grid_var_4
   + 216 p_left_3_4 <= 216
 non_overlap_left_rev_3_4: - w_var_3 - x_grid_var_3 + x_grid_var_4
   - 216 p_left_3_4 <= 0
 non_overlap_right_3_4: w_var_4 - x_grid_var_3 + x_grid_var_4
   + 216 p_right_3_4 <= 216
 non_overlap_right_rev_3_4: - w_var_4 + x_grid_var_3 - x_grid_var_4
   - 216 p_right_3_4 <= 0
 non_overlap_down_3_4: h_var_3 + y_grid_var_3 - y_grid_var_4
   + 216 p_down_3_4 <= 216
 non_overlap_down_rev_3_4: - h_var_3 - y_grid_var_3 + y_grid_var_4
   - 216 p_down_3_4 <= 0
 non_overlap_up_3_4: h_var_4 - y_grid_var_3 + y_grid_var_4 + 216 p_up_3_4
   <= 216
 non_overlap_up_rev_3_4: - h_var_4 + y_grid_var_3 - y_grid_var_4
   - 216 p_up_3_4 <= 0
 non_overlap_any_3_5: p_left_3_5 + p_right_3_5 + p_down_3_5 + p_up_3_5
   >= 1
 non_overlap_left_3_5: w_var_3 + x_grid_var_3 - x_grid_var_5
   + 216 p_left_3_5 <= 216
 non_overlap_left_rev_3_5: - w_var_3 - x_grid_var_3 + x_grid_var_5
   - 216 p_left_3_5 <= 0
 non_overlap_right_3_5: w_var_5 - x_grid_var_3 + x_grid_var_5
   + 216 p_right_3_5 <= 216
 non_overlap_right_rev_3_5: - w_var_5 + x_grid_var_3 - x_grid_var_5
   - 216 p_right_3_5 <= 0
 non_overlap_down_3_5: h_var_3 + y_grid_var_3 - y_grid_var_5
   + 216 p_down_3_5 <= 216
 non_overlap_down_rev_3_5: - h_var_3 - y_grid_var_3 + y_grid_var_5
   - 216 p_down_3_5 <= 0
 non_overlap_up_3_5: h_var_5 - y_grid_var_3 + y_grid_var_5 + 216 p_up_3_5
   <= 216
 non_overlap_up_rev_3_5: - h_var_5 + y_grid_var_3 - y_grid_var_5
   - 216 p_up_3_5 <= 0
 non_overlap_any_3_6: p_left_3_6 + p_right_3_6 + p_down_3_6 + p_up_3_6
   >= 1
 non_overlap_left_3_6: w_var_3 + x_grid_var_3 - x_grid_var_6
   + 216 p_left_3_6 <= 216
 non_overlap_left_rev_3_6: - w_var_3 - x_grid_var_3 + x_grid_var_6
   - 216 p_left_3_6 <= 0
 non_overlap_right_3_6: w_var_6 - x_grid_var_3 + x_grid_var_6
   + 216 p_right_3_6 <= 216
 non_overlap_right_rev_3_6: - w_var_6 + x_grid_var_3 - x_grid_var_6
   - 216 p_right_3_6 <= 0
 non_overlap_down_3_6: h_var_3 + y_grid_var_3 - y_grid_var_6
   + 216 p_down_3_6 <= 216
 non_overlap_down_rev_3_6: - h_var_3 - y_grid_var_3 + y_grid_var_6
   - 216 p_down_3_6 <= 0
 non_overlap_up_3_6: h_var_6 - y_grid_var_3 + y_grid_var_6 + 216 p_up_3_6
   <= 216
 non_overlap_up_rev_3_6: - h_var_6 + y_grid_var_3 - y_grid_var_6
   - 216 p_up_3_6 <= 0
 non_overlap_any_3_7: p_left_3_7 + p_right_3_7 + p_down_3_7 + p_up_3_7
   >= 1
 non_overlap_left_3_7: w_var_3 + x_grid_var_3 - x_grid_var_7
   + 216 p_left_3_7 <= 216
 non_overlap_left_rev_3_7: - w_var_3 - x_grid_var_3 + x_grid_var_7
   - 216 p_left_3_7 <= 0
 non_overlap_right_3_7: w_var_7 - x_grid_var_3 + x_grid_var_7
   + 216 p_right_3_7 <= 216
 non_overlap_right_rev_3_7: - w_var_7 + x_grid_var_3 - x_grid_var_7
   - 216 p_right_3_7 <= 0
 non_overlap_down_3_7: h_var_3 + y_grid_var_3 - y_grid_var_7
   + 216 p_down_3_7 <= 216
 non_overlap_down_rev_3_7: - h_var_3 - y_grid_var_3 + y_grid_var_7
   - 216 p_down_3_7 <= 0
 non_overlap_up_3_7: h_var_7 - y_grid_var_3 + y_grid_var_7 + 216 p_up_3_7
   <= 216
 non_overlap_up_rev_3_7: - h_var_7 + y_grid_var_3 - y_grid_var_7
   - 216 p_up_3_7 <= 0
 non_overlap_any_3_8: p_left_3_8 + p_right_3_8 + p_down_3_8 + p_up_3_8
   >= 1
 non_overlap_left_3_8: w_var_3 + x_grid_var_3 - x_grid_var_8
   + 216 p_left_3_8 <= 216
 non_overlap_left_rev_3_8: - w_var_3 - x_grid_var_3 + x_grid_var_8
   - 216 p_left_3_8 <= 0
 non_overlap_right_3_8: w_var_8 - x_grid_var_3 + x_grid_var_8
   + 216 p_right_3_8 <= 216
 non_overlap_right_rev_3_8: - w_var_8 + x_grid_var_3 - x_grid_var_8
   - 216 p_right_3_8 <= 0
 non_overlap_down_3_8: h_var_3 + y_grid_var_3 - y_grid_var_8
   + 216 p_down_3_8 <= 216
 non_overlap_down_rev_3_8: - h_var_3 - y_grid_var_3 + y_grid_var_8
   - 216 p_down_3_8 <= 0
 non_overlap_up_3_8: h_var_8 - y_grid_var_3 + y_grid_var_8 + 216 p_up_3_8
   <= 216
 non_overlap_up_rev_3_8: - h_var_8 + y_grid_var_3 - y_grid_var_8
   - 216 p_up_3_8 <= 0
 non_overlap_any_3_9: p_left_3_9 + p_right_3_9 + p_down_3_9 + p_up_3_9
   >= 1
 non_overlap_left_3_9: w_var_3 + x_grid_var_3 - x_grid_var_9
   + 216 p_left_3_9 <= 216
 non_overlap_left_rev_3_9: - w_var_3 - x_grid_var_3 + x_grid_var_9
   - 216 p_left_3_9 <= 0
 non_overlap_right_3_9: w_var_9 - x_grid_var_3 + x_grid_var_9
   + 216 p_right_3_9 <= 216
 non_overlap_right_rev_3_9: - w_var_9 + x_grid_var_3 - x_grid_var_9
   - 216 p_right_3_9 <= 0
 non_overlap_down_3_9: h_var_3 + y_grid_var_3 - y_grid_var_9
   + 216 p_down_3_9 <= 216
 non_overlap_down_rev_3_9: - h_var_3 - y_grid_var_3 + y_grid_var_9
   - 216 p_down_3_9 <= 0
 non_overlap_up_3_9: h_var_9 - y_grid_var_3 + y_grid_var_9 + 216 p_up_3_9
   <= 216
 non_overlap_up_rev_3_9: - h_var_9 + y_grid_var_3 - y_grid_var_9
   - 216 p_up_3_9 <= 0
 non_overlap_any_3_10: p_left_3_10 + p_right_3_10 + p_down_3_10 + p_up_3_10
   >= 1
 non_overlap_left_3_10: w_var_3 + x_grid_var_3 - x_grid_var_10
   + 216 p_left_3_10 <= 216
 non_overlap_left_rev_3_10: - w_var_3 - x_grid_var_3 + x_grid_var_10
   - 216 p_left_3_10 <= 0
 non_overlap_right_3_10: w_var_10 - x_grid_var_3 + x_grid_var_10
   + 216 p_right_3_10 <= 216
 non_overlap_right_rev_3_10: - w_var_10 + x_grid_var_3 - x_grid_var_10
   - 216 p_right_3_10 <= 0
 non_overlap_down_3_10: h_var_3 + y_grid_var_3 - y_grid_var_10
   + 216 p_down_3_10 <= 216
 non_overlap_down_rev_3_10: - h_var_3 - y_grid_var_3 + y_grid_var_10
   - 216 p_down_3_10 <= 0
 non_overlap_up_3_10: h_var_10 - y_grid_var_3 + y_grid_var_10
   + 216 p_up_3_10 <= 216
 non_overlap_up_rev_3_10: - h_var_10 + y_grid_var_3 - y_grid_var_10
   - 216 p_up_3_10 <= 0
 non_overlap_any_3_11: p_left_3_11 + p_right_3_11 + p_down_3_11 + p_up_3_11
   >= 1
 non_overlap_left_3_11: w_var_3 + x_grid_var_3 - x_grid_var_11
   + 216 p_left_3_11 <= 216
 non_overlap_left_rev_3_11: - w_var_3 - x_grid_var_3 + x_grid_var_11
   - 216 p_left_3_11 <= 0
 non_overlap_right_3_11: w_var_11 - x_grid_var_3 + x_grid_var_11
   + 216 p_right_3_11 <= 216
 non_overlap_right_rev_3_11: - w_var_11 + x_grid_var_3 - x_grid_var_11
   - 216 p_right_3_11 <= 0
 non_overlap_down_3_11: h_var_3 + y_grid_var_3 - y_grid_var_11
   + 216 p_down_3_11 <= 216
 non_overlap_down_rev_3_11: - h_var_3 - y_grid_var_3 + y_grid_var_11
   - 216 p_down_3_11 <= 0
 non_overlap_up_3_11: h_var_11 - y_grid_var_3 + y_grid_var_11
   + 216 p_up_3_11 <= 216
 non_overlap_up_rev_3_11: - h_var_11 + y_grid_var_3 - y_grid_var_11
   - 216 p_up_3_11 <= 0
 non_overlap_any_3_12: p_left_3_12 + p_right_3_12 + p_down_3_12 + p_up_3_12
   >= 1
 non_overlap_left_3_12: w_var_3 + x_grid_var_3 - x_grid_var_12
   + 216 p_left_3_12 <= 216
 non_overlap_left_rev_3_12: - w_var_3 - x_grid_var_3 + x_grid_var_12
   - 216 p_left_3_12 <= 0
 non_overlap_right_3_12: w_var_12 - x_grid_var_3 + x_grid_var_12
   + 216 p_right_3_12 <= 216
 non_overlap_right_rev_3_12: - w_var_12 + x_grid_var_3 - x_grid_var_12
   - 216 p_right_3_12 <= 0
 non_overlap_down_3_12: h_var_3 + y_grid_var_3 - y_grid_var_12
   + 216 p_down_3_12 <= 216
 non_overlap_down_rev_3_12: - h_var_3 - y_grid_var_3 + y_grid_var_12
   - 216 p_down_3_12 <= 0
 non_overlap_up_3_12: h_var_12 - y_grid_var_3 + y_grid_var_12
   + 216 p_up_3_12 <= 216
 non_overlap_up_rev_3_12: - h_var_12 + y_grid_var_3 - y_grid_var_12
   - 216 p_up_3_12 <= 0
 non_overlap_any_3_13: p_left_3_13 + p_right_3_13 + p_down_3_13 + p_up_3_13
   >= 1
 non_overlap_left_3_13: w_var_3 + x_grid_var_3 - x_grid_var_13
   + 216 p_left_3_13 <= 216
 non_overlap_left_rev_3_13: - w_var_3 - x_grid_var_3 + x_grid_var_13
   - 216 p_left_3_13 <= 0
 non_overlap_right_3_13: w_var_13 - x_grid_var_3 + x_grid_var_13
   + 216 p_right_3_13 <= 216
 non_overlap_right_rev_3_13: - w_var_13 + x_grid_var_3 - x_grid_var_13
   - 216 p_right_3_13 <= 0
 non_overlap_down_3_13: h_var_3 + y_grid_var_3 - y_grid_var_13
   + 216 p_down_3_13 <= 216
 non_overlap_down_rev_3_13: - h_var_3 - y_grid_var_3 + y_grid_var_13
   - 216 p_down_3_13 <= 0
 non_overlap_up_3_13: h_var_13 - y_grid_var_3 + y_grid_var_13
   + 216 p_up_3_13 <= 216
 non_overlap_up_rev_3_13: - h_var_13 + y_grid_var_3 - y_grid_var_13
   - 216 p_up_3_13 <= 0
 non_overlap_any_4_5: p_left_4_5 + p_right_4_5 + p_down_4_5 + p_up_4_5
   >= 1
 non_overlap_left_4_5: w_var_4 + x_grid_var_4 - x_grid_var_5
   + 216 p_left_4_5 <= 216
 non_overlap_left_rev_4_5: - w_var_4 - x_grid_var_4 + x_grid_var_5
   - 216 p_left_4_5 <= 0
 non_overlap_right_4_5: w_var_5 - x_grid_var_4 + x_grid_var_5
   + 216 p_right_4_5 <= 216
 non_overlap_right_rev_4_5: - w_var_5 + x_grid_var_4 - x_grid_var_5
   - 216 p_right_4_5 <= 0
 non_overlap_down_4_5: h_var_4 + y_grid_var_4 - y_grid_var_5
   + 216 p_down_4_5 <= 216
 non_overlap_down_rev_4_5: - h_var_4 - y_grid_var_4 + y_grid_var_5
   - 216 p_down_4_5 <= 0
 non_overlap_up_4_5: h_var_5 - y_grid_var_4 + y_grid_var_5 + 216 p_up_4_5
   <= 216
 non_overlap_up_rev_4_5: - h_var_5 + y_grid_var_4 - y_grid_var_5
   - 216 p_up_4_5 <= 0
 non_overlap_any_4_6: p_left_4_6 + p_right_4_6 + p_down_4_6 + p_up_4_6
   >= 1
 non_overlap_left_4_6: w_var_4 + x_grid_var_4 - x_grid_var_6
   + 216 p_left_4_6 <= 216
 non_overlap_left_rev_4_6: - w_var_4 - x_grid_var_4 + x_grid_var_6
   - 216 p_left_4_6 <= 0
 non_overlap_right_4_6: w_var_6 - x_grid_var_4 + x_grid_var_6
   + 216 p_right_4_6 <= 216
 non_overlap_right_rev_4_6: - w_var_6 + x_grid_var_4 - x_grid_var_6
   - 216 p_right_4_6 <= 0
 non_overlap_down_4_6: h_var_4 + y_grid_var_4 - y_grid_var_6
   + 216 p_down_4_6 <= 216
 non_overlap_down_rev_4_6: - h_var_4 - y_grid_var_4 + y_grid_var_6
   - 216 p_down_4_6 <= 0
 non_overlap_up_4_6: h_var_6 - y_grid_var_4 + y_grid_var_6 + 216 p_up_4_6
   <= 216
 non_overlap_up_rev_4_6: - h_var_6 + y_grid_var_4 - y_grid_var_6
   - 216 p_up_4_6 <= 0
 non_overlap_any_4_7: p_left_4_7 + p_right_4_7 + p_down_4_7 + p_up_4_7
   >= 1
 non_overlap_left_4_7: w_var_4 + x_grid_var_4 - x_grid_var_7
   + 216 p_left_4_7 <= 216
 non_overlap_left_rev_4_7: - w_var_4 - x_grid_var_4 + x_grid_var_7
   - 216 p_left_4_7 <= 0
 non_overlap_right_4_7: w_var_7 - x_grid_var_4 + x_grid_var_7
   + 216 p_right_4_7 <= 216
 non_overlap_right_rev_4_7: - w_var_7 + x_grid_var_4 - x_grid_var_7
   - 216 p_right_4_7 <= 0
 non_overlap_down_4_7: h_var_4 + y_grid_var_4 - y_grid_var_7
   + 216 p_down_4_7 <= 216
 non_overlap_down_rev_4_7: - h_var_4 - y_grid_var_4 + y_grid_var_7
   - 216 p_down_4_7 <= 0
 non_overlap_up_4_7: h_var_7 - y_grid_var_4 + y_grid_var_7 + 216 p_up_4_7
   <= 216
 non_overlap_up_rev_4_7: - h_var_7 + y_grid_var_4 - y_grid_var_7
   - 216 p_up_4_7 <= 0
 non_overlap_any_4_8: p_left_4_8 + p_right_4_8 + p_down_4_8 + p_up_4_8
   >= 1
 non_overlap_left_4_8: w_var_4 + x_grid_var_4 - x_grid_var_8
   + 216 p_left_4_8 <= 216
 non_overlap_left_rev_4_8: - w_var_4 - x_grid_var_4 + x_grid_var_8
   - 216 p_left_4_8 <= 0
 non_overlap_right_4_8: w_var_8 - x_grid_var_4 + x_grid_var_8
   + 216 p_right_4_8 <= 216
 non_overlap_right_rev_4_8: - w_var_8 + x_grid_var_4 - x_grid_var_8
   - 216 p_right_4_8 <= 0
 non_overlap_down_4_8: h_var_4 + y_grid_var_4 - y_grid_var_8
   + 216 p_down_4_8 <= 216
 non_overlap_down_rev_4_8: - h_var_4 - y_grid_var_4 + y_grid_var_8
   - 216 p_down_4_8 <= 0
 non_overlap_up_4_8: h_var_8 - y_grid_var_4 + y_grid_var_8 + 216 p_up_4_8
   <= 216
 non_overlap_up_rev_4_8: - h_var_8 + y_grid_var_4 - y_grid_var_8
   - 216 p_up_4_8 <= 0
 non_overlap_any_4_9: p_left_4_9 + p_right_4_9 + p_down_4_9 + p_up_4_9
   >= 1
 non_overlap_left_4_9: w_var_4 + x_grid_var_4 - x_grid_var_9
   + 216 p_left_4_9 <= 216
 non_overlap_left_rev_4_9: - w_var_4 - x_grid_var_4 + x_grid_var_9
   - 216 p_left_4_9 <= 0
 non_overlap_right_4_9: w_var_9 - x_grid_var_4 + x_grid_var_9
   + 216 p_right_4_9 <= 216
 non_overlap_right_rev_4_9: - w_var_9 + x_grid_var_4 - x_grid_var_9
   - 216 p_right_4_9 <= 0
 non_overlap_down_4_9: h_var_4 + y_grid_var_4 - y_grid_var_9
   + 216 p_down_4_9 <= 216
 non_overlap_down_rev_4_9: - h_var_4 - y_grid_var_4 + y_grid_var_9
   - 216 p_down_4_9 <= 0
 non_overlap_up_4_9: h_var_9 - y_grid_var_4 + y_grid_var_9 + 216 p_up_4_9
   <= 216
 non_overlap_up_rev_4_9: - h_var_9 + y_grid_var_4 - y_grid_var_9
   - 216 p_up_4_9 <= 0
 non_overlap_any_4_10: p_left_4_10 + p_right_4_10 + p_down_4_10 + p_up_4_10
   >= 1
 non_overlap_left_4_10: w_var_4 + x_grid_var_4 - x_grid_var_10
   + 216 p_left_4_10 <= 216
 non_overlap_left_rev_4_10: - w_var_4 - x_grid_var_4 + x_grid_var_10
   - 216 p_left_4_10 <= 0
 non_overlap_right_4_10: w_var_10 - x_grid_var_4 + x_grid_var_10
   + 216 p_right_4_10 <= 216
 non_overlap_right_rev_4_10: - w_var_10 + x_grid_var_4 - x_grid_var_10
   - 216 p_right_4_10 <= 0
 non_overlap_down_4_10: h_var_4 + y_grid_var_4 - y_grid_var_10
   + 216 p_down_4_10 <= 216
 non_overlap_down_rev_4_10: - h_var_4 - y_grid_var_4 + y_grid_var_10
   - 216 p_down_4_10 <= 0
 non_overlap_up_4_10: h_var_10 - y_grid_var_4 + y_grid_var_10
   + 216 p_up_4_10 <= 216
 non_overlap_up_rev_4_10: - h_var_10 + y_grid_var_4 - y_grid_var_10
   - 216 p_up_4_10 <= 0
 non_overlap_any_4_11: p_left_4_11 + p_right_4_11 + p_down_4_11 + p_up_4_11
   >= 1
 non_overlap_left_4_11: w_var_4 + x_grid_var_4 - x_grid_var_11
   + 216 p_left_4_11 <= 216
 non_overlap_left_rev_4_11: - w_var_4 - x_grid_var_4 + x_grid_var_11
   - 216 p_left_4_11 <= 0
 non_overlap_right_4_11: w_var_11 - x_grid_var_4 + x_grid_var_11
   + 216 p_right_4_11 <= 216
 non_overlap_right_rev_4_11: - w_var_11 + x_grid_var_4 - x_grid_var_11
   - 216 p_right_4_11 <= 0
 non_overlap_down_4_11: h_var_4 + y_grid_var_4 - y_grid_var_11
   + 216 p_down_4_11 <= 216
 non_overlap_down_rev_4_11: - h_var_4 - y_grid_var_4 + y_grid_var_11
   - 216 p_down_4_11 <= 0
 non_overlap_up_4_11: h_var_11 - y_grid_var_4 + y_grid_var_11
   + 216 p_up_4_11 <= 216
 non_overlap_up_rev_4_11: - h_var_11 + y_grid_var_4 - y_grid_var_11
   - 216 p_up_4_11 <= 0
 non_overlap_any_4_12: p_left_4_12 + p_right_4_12 + p_down_4_12 + p_up_4_12
   >= 1
 non_overlap_left_4_12: w_var_4 + x_grid_var_4 - x_grid_var_12
   + 216 p_left_4_12 <= 216
 non_overlap_left_rev_4_12: - w_var_4 - x_grid_var_4 + x_grid_var_12
   - 216 p_left_4_12 <= 0
 non_overlap_right_4_12: w_var_12 - x_grid_var_4 + x_grid_var_12
   + 216 p_right_4_12 <= 216
 non_overlap_right_rev_4_12: - w_var_12 + x_grid_var_4 - x_grid_var_12
   - 216 p_right_4_12 <= 0
 non_overlap_down_4_12: h_var_4 + y_grid_var_4 - y_grid_var_12
   + 216 p_down_4_12 <= 216
 non_overlap_down_rev_4_12: - h_var_4 - y_grid_var_4 + y_grid_var_12
   - 216 p_down_4_12 <= 0
 non_overlap_up_4_12: h_var_12 - y_grid_var_4 + y_grid_var_12
   + 216 p_up_4_12 <= 216
 non_overlap_up_rev_4_12: - h_var_12 + y_grid_var_4 - y_grid_var_12
   - 216 p_up_4_12 <= 0
 non_overlap_any_4_13: p_left_4_13 + p_right_4_13 + p_down_4_13 + p_up_4_13
   >= 1
 non_overlap_left_4_13: w_var_4 + x_grid_var_4 - x_grid_var_13
   + 216 p_left_4_13 <= 216
 non_overlap_left_rev_4_13: - w_var_4 - x_grid_var_4 + x_grid_var_13
   - 216 p_left_4_13 <= 0
 non_overlap_right_4_13: w_var_13 - x_grid_var_4 + x_grid_var_13
   + 216 p_right_4_13 <= 216
 non_overlap_right_rev_4_13: - w_var_13 + x_grid_var_4 - x_grid_var_13
   - 216 p_right_4_13 <= 0
 non_overlap_down_4_13: h_var_4 + y_grid_var_4 - y_grid_var_13
   + 216 p_down_4_13 <= 216
 non_overlap_down_rev_4_13: - h_var_4 - y_grid_var_4 + y_grid_var_13
   - 216 p_down_4_13 <= 0
 non_overlap_up_4_13: h_var_13 - y_grid_var_4 + y_grid_var_13
   + 216 p_up_4_13 <= 216
 non_overlap_up_rev_4_13: - h_var_13 + y_grid_var_4 - y_grid_var_13
   - 216 p_up_4_13 <= 0
 non_overlap_any_5_6: p_left_5_6 + p_right_5_6 + p_down_5_6 + p_up_5_6
   >= 1
 non_overlap_left_5_6: w_var_5 + x_grid_var_5 - x_grid_var_6
   + 216 p_left_5_6 <= 216
 non_overlap_left_rev_5_6: - w_var_5 - x_grid_var_5 + x_grid_var_6
   - 216 p_left_5_6 <= 0
 non_overlap_right_5_6: w_var_6 - x_grid_var_5 + x_grid_var_6
   + 216 p_right_5_6 <= 216
 non_overlap_right_rev_5_6: - w_var_6 + x_grid_var_5 - x_grid_var_6
   - 216 p_right_5_6 <= 0
 non_overlap_down_5_6: h_var_5 + y_grid_var_5 - y_grid_var_6
   + 216 p_down_5_6 <= 216
 non_overlap_down_rev_5_6: - h_var_5 - y_grid_var_5 + y_grid_var_6
   - 216 p_down_5_6 <= 0
 non_overlap_up_5_6: h_var_6 - y_grid_var_5 + y_grid_var_6 + 216 p_up_5_6
   <= 216
 non_overlap_up_rev_5_6: - h_var_6 + y_grid_var_5 - y_grid_var_6
   - 216 p_up_5_6 <= 0
 non_overlap_any_5_7: p_left_5_7 + p_right_5_7 + p_down_5_7 + p_up_5_7
   >= 1
 non_overlap_left_5_7: w_var_5 + x_grid_var_5 - x_grid_var_7
   + 216 p_left_5_7 <= 216
 non_overlap_left_rev_5_7: - w_var_5 - x_grid_var_5 + x_grid_var_7
   - 216 p_left_5_7 <= 0
 non_overlap_right_5_7: w_var_7 - x_grid_var_5 + x_grid_var_7
   + 216 p_right_5_7 <= 216
 non_overlap_right_rev_5_7: - w_var_7 + x_grid_var_5 - x_grid_var_7
   - 216 p_right_5_7 <= 0
 non_overlap_down_5_7: h_var_5 + y_grid_var_5 - y_grid_var_7
   + 216 p_down_5_7 <= 216
 non_overlap_down_rev_5_7: - h_var_5 - y_grid_var_5 + y_grid_var_7
   - 216 p_down_5_7 <= 0
 non_overlap_up_5_7: h_var_7 - y_grid_var_5 + y_grid_var_7 + 216 p_up_5_7
   <= 216
 non_overlap_up_rev_5_7: - h_var_7 + y_grid_var_5 - y_grid_var_7
   - 216 p_up_5_7 <= 0
 non_overlap_any_5_8: p_left_5_8 + p_right_5_8 + p_down_5_8 + p_up_5_8
   >= 1
 non_overlap_left_5_8: w_var_5 + x_grid_var_5 - x_grid_var_8
   + 216 p_left_5_8 <= 216
 non_overlap_left_rev_5_8: - w_var_5 - x_grid_var_5 + x_grid_var_8
   - 216 p_left_5_8 <= 0
 non_overlap_right_5_8: w_var_8 - x_grid_var_5 + x_grid_var_8
   + 216 p_right_5_8 <= 216
 non_overlap_right_rev_5_8: - w_var_8 + x_grid_var_5 - x_grid_var_8
   - 216 p_right_5_8 <= 0
 non_overlap_down_5_8: h_var_5 + y_grid_var_5 - y_grid_var_8
   + 216 p_down_5_8 <= 216
 non_overlap_down_rev_5_8: - h_var_5 - y_grid_var_5 + y_grid_var_8
   - 216 p_down_5_8 <= 0
 non_overlap_up_5_8: h_var_8 - y_grid_var_5 + y_grid_var_8 + 216 p_up_5_8
   <= 216
 non_overlap_up_rev_5_8: - h_var_8 + y_grid_var_5 - y_grid_var_8
   - 216 p_up_5_8 <= 0
 non_overlap_any_5_9: p_left_5_9 + p_right_5_9 + p_down_5_9 + p_up_5_9
   >= 1
 non_overlap_left_5_9: w_var_5 + x_grid_var_5 - x_grid_var_9
   + 216 p_left_5_9 <= 216
 non_overlap_left_rev_5_9: - w_var_5 - x_grid_var_5 + x_grid_var_9
   - 216 p_left_5_9 <= 0
 non_overlap_right_5_9: w_var_9 - x_grid_var_5 + x_grid_var_9
   + 216 p_right_5_9 <= 216
 non_overlap_right_rev_5_9: - w_var_9 + x_grid_var_5 - x_grid_var_9
   - 216 p_right_5_9 <= 0
 non_overlap_down_5_9: h_var_5 + y_grid_var_5 - y_grid_var_9
   + 216 p_down_5_9 <= 216
 non_overlap_down_rev_5_9: - h_var_5 - y_grid_var_5 + y_grid_var_9
   - 216 p_down_5_9 <= 0
 non_overlap_up_5_9: h_var_9 - y_grid_var_5 + y_grid_var_9 + 216 p_up_5_9
   <= 216
 non_overlap_up_rev_5_9: - h_var_9 + y_grid_var_5 - y_grid_var_9
   - 216 p_up_5_9 <= 0
 non_overlap_any_5_10: p_left_5_10 + p_right_5_10 + p_down_5_10 + p_up_5_10
   >= 1
 non_overlap_left_5_10: w_var_5 + x_grid_var_5 - x_grid_var_10
   + 216 p_left_5_10 <= 216
 non_overlap_left_rev_5_10: - w_var_5 - x_grid_var_5 + x_grid_var_10
   - 216 p_left_5_10 <= 0
 non_overlap_right_5_10: w_var_10 - x_grid_var_5 + x_grid_var_10
   + 216 p_right_5_10 <= 216
 non_overlap_right_rev_5_10: - w_var_10 + x_grid_var_5 - x_grid_var_10
   - 216 p_right_5_10 <= 0
 non_overlap_down_5_10: h_var_5 + y_grid_var_5 - y_grid_var_10
   + 216 p_down_5_10 <= 216
 non_overlap_down_rev_5_10: - h_var_5 - y_grid_var_5 + y_grid_var_10
   - 216 p_down_5_10 <= 0
 non_overlap_up_5_10: h_var_10 - y_grid_var_5 + y_grid_var_10
   + 216 p_up_5_10 <= 216
 non_overlap_up_rev_5_10: - h_var_10 + y_grid_var_5 - y_grid_var_10
   - 216 p_up_5_10 <= 0
 non_overlap_any_5_11: p_left_5_11 + p_right_5_11 + p_down_5_11 + p_up_5_11
   >= 1
 non_overlap_left_5_11: w_var_5 + x_grid_var_5 - x_grid_var_11
   + 216 p_left_5_11 <= 216
 non_overlap_left_rev_5_11: - w_var_5 - x_grid_var_5 + x_grid_var_11
   - 216 p_left_5_11 <= 0
 non_overlap_right_5_11: w_var_11 - x_grid_var_5 + x_grid_var_11
   + 216 p_right_5_11 <= 216
 non_overlap_right_rev_5_11: - w_var_11 + x_grid_var_5 - x_grid_var_11
   - 216 p_right_5_11 <= 0
 non_overlap_down_5_11: h_var_5 + y_grid_var_5 - y_grid_var_11
   + 216 p_down_5_11 <= 216
 non_overlap_down_rev_5_11: - h_var_5 - y_grid_var_5 + y_grid_var_11
   - 216 p_down_5_11 <= 0
 non_overlap_up_5_11: h_var_11 - y_grid_var_5 + y_grid_var_11
   + 216 p_up_5_11 <= 216
 non_overlap_up_rev_5_11: - h_var_11 + y_grid_var_5 - y_grid_var_11
   - 216 p_up_5_11 <= 0
 non_overlap_any_5_12: p_left_5_12 + p_right_5_12 + p_down_5_12 + p_up_5_12
   >= 1
 non_overlap_left_5_12: w_var_5 + x_grid_var_5 - x_grid_var_12
   + 216 p_left_5_12 <= 216
 non_overlap_left_rev_5_12: - w_var_5 - x_grid_var_5 + x_grid_var_12
   - 216 p_left_5_12 <= 0
 non_overlap_right_5_12: w_var_12 - x_grid_var_5 + x_grid_var_12
   + 216 p_right_5_12 <= 216
 non_overlap_right_rev_5_12: - w_var_12 + x_grid_var_5 - x_grid_var_12
   - 216 p_right_5_12 <= 0
 non_overlap_down_5_12: h_var_5 + y_grid_var_5 - y_grid_var_12
   + 216 p_down_5_12 <= 216
 non_overlap_down_rev_5_12: - h_var_5 - y_grid_var_5 + y_grid_var_12
   - 216 p_down_5_12 <= 0
 non_overlap_up_5_12: h_var_12 - y_grid_var_5 + y_grid_var_12
   + 216 p_up_5_12 <= 216
 non_overlap_up_rev_5_12: - h_var_12 + y_grid_var_5 - y_grid_var_12
   - 216 p_up_5_12 <= 0
 non_overlap_any_5_13: p_left_5_13 + p_right_5_13 + p_down_5_13 + p_up_5_13
   >= 1
 non_overlap_left_5_13: w_var_5 + x_grid_var_5 - x_grid_var_13
   + 216 p_left_5_13 <= 216
 non_overlap_left_rev_5_13: - w_var_5 - x_grid_var_5 + x_grid_var_13
   - 216 p_left_5_13 <= 0
 non_overlap_right_5_13: w_var_13 - x_grid_var_5 + x_grid_var_13
   + 216 p_right_5_13 <= 216
 non_overlap_right_rev_5_13: - w_var_13 + x_grid_var_5 - x_grid_var_13
   - 216 p_right_5_13 <= 0
 non_overlap_down_5_13: h_var_5 + y_grid_var_5 - y_grid_var_13
   + 216 p_down_5_13 <= 216
 non_overlap_down_rev_5_13: - h_var_5 - y_grid_var_5 + y_grid_var_13
   - 216 p_down_5_13 <= 0
 non_overlap_up_5_13: h_var_13 - y_grid_var_5 + y_grid_var_13
   + 216 p_up_5_13 <= 216
 non_overlap_up_rev_5_13: - h_var_13 + y_grid_var_5 - y_grid_var_13
   - 216 p_up_5_13 <= 0
 non_overlap_any_6_7: p_left_6_7 + p_right_6_7 + p_down_6_7 + p_up_6_7
   >= 1
 non_overlap_left_6_7: w_var_6 + x_grid_var_6 - x_grid_var_7
   + 216 p_left_6_7 <= 216
 non_overlap_left_rev_6_7: - w_var_6 - x_grid_var_6 + x_grid_var_7
   - 216 p_left_6_7 <= 0
 non_overlap_right_6_7: w_var_7 - x_grid_var_6 + x_grid_var_7
   + 216 p_right_6_7 <= 216
 non_overlap_right_rev_6_7: - w_var_7 + x_grid_var_6 - x_grid_var_7
   - 216 p_right_6_7 <= 0
 non_overlap_down_6_7: h_var_6 + y_grid_var_6 - y_grid_var_7
   + 216 p_down_6_7 <= 216
 non_overlap_down_rev_6_7: - h_var_6 - y_grid_var_6 + y_grid_var_7
   - 216 p_down_6_7 <= 0
 non_overlap_up_6_7: h_var_7 - y_grid_var_6 + y_grid_var_7 + 216 p_up_6_7
   <= 216
 non_overlap_up_rev_6_7: - h_var_7 + y_grid_var_6 - y_grid_var_7
   - 216 p_up_6_7 <= 0
 non_overlap_any_6_8: p_left_6_8 + p_right_6_8 + p_down_6_8 + p_up_6_8
   >= 1
 non_overlap_left_6_8: w_var_6 + x_grid_var_6 - x_grid_var_8
   + 216 p_left_6_8 <= 216
 non_overlap_left_rev_6_8: - w_var_6 - x_grid_var_6 + x_grid_var_8
   - 216 p_left_6_8 <= 0
 non_overlap_right_6_8: w_var_8 - x_grid_var_6 + x_grid_var_8
   + 216 p_right_6_8 <= 216
 non_overlap_right_rev_6_8: - w_var_8 + x_grid_var_6 - x_grid_var_8
   - 216 p_right_6_8 <= 0
 non_overlap_down_6_8: h_var_6 + y_grid_var_6 - y_grid_var_8
   + 216 p_down_6_8 <= 216
 non_overlap_down_rev_6_8: - h_var_6 - y_grid_var_6 + y_grid_var_8
   - 216 p_down_6_8 <= 0
 non_overlap_up_6_8: h_var_8 - y_grid_var_6 + y_grid_var_8 + 216 p_up_6_8
   <= 216
 non_overlap_up_rev_6_8: - h_var_8 + y_grid_var_6 - y_grid_var_8
   - 216 p_up_6_8 <= 0
 non_overlap_any_6_9: p_left_6_9 + p_right_6_9 + p_down_6_9 + p_up_6_9
   >= 1
 non_overlap_left_6_9: w_var_6 + x_grid_var_6 - x_grid_var_9
   + 216 p_left_6_9 <= 216
 non_overlap_left_rev_6_9: - w_var_6 - x_grid_var_6 + x_grid_var_9
   - 216 p_left_6_9 <= 0
 non_overlap_right_6_9: w_var_9 - x_grid_var_6 + x_grid_var_9
   + 216 p_right_6_9 <= 216
 non_overlap_right_rev_6_9: - w_var_9 + x_grid_var_6 - x_grid_var_9
   - 216 p_right_6_9 <= 0
 non_overlap_down_6_9: h_var_6 + y_grid_var_6 - y_grid_var_9
   + 216 p_down_6_9 <= 216
 non_overlap_down_rev_6_9: - h_var_6 - y_grid_var_6 + y_grid_var_9
   - 216 p_down_6_9 <= 0
 non_overlap_up_6_9: h_var_9 - y_grid_var_6 + y_grid_var_9 + 216 p_up_6_9
   <= 216
 non_overlap_up_rev_6_9: - h_var_9 + y_grid_var_6 - y_grid_var_9
   - 216 p_up_6_9 <= 0
 non_overlap_any_6_10: p_left_6_10 + p_right_6_10 + p_down_6_10 + p_up_6_10
   >= 1
 non_overlap_left_6_10: w_var_6 + x_grid_var_6 - x_grid_var_10
   + 216 p_left_6_10 <= 216
 non_overlap_left_rev_6_10: - w_var_6 - x_grid_var_6 + x_grid_var_10
   - 216 p_left_6_10 <= 0
 non_overlap_right_6_10: w_var_10 - x_grid_var_6 + x_grid_var_10
   + 216 p_right_6_10 <= 216
 non_overlap_right_rev_6_10: - w_var_10 + x_grid_var_6 - x_grid_var_10
   - 216 p_right_6_10 <= 0
 non_overlap_down_6_10: h_var_6 + y_grid_var_6 - y_grid_var_10
   + 216 p_down_6_10 <= 216
 non_overlap_down_rev_6_10: - h_var_6 - y_grid_var_6 + y_grid_var_10
   - 216 p_down_6_10 <= 0
 non_overlap_up_6_10: h_var_10 - y_grid_var_6 + y_grid_var_10
   + 216 p_up_6_10 <= 216
 non_overlap_up_rev_6_10: - h_var_10 + y_grid_var_6 - y_grid_var_10
   - 216 p_up_6_10 <= 0
 non_overlap_any_6_11: p_left_6_11 + p_right_6_11 + p_down_6_11 + p_up_6_11
   >= 1
 non_overlap_left_6_11: w_var_6 + x_grid_var_6 - x_grid_var_11
   + 216 p_left_6_11 <= 216
 non_overlap_left_rev_6_11: - w_var_6 - x_grid_var_6 + x_grid_var_11
   - 216 p_left_6_11 <= 0
 non_overlap_right_6_11: w_var_11 - x_grid_var_6 + x_grid_var_11
   + 216 p_right_6_11 <= 216
 non_overlap_right_rev_6_11: - w_var_11 + x_grid_var_6 - x_grid_var_11
   - 216 p_right_6_11 <= 0
 non_overlap_down_6_11: h_var_6 + y_grid_var_6 - y_grid_var_11
   + 216 p_down_6_11 <= 216
 non_overlap_down_rev_6_11: - h_var_6 - y_grid_var_6 + y_grid_var_11
   - 216 p_down_6_11 <= 0
 non_overlap_up_6_11: h_var_11 - y_grid_var_6 + y_grid_var_11
   + 216 p_up_6_11 <= 216
 non_overlap_up_rev_6_11: - h_var_11 + y_grid_var_6 - y_grid_var_11
   - 216 p_up_6_11 <= 0
 non_overlap_any_6_12: p_left_6_12 + p_right_6_12 + p_down_6_12 + p_up_6_12
   >= 1
 non_overlap_left_6_12: w_var_6 + x_grid_var_6 - x_grid_var_12
   + 216 p_left_6_12 <= 216
 non_overlap_left_rev_6_12: - w_var_6 - x_grid_var_6 + x_grid_var_12
   - 216 p_left_6_12 <= 0
 non_overlap_right_6_12: w_var_12 - x_grid_var_6 + x_grid_var_12
   + 216 p_right_6_12 <= 216
 non_overlap_right_rev_6_12: - w_var_12 + x_grid_var_6 - x_grid_var_12
   - 216 p_right_6_12 <= 0
 non_overlap_down_6_12: h_var_6 + y_grid_var_6 - y_grid_var_12
   + 216 p_down_6_12 <= 216
 non_overlap_down_rev_6_12: - h_var_6 - y_grid_var_6 + y_grid_var_12
   - 216 p_down_6_12 <= 0
 non_overlap_up_6_12: h_var_12 - y_grid_var_6 + y_grid_var_12
   + 216 p_up_6_12 <= 216
 non_overlap_up_rev_6_12: - h_var_12 + y_grid_var_6 - y_grid_var_12
   - 216 p_up_6_12 <= 0
 non_overlap_any_6_13: p_left_6_13 + p_right_6_13 + p_down_6_13 + p_up_6_13
   >= 1
 non_overlap_left_6_13: w_var_6 + x_grid_var_6 - x_grid_var_13
   + 216 p_left_6_13 <= 216
 non_overlap_left_rev_6_13: - w_var_6 - x_grid_var_6 + x_grid_var_13
   - 216 p_left_6_13 <= 0
 non_overlap_right_6_13: w_var_13 - x_grid_var_6 + x_grid_var_13
   + 216 p_right_6_13 <= 216
 non_overlap_right_rev_6_13: - w_var_13 + x_grid_var_6 - x_grid_var_13
   - 216 p_right_6_13 <= 0
 non_overlap_down_6_13: h_var_6 + y_grid_var_6 - y_grid_var_13
   + 216 p_down_6_13 <= 216
 non_overlap_down_rev_6_13: - h_var_6 - y_grid_var_6 + y_grid_var_13
   - 216 p_down_6_13 <= 0
 non_overlap_up_6_13: h_var_13 - y_grid_var_6 + y_grid_var_13
   + 216 p_up_6_13 <= 216
 non_overlap_up_rev_6_13: - h_var_13 + y_grid_var_6 - y_grid_var_13
   - 216 p_up_6_13 <= 0
 non_overlap_any_7_8: p_left_7_8 + p_right_7_8 + p_down_7_8 + p_up_7_8
   >= 1
 non_overlap_left_7_8: w_var_7 + x_grid_var_7 - x_grid_var_8
   + 216 p_left_7_8 <= 216
 non_overlap_left_rev_7_8: - w_var_7 - x_grid_var_7 + x_grid_var_8
   - 216 p_left_7_8 <= 0
 non_overlap_right_7_8: w_var_8 - x_grid_var_7 + x_grid_var_8
   + 216 p_right_7_8 <= 216
 non_overlap_right_rev_7_8: - w_var_8 + x_grid_var_7 - x_grid_var_8
   - 216 p_right_7_8 <= 0
 non_overlap_down_7_8: h_var_7 + y_grid_var_7 - y_grid_var_8
   + 216 p_down_7_8 <= 216
 non_overlap_down_rev_7_8: - h_var_7 - y_grid_var_7 + y_grid_var_8
   - 216 p_down_7_8 <= 0
 non_overlap_up_7_8: h_var_8 - y_grid_var_7 + y_grid_var_8 + 216 p_up_7_8
   <= 216
 non_overlap_up_rev_7_8: - h_var_8 + y_grid_var_7 - y_grid_var_8
   - 216 p_up_7_8 <= 0
 non_overlap_any_7_9: p_left_7_9 + p_right_7_9 + p_down_7_9 + p_up_7_9
   >= 1
 non_overlap_left_7_9: w_var_7 + x_grid_var_7 - x_grid_var_9
   + 216 p_left_7_9 <= 216
 non_overlap_left_rev_7_9: - w_var_7 - x_grid_var_7 + x_grid_var_9
   - 216 p_left_7_9 <= 0
 non_overlap_right_7_9: w_var_9 - x_grid_var_7 + x_grid_var_9
   + 216 p_right_7_9 <= 216
 non_overlap_right_rev_7_9: - w_var_9 + x_grid_var_7 - x_grid_var_9
   - 216 p_right_7_9 <= 0
 non_overlap_down_7_9: h_var_7 + y_grid_var_7 - y_grid_var_9
   + 216 p_down_7_9 <= 216
 non_overlap_down_rev_7_9: - h_var_7 - y_grid_var_7 + y_grid_var_9
   - 216 p_down_7_9 <= 0
 non_overlap_up_7_9: h_var_9 - y_grid_var_7 + y_grid_var_9 + 216 p_up_7_9
   <= 216
 non_overlap_up_rev_7_9: - h_var_9 + y_grid_var_7 - y_grid_var_9
   - 216 p_up_7_9 <= 0
 non_overlap_any_7_10: p_left_7_10 + p_right_7_10 + p_down_7_10 + p_up_7_10
   >= 1
 non_overlap_left_7_10: w_var_7 + x_grid_var_7 - x_grid_var_10
   + 216 p_left_7_10 <= 216
 non_overlap_left_rev_7_10: - w_var_7 - x_grid_var_7 + x_grid_var_10
   - 216 p_left_7_10 <= 0
 non_overlap_right_7_10: w_var_10 - x_grid_var_7 + x_grid_var_10
   + 216 p_right_7_10 <= 216
 non_overlap_right_rev_7_10: - w_var_10 + x_grid_var_7 - x_grid_var_10
   - 216 p_right_7_10 <= 0
 non_overlap_down_7_10: h_var_7 + y_grid_var_7 - y_grid_var_10
   + 216 p_down_7_10 <= 216
 non_overlap_down_rev_7_10: - h_var_7 - y_grid_var_7 + y_grid_var_10
   - 216 p_down_7_10 <= 0
 non_overlap_up_7_10: h_var_10 - y_grid_var_7 + y_grid_var_10
   + 216 p_up_7_10 <= 216
 non_overlap_up_rev_7_10: - h_var_10 + y_grid_var_7 - y_grid_var_10
   - 216 p_up_7_10 <= 0
 non_overlap_any_7_11: p_left_7_11 + p_right_7_11 + p_down_7_11 + p_up_7_11
   >= 1
 non_overlap_left_7_11: w_var_7 + x_grid_var_7 - x_grid_var_11
   + 216 p_left_7_11 <= 216
 non_overlap_left_rev_7_11: - w_var_7 - x_grid_var_7 + x_grid_var_11
   - 216 p_left_7_11 <= 0
 non_overlap_right_7_11: w_var_11 - x_grid_var_7 + x_grid_var_11
   + 216 p_right_7_11 <= 216
 non_overlap_right_rev_7_11: - w_var_11 + x_grid_var_7 - x_grid_var_11
   - 216 p_right_7_11 <= 0
 non_overlap_down_7_11: h_var_7 + y_grid_var_7 - y_grid_var_11
   + 216 p_down_7_11 <= 216
 non_overlap_down_rev_7_11: - h_var_7 - y_grid_var_7 + y_grid_var_11
   - 216 p_down_7_11 <= 0
 non_overlap_up_7_11: h_var_11 - y_grid_var_7 + y_grid_var_11
   + 216 p_up_7_11 <= 216
 non_overlap_up_rev_7_11: - h_var_11 + y_grid_var_7 - y_grid_var_11
   - 216 p_up_7_11 <= 0
 non_overlap_any_7_12: p_left_7_12 + p_right_7_12 + p_down_7_12 + p_up_7_12
   >= 1
 non_overlap_left_7_12: w_var_7 + x_grid_var_7 - x_grid_var_12
   + 216 p_left_7_12 <= 216
 non_overlap_left_rev_7_12: - w_var_7 - x_grid_var_7 + x_grid_var_12
   - 216 p_left_7_12 <= 0
 non_overlap_right_7_12: w_var_12 - x_grid_var_7 + x_grid_var_12
   + 216 p_right_7_12 <= 216
 non_overlap_right_rev_7_12: - w_var_12 + x_grid_var_7 - x_grid_var_12
   - 216 p_right_7_12 <= 0
 non_overlap_down_7_12: h_var_7 + y_grid_var_7 - y_grid_var_12
   + 216 p_down_7_12 <= 216
 non_overlap_down_rev_7_12: - h_var_7 - y_grid_var_7 + y_grid_var_12
   - 216 p_down_7_12 <= 0
 non_overlap_up_7_12: h_var_12 - y_grid_var_7 + y_grid_var_12
   + 216 p_up_7_12 <= 216
 non_overlap_up_rev_7_12: - h_var_12 + y_grid_var_7 - y_grid_var_12
   - 216 p_up_7_12 <= 0
 non_overlap_any_7_13: p_left_7_13 + p_right_7_13 + p_down_7_13 + p_up_7_13
   >= 1
 non_overlap_left_7_13: w_var_7 + x_grid_var_7 - x_grid_var_13
   + 216 p_left_7_13 <= 216
 non_overlap_left_rev_7_13: - w_var_7 - x_grid_var_7 + x_grid_var_13
   - 216 p_left_7_13 <= 0
 non_overlap_right_7_13: w_var_13 - x_grid_var_7 + x_grid_var_13
   + 216 p_right_7_13 <= 216
 non_overlap_right_rev_7_13: - w_var_13 + x_grid_var_7 - x_grid_var_13
   - 216 p_right_7_13 <= 0
 non_overlap_down_7_13: h_var_7 + y_grid_var_7 - y_grid_var_13
   + 216 p_down_7_13 <= 216
 non_overlap_down_rev_7_13: - h_var_7 - y_grid_var_7 + y_grid_var_13
   - 216 p_down_7_13 <= 0
 non_overlap_up_7_13: h_var_13 - y_grid_var_7 + y_grid_var_13
   + 216 p_up_7_13 <= 216
 non_overlap_up_rev_7_13: - h_var_13 + y_grid_var_7 - y_grid_var_13
   - 216 p_up_7_13 <= 0
 non_overlap_any_8_9: p_left_8_9 + p_right_8_9 + p_down_8_9 + p_up_8_9
   >= 1
 non_overlap_left_8_9: w_var_8 + x_grid_var_8 - x_grid_var_9
   + 216 p_left_8_9 <= 216
 non_overlap_left_rev_8_9: - w_var_8 - x_grid_var_8 + x_grid_var_9
   - 216 p_left_8_9 <= 0
 non_overlap_right_8_9: w_var_9 - x_grid_var_8 + x_grid_var_9
   + 216 p_right_8_9 <= 216
 non_overlap_right_rev_8_9: - w_var_9 + x_grid_var_8 - x_grid_var_9
   - 216 p_right_8_9 <= 0
 non_overlap_down_8_9: h_var_8 + y_grid_var_8 - y_grid_var_9
   + 216 p_down_8_9 <= 216
 non_overlap_down_rev_8_9: - h_var_8 - y_grid_var_8 + y_grid_var_9
   - 216 p_down_8_9 <= 0
 non_overlap_up_8_9: h_var_9 - y_grid_var_8 + y_grid_var_9 + 216 p_up_8_9
   <= 216
 non_overlap_up_rev_8_9: - h_var_9 + y_grid_var_8 - y_grid_var_9
   - 216 p_up_8_9 <= 0
 non_overlap_any_8_10: p_left_8_10 + p_right_8_10 + p_down_8_10 + p_up_8_10
   >= 1
 non_overlap_left_8_10: w_var_8 + x_grid_var_8 - x_grid_var_10
   + 216 p_left_8_10 <= 216
 non_overlap_left_rev_8_10: - w_var_8 - x_grid_var_8 + x_grid_var_10
   - 216 p_left_8_10 <= 0
 non_overlap_right_8_10: w_var_10 - x_grid_var_8 + x_grid_var_10
   + 216 p_right_8_10 <= 216
 non_overlap_right_rev_8_10: - w_var_10 + x_grid_var_8 - x_grid_var_10
   - 216 p_right_8_10 <= 0
 non_overlap_down_8_10: h_var_8 + y_grid_var_8 - y_grid_var_10
   + 216 p_down_8_10 <= 216
 non_overlap_down_rev_8_10: - h_var_8 - y_grid_var_8 + y_grid_var_10
   - 216 p_down_8_10 <= 0
 non_overlap_up_8_10: h_var_10 - y_grid_var_8 + y_grid_var_10
   + 216 p_up_8_10 <= 216
 non_overlap_up_rev_8_10: - h_var_10 + y_grid_var_8 - y_grid_var_10
   - 216 p_up_8_10 <= 0
 non_overlap_any_8_11: p_left_8_11 + p_right_8_11 + p_down_8_11 + p_up_8_11
   >= 1
 non_overlap_left_8_11: w_var_8 + x_grid_var_8 - x_grid_var_11
   + 216 p_left_8_11 <= 216
 non_overlap_left_rev_8_11: - w_var_8 - x_grid_var_8 + x_grid_var_11
   - 216 p_left_8_11 <= 0
 non_overlap_right_8_11: w_var_11 - x_grid_var_8 + x_grid_var_11
   + 216 p_right_8_11 <= 216
 non_overlap_right_rev_8_11: - w_var_11 + x_grid_var_8 - x_grid_var_11
   - 216 p_right_8_11 <= 0
 non_overlap_down_8_11: h_var_8 + y_grid_var_8 - y_grid_var_11
   + 216 p_down_8_11 <= 216
 non_overlap_down_rev_8_11: - h_var_8 - y_grid_var_8 + y_grid_var_11
   - 216 p_down_8_11 <= 0
 non_overlap_up_8_11: h_var_11 - y_grid_var_8 + y_grid_var_11
   + 216 p_up_8_11 <= 216
 non_overlap_up_rev_8_11: - h_var_11 + y_grid_var_8 - y_grid_var_11
   - 216 p_up_8_11 <= 0
 non_overlap_any_8_12: p_left_8_12 + p_right_8_12 + p_down_8_12 + p_up_8_12
   >= 1
 non_overlap_left_8_12: w_var_8 + x_grid_var_8 - x_grid_var_12
   + 216 p_left_8_12 <= 216
 non_overlap_left_rev_8_12: - w_var_8 - x_grid_var_8 + x_grid_var_12
   - 216 p_left_8_12 <= 0
 non_overlap_right_8_12: w_var_12 - x_grid_var_8 + x_grid_var_12
   + 216 p_right_8_12 <= 216
 non_overlap_right_rev_8_12: - w_var_12 + x_grid_var_8 - x_grid_var_12
   - 216 p_right_8_12 <= 0
 non_overlap_down_8_12: h_var_8 + y_grid_var_8 - y_grid_var_12
   + 216 p_down_8_12 <= 216
 non_overlap_down_rev_8_12: - h_var_8 - y_grid_var_8 + y_grid_var_12
   - 216 p_down_8_12 <= 0
 non_overlap_up_8_12: h_var_12 - y_grid_var_8 + y_grid_var_12
   + 216 p_up_8_12 <= 216
 non_overlap_up_rev_8_12: - h_var_12 + y_grid_var_8 - y_grid_var_12
   - 216 p_up_8_12 <= 0
 non_overlap_any_8_13: p_left_8_13 + p_right_8_13 + p_down_8_13 + p_up_8_13
   >= 1
 non_overlap_left_8_13: w_var_8 + x_grid_var_8 - x_grid_var_13
   + 216 p_left_8_13 <= 216
 non_overlap_left_rev_8_13: - w_var_8 - x_grid_var_8 + x_grid_var_13
   - 216 p_left_8_13 <= 0
 non_overlap_right_8_13: w_var_13 - x_grid_var_8 + x_grid_var_13
   + 216 p_right_8_13 <= 216
 non_overlap_right_rev_8_13: - w_var_13 + x_grid_var_8 - x_grid_var_13
   - 216 p_right_8_13 <= 0
 non_overlap_down_8_13: h_var_8 + y_grid_var_8 - y_grid_var_13
   + 216 p_down_8_13 <= 216
 non_overlap_down_rev_8_13: - h_var_8 - y_grid_var_8 + y_grid_var_13
   - 216 p_down_8_13 <= 0
 non_overlap_up_8_13: h_var_13 - y_grid_var_8 + y_grid_var_13
   + 216 p_up_8_13 <= 216
 non_overlap_up_rev_8_13: - h_var_13 + y_grid_var_8 - y_grid_var_13
   - 216 p_up_8_13 <= 0
 non_overlap_any_9_10: p_left_9_10 + p_right_9_10 + p_down_9_10 + p_up_9_10
   >= 1
 non_overlap_left_9_10: w_var_9 + x_grid_var_9 - x_grid_var_10
   + 216 p_left_9_10 <= 216
 non_overlap_left_rev_9_10: - w_var_9 - x_grid_var_9 + x_grid_var_10
   - 216 p_left_9_10 <= 0
 non_overlap_right_9_10: w_var_10 - x_grid_var_9 + x_grid_var_10
   + 216 p_right_9_10 <= 216
 non_overlap_right_rev_9_10: - w_var_10 + x_grid_var_9 - x_grid_var_10
   - 216 p_right_9_10 <= 0
 non_overlap_down_9_10: h_var_9 + y_grid_var_9 - y_grid_var_10
   + 216 p_down_9_10 <= 216
 non_overlap_down_rev_9_10: - h_var_9 - y_grid_var_9 + y_grid_var_10
   - 216 p_down_9_10 <= 0
 non_overlap_up_9_10: h_var_10 - y_grid_var_9 + y_grid_var_10
   + 216 p_up_9_10 <= 216
 non_overlap_up_rev_9_10: - h_var_10 + y_grid_var_9 - y_grid_var_10
   - 216 p_up_9_10 <= 0
 non_overlap_any_9_11: p_left_9_11 + p_right_9_11 + p_down_9_11 + p_up_9_11
   >= 1
 non_overlap_left_9_11: w_var_9 + x_grid_var_9 - x_grid_var_11
   + 216 p_left_9_11 <= 216
 non_overlap_left_rev_9_11: - w_var_9 - x_grid_var_9 + x_grid_var_11
   - 216 p_left_9_11 <= 0
 non_overlap_right_9_11: w_var_11 - x_grid_var_9 + x_grid_var_11
   + 216 p_right_9_11 <= 216
 non_overlap_right_rev_9_11: - w_var_11 + x_grid_var_9 - x_grid_var_11
   - 216 p_right_9_11 <= 0
 non_overlap_down_9_11: h_var_9 + y_grid_var_9 - y_grid_var_11
   + 216 p_down_9_11 <= 216
 non_overlap_down_rev_9_11: - h_var_9 - y_grid_var_9 + y_grid_var_11
   - 216 p_down_9_11 <= 0
 non_overlap_up_9_11: h_var_11 - y_grid_var_9 + y_grid_var_11
   + 216 p_up_9_11 <= 216
 non_overlap_up_rev_9_11: - h_var_11 + y_grid_var_9 - y_grid_var_11
   - 216 p_up_9_11 <= 0
 non_overlap_any_9_12: p_left_9_12 + p_right_9_12 + p_down_9_12 + p_up_9_12
   >= 1
 non_overlap_left_9_12: w_var_9 + x_grid_var_9 - x_grid_var_12
   + 216 p_left_9_12 <= 216
 non_overlap_left_rev_9_12: - w_var_9 - x_grid_var_9 + x_grid_var_12
   - 216 p_left_9_12 <= 0
 non_overlap_right_9_12: w_var_12 - x_grid_var_9 + x_grid_var_12
   + 216 p_right_9_12 <= 216
 non_overlap_right_rev_9_12: - w_var_12 + x_grid_var_9 - x_grid_var_12
   - 216 p_right_9_12 <= 0
 non_overlap_down_9_12: h_var_9 + y_grid_var_9 - y_grid_var_12
   + 216 p_down_9_12 <= 216
 non_overlap_down_rev_9_12: - h_var_9 - y_grid_var_9 + y_grid_var_12
   - 216 p_down_9_12 <= 0
 non_overlap_up_9_12: h_var_12 - y_grid_var_9 + y_grid_var_12
   + 216 p_up_9_12 <= 216
 non_overlap_up_rev_9_12: - h_var_12 + y_grid_var_9 - y_grid_var_12
   - 216 p_up_9_12 <= 0
 non_overlap_any_9_13: p_left_9_13 + p_right_9_13 + p_down_9_13 + p_up_9_13
   >= 1
 non_overlap_left_9_13: w_var_9 + x_grid_var_9 - x_grid_var_13
   + 216 p_left_9_13 <= 216
 non_overlap_left_rev_9_13: - w_var_9 - x_grid_var_9 + x_grid_var_13
   - 216 p_left_9_13 <= 0
 non_overlap_right_9_13: w_var_13 - x_grid_var_9 + x_grid_var_13
   + 216 p_right_9_13 <= 216
 non_overlap_right_rev_9_13: - w_var_13 + x_grid_var_9 - x_grid_var_13
   - 216 p_right_9_13 <= 0
 non_overlap_down_9_13: h_var_9 + y_grid_var_9 - y_grid_var_13
   + 216 p_down_9_13 <= 216
 non_overlap_down_rev_9_13: - h_var_9 - y_grid_var_9 + y_grid_var_13
   - 216 p_down_9_13 <= 0
 non_overlap_up_9_13: h_var_13 - y_grid_var_9 + y_grid_var_13
   + 216 p_up_9_13 <= 216
 non_overlap_up_rev_9_13: - h_var_13 + y_grid_var_9 - y_grid_var_13
   - 216 p_up_9_13 <= 0
 non_overlap_any_10_11: p_left_10_11 + p_right_10_11 + p_down_10_11
   + p_up_10_11 >= 1
 non_overlap_left_10_11: w_var_10 + x_grid_var_10 - x_grid_var_11
   + 216 p_left_10_11 <= 216
 non_overlap_left_rev_10_11: - w_var_10 - x_grid_var_10 + x_grid_var_11
   - 216 p_left_10_11 <= 0
 non_overlap_right_10_11: w_var_11 - x_grid_var_10 + x_grid_var_11
   + 216 p_right_10_11 <= 216
 non_overlap_right_rev_10_11: - w_var_11 + x_grid_var_10 - x_grid_var_11
   - 216 p_right_10_11 <= 0
 non_overlap_down_10_11: h_var_10 + y_grid_var_10 - y_grid_var_11
   + 216 p_down_10_11 <= 216
 non_overlap_down_rev_10_11: - h_var_10 - y_grid_var_10 + y_grid_var_11
   - 216 p_down_10_11 <= 0
 non_overlap_up_10_11: h_var_11 - y_grid_var_10 + y_grid_var_11
   + 216 p_up_10_11 <= 216
 non_overlap_up_rev_10_11: - h_var_11 + y_grid_var_10 - y_grid_var_11
   - 216 p_up_10_11 <= 0
 non_overlap_any_10_12: p_left_10_12 + p_right_10_12 + p_down_10_12
   + p_up_10_12 >= 1
 non_overlap_left_10_12: w_var_10 + x_grid_var_10 - x_grid_var_12
   + 216 p_left_10_12 <= 216
 non_overlap_left_rev_10_12: - w_var_10 - x_grid_var_10 + x_grid_var_12
   - 216 p_left_10_12 <= 0
 non_overlap_right_10_12: w_var_12 - x_grid_var_10 + x_grid_var_12
   + 216 p_right_10_12 <= 216
 non_overlap_right_rev_10_12: - w_var_12 + x_grid_var_10 - x_grid_var_12
   - 216 p_right_10_12 <= 0
 non_overlap_down_10_12: h_var_10 + y_grid_var_10 - y_grid_var_12
   + 216 p_down_10_12 <= 216
 non_overlap_down_rev_10_12: - h_var_10 - y_grid_var_10 + y_grid_var_12
   - 216 p_down_10_12 <= 0
 non_overlap_up_10_12: h_var_12 - y_grid_var_10 + y_grid_var_12
   + 216 p_up_10_12 <= 216
 non_overlap_up_rev_10_12: - h_var_12 + y_grid_var_10 - y_grid_var_12
   - 216 p_up_10_12 <= 0
 non_overlap_any_10_13: p_left_10_13 + p_right_10_13 + p_down_10_13
   + p_up_10_13 >= 1
 non_overlap_left_10_13: w_var_10 + x_grid_var_10 - x_grid_var_13
   + 216 p_left_10_13 <= 216
 non_overlap_left_rev_10_13: - w_var_10 - x_grid_var_10 + x_grid_var_13
   - 216 p_left_10_13 <= 0
 non_overlap_right_10_13: w_var_13 - x_grid_var_10 + x_grid_var_13
   + 216 p_right_10_13 <= 216
 non_overlap_right_rev_10_13: - w_var_13 + x_grid_var_10 - x_grid_var_13
   - 216 p_right_10_13 <= 0
 non_overlap_down_10_13: h_var_10 + y_grid_var_10 - y_grid_var_13
   + 216 p_down_10_13 <= 216
 non_overlap_down_rev_10_13: - h_var_10 - y_grid_var_10 + y_grid_var_13
   - 216 p_down_10_13 <= 0
 non_overlap_up_10_13: h_var_13 - y_grid_var_10 + y_grid_var_13
   + 216 p_up_10_13 <= 216
 non_overlap_up_rev_10_13: - h_var_13 + y_grid_var_10 - y_grid_var_13
   - 216 p_up_10_13 <= 0
 non_overlap_any_11_12: p_left_11_12 + p_right_11_12 + p_down_11_12
   + p_up_11_12 >= 1
 non_overlap_left_11_12: w_var_11 + x_grid_var_11 - x_grid_var_12
   + 216 p_left_11_12 <= 216
 non_overlap_left_rev_11_12: - w_var_11 - x_grid_var_11 + x_grid_var_12
   - 216 p_left_11_12 <= 0
 non_overlap_right_11_12: w_var_12 - x_grid_var_11 + x_grid_var_12
   + 216 p_right_11_12 <= 216
 non_overlap_right_rev_11_12: - w_var_12 + x_grid_var_11 - x_grid_var_12
   - 216 p_right_11_12 <= 0
 non_overlap_down_11_12: h_var_11 + y_grid_var_11 - y_grid_var_12
   + 216 p_down_11_12 <= 216
 non_overlap_down_rev_11_12: - h_var_11 - y_grid_var_11 + y_grid_var_12
   - 216 p_down_11_12 <= 0
 non_overlap_up_11_12: h_var_12 - y_grid_var_11 + y_grid_var_12
   + 216 p_up_11_12 <= 216
 non_overlap_up_rev_11_12: - h_var_12 + y_grid_var_11 - y_grid_var_12
   - 216 p_up_11_12 <= 0
 non_overlap_any_11_13: p_left_11_13 + p_right_11_13 + p_down_11_13
   + p_up_11_13 >= 1
 non_overlap_left_11_13: w_var_11 + x_grid_var_11 - x_grid_var_13
   + 216 p_left_11_13 <= 216
 non_overlap_left_rev_11_13: - w_var_11 - x_grid_var_11 + x_grid_var_13
   - 216 p_left_11_13 <= 0
 non_overlap_right_11_13: w_var_13 - x_grid_var_11 + x_grid_var_13
   + 216 p_right_11_13 <= 216
 non_overlap_right_rev_11_13: - w_var_13 + x_grid_var_11 - x_grid_var_13
   - 216 p_right_11_13 <= 0
 non_overlap_down_11_13: h_var_11 + y_grid_var_11 - y_grid_var_13
   + 216 p_down_11_13 <= 216
 non_overlap_down_rev_11_13: - h_var_11 - y_grid_var_11 + y_grid_var_13
   - 216 p_down_11_13 <= 0
 non_overlap_up_11_13: h_var_13 - y_grid_var_11 + y_grid_var_13
   + 216 p_up_11_13 <= 216
 non_overlap_up_rev_11_13: - h_var_13 + y_grid_var_11 - y_grid_var_13
   - 216 p_up_11_13 <= 0
 non_overlap_any_12_13: p_left_12_13 + p_right_12_13 + p_down_12_13
   + p_up_12_13 >= 1
 non_overlap_left_12_13: w_var_12 + x_grid_var_12 - x_grid_var_13
   + 216 p_left_12_13 <= 216
 non_overlap_left_rev_12_13: - w_var_12 - x_grid_var_12 + x_grid_var_13
   - 216 p_left_12_13 <= 0
 non_overlap_right_12_13: w_var_13 - x_grid_var_12 + x_grid_var_13
   + 216 p_right_12_13 <= 216
 non_overlap_right_rev_12_13: - w_var_13 + x_grid_var_12 - x_grid_var_13
   - 216 p_right_12_13 <= 0
 non_overlap_down_12_13: h_var_12 + y_grid_var_12 - y_grid_var_13
   + 216 p_down_12_13 <= 216
 non_overlap_down_rev_12_13: - h_var_12 - y_grid_var_12 + y_grid_var_13
   - 216 p_down_12_13 <= 0
 non_overlap_up_12_13: h_var_13 - y_grid_var_12 + y_grid_var_13
   + 216 p_up_12_13 <= 216
 non_overlap_up_rev_12_13: - h_var_13 + y_grid_var_12 - y_grid_var_13
   - 216 p_up_12_13 <= 0
 EMIB_non_overlap_any_0_3_3_7: p_EMIB_left_0_3_3_7 + p_EMIB_right_0_3_3_7
   + p_EMIB_down_0_3_3_7 + p_EMIB_up_0_3_3_7 >= 1
 EMIB_non_overlap_left_0_3_3_7: EMIB_w_var_0_3 + EMIB_x_grid_var_0_3
   - EMIB_x_grid_var_3_7 + 216 p_EMIB_left_0_3_3_7 <= 216
 EMIB_non_overlap_left_rev_0_3_3_7: - EMIB_w_var_0_3 - EMIB_x_grid_var_0_3
   + EMIB_x_grid_var_3_7 - 216 p_EMIB_left_0_3_3_7 <= 0
 EMIB_non_overlap_right_0_3_3_7: EMIB_w_var_3_7 - EMIB_x_grid_var_0_3
   + EMIB_x_grid_var_3_7 + 216 p_EMIB_right_0_3_3_7 <= 216
 EMIB_non_overlap_right_rev_0_3_3_7: - EMIB_w_var_3_7 + EMIB_x_grid_var_0_3
   - EMIB_x_grid_var_3_7 - 216 p_EMIB_right_0_3_3_7 <= 0
 EMIB_non_overlap_down_0_3_3_7: EMIB_h_var_0_3 + EMIB_y_grid_var_0_3
   - EMIB_y_grid_var_3_7 + 216 p_EMIB_down_0_3_3_7 <= 216
 EMIB_non_overlap_down_rev_0_3_3_7: - EMIB_h_var_0_3 - EMIB_y_grid_var_0_3
   + EMIB_y_grid_var_3_7 - 216 p_EMIB_down_0_3_3_7 <= 0
 EMIB_non_overlap_up_0_3_3_7: EMIB_h_var_3_7 - EMIB_y_grid_var_0_3
   + EMIB_y_grid_var_3_7 + 216 p_EMIB_up_0_3_3_7 <= 216
 EMIB_non_overlap_up_rev_0_3_3_7: - EMIB_h_var_3_7 + EMIB_y_grid_var_0_3
   - EMIB_y_grid_var_3_7 - 216 p_EMIB_up_0_3_3_7 <= 0
 EMIB_non_overlap_any_0_3_3_10: p_EMIB_left_0_3_3_10
   + p_EMIB_right_0_3_3_10 + p_EMIB_down_0_3_3_10 + p_EMIB_up_0_3_3_10
   >= 1
 EMIB_non_overlap_left_0_3_3_10: EMIB_w_var_0_3 + EMIB_x_grid_var_0_3
   - EMIB_x_grid_var_3_10 + 216 p_EMIB_left_0_3_3_10 <= 216
 EMIB_non_overlap_left_rev_0_3_3_10: - EMIB_w_var_0_3 - EMIB_x_grid_var_0_3
   + EMIB_x_grid_var_3_10 - 216 p_EMIB_left_0_3_3_10 <= 0
 EMIB_non_overlap_right_0_3_3_10: EMIB_w_var_3_10 - EMIB_x_grid_var_0_3
   + EMIB_x_grid_var_3_10 + 216 p_EMIB_right_0_3_3_10 <= 216
 EMIB_non_overlap_right_rev_0_3_3_10: - EMIB_w_var_3_10
   + EMIB_x_grid_var_0_3 - EMIB_x_grid_var_3_10 - 216 p_EMIB_right_0_3_3_10
   <= 0
 EMIB_non_overlap_down_0_3_3_10: EMIB_h_var_0_3 + EMIB_y_grid_var_0_3
   - EMIB_y_grid_var_3_10 + 216 p_EMIB_down_0_3_3_10 <= 216
 EMIB_non_overlap_down_rev_0_3_3_10: - EMIB_h_var_0_3 - EMIB_y_grid_var_0_3
   + EMIB_y_grid_var_3_10 - 216 p_EMIB_down_0_3_3_10 <= 0
 EMIB_non_overlap_up_0_3_3_10: EMIB_h_var_3_10 - EMIB_y_grid_var_0_3
   + EMIB_y_grid_var_3_10 + 216 p_EMIB_up_0_3_3_10 <= 216
 EMIB_non_overlap_up_rev_0_3_3_10: - EMIB_h_var_3_10 + EMIB_y_grid_var_0_3
   - EMIB_y_grid_var_3_10 - 216 p_EMIB_up_0_3_3_10 <= 0
 EMIB_non_overlap_any_1_7_3_7: p_EMIB_left_1_7_3_7 + p_EMIB_right_1_7_3_7
   + p_EMIB_down_1_7_3_7 + p_EMIB_up_1_7_3_7 >= 1
 EMIB_non_overlap_left_1_7_3_7: EMIB_w_var_1_7 + EMIB_x_grid_var_1_7
   - EMIB_x_grid_var_3_7 + 216 p_EMIB_left_1_7_3_7 <= 216
 EMIB_non_overlap_left_rev_1_7_3_7: - EMIB_w_var_1_7 - EMIB_x_grid_var_1_7
   + EMIB_x_grid_var_3_7 - 216 p_EMIB_left_1_7_3_7 <= 0
 EMIB_non_overlap_right_1_7_3_7: EMIB_w_var_3_7 - EMIB_x_grid_var_1_7
   + EMIB_x_grid_var_3_7 + 216 p_EMIB_right_1_7_3_7 <= 216
 EMIB_non_overlap_right_rev_1_7_3_7: - EMIB_w_var_3_7 + EMIB_x_grid_var_1_7
   - EMIB_x_grid_var_3_7 - 216 p_EMIB_right_1_7_3_7 <= 0
 EMIB_non_overlap_down_1_7_3_7: EMIB_h_var_1_7 + EMIB_y_grid_var_1_7
   - EMIB_y_grid_var_3_7 + 216 p_EMIB_down_1_7_3_7 <= 216
 EMIB_non_overlap_down_rev_1_7_3_7: - EMIB_h_var_1_7 - EMIB_y_grid_var_1_7
   + EMIB_y_grid_var_3_7 - 216 p_EMIB_down_1_7_3_7 <= 0
 EMIB_non_overlap_up_1_7_3_7: EMIB_h_var_3_7 - EMIB_y_grid_var_1_7
   + EMIB_y_grid_var_3_7 + 216 p_EMIB_up_1_7_3_7 <= 216
 EMIB_non_overlap_up_rev_1_7_3_7: - EMIB_h_var_3_7 + EMIB_y_grid_var_1_7
   - EMIB_y_grid_var_3_7 - 216 p_EMIB_up_1_7_3_7 <= 0
 EMIB_non_overlap_any_1_7_7_11: p_EMIB_left_1_7_7_11
   + p_EMIB_right_1_7_7_11 + p_EMIB_down_1_7_7_11 + p_EMIB_up_1_7_7_11
   >= 1
 EMIB_non_overlap_left_1_7_7_11: EMIB_w_var_1_7 + EMIB_x_grid_var_1_7
   - EMIB_x_grid_var_7_11 + 216 p_EMIB_left_1_7_7_11 <= 216
 EMIB_non_overlap_left_rev_1_7_7_11: - EMIB_w_var_1_7 - EMIB_x_grid_var_1_7
   + EMIB_x_grid_var_7_11 - 216 p_EMIB_left_1_7_7_11 <= 0
 EMIB_non_overlap_right_1_7_7_11: EMIB_w_var_7_11 - EMIB_x_grid_var_1_7
   + EMIB_x_grid_var_7_11 + 216 p_EMIB_right_1_7_7_11 <= 216
 EMIB_non_overlap_right_rev_1_7_7_11: - EMIB_w_var_7_11
   + EMIB_x_grid_var_1_7 - EMIB_x_grid_var_7_11 - 216 p_EMIB_right_1_7_7_11
   <= 0
 EMIB_non_overlap_down_1_7_7_11: EMIB_h_var_1_7 + EMIB_y_grid_var_1_7
   - EMIB_y_grid_var_7_11 + 216 p_EMIB_down_1_7_7_11 <= 216
 EMIB_non_overlap_down_rev_1_7_7_11: - EMIB_h_var_1_7 - EMIB_y_grid_var_1_7
   + EMIB_y_grid_var_7_11 - 216 p_EMIB_down_1_7_7_11 <= 0
 EMIB_non_overlap_up_1_7_7_11: EMIB_h_var_7_11 - EMIB_y_grid_var_1_7
   + EMIB_y_grid_var_7_11 + 216 p_EMIB_up_1_7_7_11 <= 216
 EMIB_non_overlap_up_rev_1_7_7_11: - EMIB_h_var_7_11 + EMIB_y_grid_var_1_7
   - EMIB_y_grid_var_7_11 - 216 p_EMIB_up_1_7_7_11 <= 0
 EMIB_non_overlap_any_2_11_2_12: p_EMIB_left_2_11_2_12
   + p_EMIB_right_2_11_2_12 + p_EMIB_down_2_11_2_12 + p_EMIB_up_2_11_2_12
   >= 1
 EMIB_non_overlap_left_2_11_2_12: EMIB_w_var_2_11 + EMIB_x_grid_var_2_11
   - EMIB_x_grid_var_2_12 + 216 p_EMIB_left_2_11_2_12 <= 216
 EMIB_non_overlap_left_rev_2_11_2_12: - EMIB_w_var_2_11
   - EMIB_x_grid_var_2_11 + EMIB_x_grid_var_2_12
   - 216 p_EMIB_left_2_11_2_12 <= 0
 EMIB_non_overlap_right_2_11_2_12: EMIB_w_var_2_12 - EMIB_x_grid_var_2_11
   + EMIB_x_grid_var_2_12 + 216 p_EMIB_right_2_11_2_12 <= 216
 EMIB_non_overlap_right_rev_2_11_2_12: - EMIB_w_var_2_12
   + EMIB_x_grid_var_2_11 - EMIB_x_grid_var_2_12
   - 216 p_EMIB_right_2_11_2_12 <= 0
 EMIB_non_overlap_down_2_11_2_12: EMIB_h_var_2_11 + EMIB_y_grid_var_2_11
   - EMIB_y_grid_var_2_12 + 216 p_EMIB_down_2_11_2_12 <= 216
 EMIB_non_overlap_down_rev_2_11_2_12: - EMIB_h_var_2_11
   - EMIB_y_grid_var_2_11 + EMIB_y_grid_var_2_12
   - 216 p_EMIB_down_2_11_2_12 <= 0
 EMIB_non_overlap_up_2_11_2_12: EMIB_h_var_2_12 - EMIB_y_grid_var_2_11
   + EMIB_y_grid_var_2_12 + 216 p_EMIB_up_2_11_2_12 <= 216
 EMIB_non_overlap_up_rev_2_11_2_12: - EMIB_h_var_2_12
   + EMIB_y_grid_var_2_11 - EMIB_y_grid_var_2_12 - 216 p_EMIB_up_2_11_2_12
   <= 0
 EMIB_non_overlap_any_2_11_7_11: p_EMIB_left_2_11_7_11
   + p_EMIB_right_2_11_7_11 + p_EMIB_down_2_11_7_11 + p_EMIB_up_2_11_7_11
   >= 1
 EMIB_non_overlap_left_2_11_7_11: EMIB_w_var_2_11 + EMIB_x_grid_var_2_11
   - EMIB_x_grid_var_7_11 + 216 p_EMIB_left_2_11_7_11 <= 216
 EMIB_non_overlap_left_rev_2_11_7_11: - EMIB_w_var_2_11
   - EMIB_x_grid_var_2_11 + EMIB_x_grid_var_7_11
   - 216 p_EMIB_left_2_11_7_11 <= 0
 EMIB_non_overlap_right_2_11_7_11: EMIB_w_var_7_11 - EMIB_x_grid_var_2_11
   + EMIB_x_grid_var_7_11 + 216 p_EMIB_right_2_11_7_11 <= 216
 EMIB_non_overlap_right_rev_2_11_7_11: - EMIB_w_var_7_11
   + EMIB_x_grid_var_2_11 - EMIB_x_grid_var_7_11
   - 216 p_EMIB_right_2_11_7_11 <= 0
 EMIB_non_overlap_down_2_11_7_11: EMIB_h_var_2_11 + EMIB_y_grid_var_2_11
   - EMIB_y_grid_var_7_11 + 216 p_EMIB_down_2_11_7_11 <= 216
 EMIB_non_overlap_down_rev_2_11_7_11: - EMIB_h_var_2_11
   - EMIB_y_grid_var_2_11 + EMIB_y_grid_var_7_11
   - 216 p_EMIB_down_2_11_7_11 <= 0
 EMIB_non_overlap_up_2_11_7_11: EMIB_h_var_7_11 - EMIB_y_grid_var_2_11
   + EMIB_y_grid_var_7_11 + 216 p_EMIB_up_2_11_7_11 <= 216
 EMIB_non_overlap_up_rev_2_11_7_11: - EMIB_h_var_7_11
   + EMIB_y_grid_var_2_11 - EMIB_y_grid_var_7_11 - 216 p_EMIB_up_2_11_7_11
   <= 0
 EMIB_non_overlap_any_2_12_8_12: p_EMIB_left_2_12_8_12
   + p_EMIB_right_2_12_8_12 + p_EMIB_down_2_12_8_12 + p_EMIB_up_2_12_8_12
   >= 1
 EMIB_non_overlap_left_2_12_8_12: EMIB_w_var_2_12 + EMIB_x_grid_var_2_12
   - EMIB_x_grid_var_8_12 + 216 p_EMIB_left_2_12_8_12 <= 216
 EMIB_non_overlap_left_rev_2_12_8_12: - EMIB_w_var_2_12
   - EMIB_x_grid_var_2_12 + EMIB_x_grid_var_8_12
   - 216 p_EMIB_left_2_12_8_12 <= 0
 EMIB_non_overlap_right_2_12_8_12: EMIB_w_var_8_12 - EMIB_x_grid_var_2_12
   + EMIB_x_grid_var_8_12 + 216 p_EMIB_right_2_12_8_12 <= 216
 EMIB_non_overlap_right_rev_2_12_8_12: - EMIB_w_var_8_12
   + EMIB_x_grid_var_2_12 - EMIB_x_grid_var_8_12
   - 216 p_EMIB_right_2_12_8_12 <= 0
 EMIB_non_overlap_down_2_12_8_12: EMIB_h_var_2_12 + EMIB_y_grid_var_2_12
   - EMIB_y_grid_var_8_12 + 216 p_EMIB_down_2_12_8_12 <= 216
 EMIB_non_overlap_down_rev_2_12_8_12: - EMIB_h_var_2_12
   - EMIB_y_grid_var_2_12 + EMIB_y_grid_var_8_12
   - 216 p_EMIB_down_2_12_8_12 <= 0
 EMIB_non_overlap_up_2_12_8_12: EMIB_h_var_8_12 - EMIB_y_grid_var_2_12
   + EMIB_y_grid_var_8_12 + 216 p_EMIB_up_2_12_8_12 <= 216
 EMIB_non_overlap_up_rev_2_12_8_12: - EMIB_h_var_8_12
   + EMIB_y_grid_var_2_12 - EMIB_y_grid_var_8_12 - 216 p_EMIB_up_2_12_8_12
   <= 0
 EMIB_non_overlap_any_2_12_10_12: p_EMIB_left_2_12_10_12
   + p_EMIB_right_2_12_10_12 + p_EMIB_down_2_12_10_12
   + p_EMIB_up_2_12_10_12 >= 1
 EMIB_non_overlap_left_2_12_10_12: EMIB_w_var_2_12 + EMIB_x_grid_var_2_12
   - EMIB_x_grid_var_10_12 + 216 p_EMIB_left_2_12_10_12 <= 216
 EMIB_non_overlap_left_rev_2_12_10_12: - EMIB_w_var_2_12
   - EMIB_x_grid_var_2_12 + EMIB_x_grid_var_10_12
   - 216 p_EMIB_left_2_12_10_12 <= 0
 EMIB_non_overlap_right_2_12_10_12: EMIB_w_var_10_12 - EMIB_x_grid_var_2_12
   + EMIB_x_grid_var_10_12 + 216 p_EMIB_right_2_12_10_12 <= 216
 EMIB_non_overlap_right_rev_2_12_10_12: - EMIB_w_var_10_12
   + EMIB_x_grid_var_2_12 - EMIB_x_grid_var_10_12
   - 216 p_EMIB_right_2_12_10_12 <= 0
 EMIB_non_overlap_down_2_12_10_12: EMIB_h_var_2_12 + EMIB_y_grid_var_2_12
   - EMIB_y_grid_var_10_12 + 216 p_EMIB_down_2_12_10_12 <= 216
 EMIB_non_overlap_down_rev_2_12_10_12: - EMIB_h_var_2_12
   - EMIB_y_grid_var_2_12 + EMIB_y_grid_var_10_12
   - 216 p_EMIB_down_2_12_10_12 <= 0
 EMIB_non_overlap_up_2_12_10_12: EMIB_h_var_10_12 - EMIB_y_grid_var_2_12
   + EMIB_y_grid_var_10_12 + 216 p_EMIB_up_2_12_10_12 <= 216
 EMIB_non_overlap_up_rev_2_12_10_12: - EMIB_h_var_10_12
   + EMIB_y_grid_var_2_12 - EMIB_y_grid_var_10_12
   - 216 p_EMIB_up_2_12_10_12 <= 0
 EMIB_non_overlap_any_3_7_3_10: p_EMIB_left_3_7_3_10
   + p_EMIB_right_3_7_3_10 + p_EMIB_down_3_7_3_10 + p_EMIB_up_3_7_3_10
   >= 1
 EMIB_non_overlap_left_3_7_3_10: EMIB_w_var_3_7 + EMIB_x_grid_var_3_7
   - EMIB_x_grid_var_3_10 + 216 p_EMIB_left_3_7_3_10 <= 216
 EMIB_non_overlap_left_rev_3_7_3_10: - EMIB_w_var_3_7 - EMIB_x_grid_var_3_7
   + EMIB_x_grid_var_3_10 - 216 p_EMIB_left_3_7_3_10 <= 0
 EMIB_non_overlap_right_3_7_3_10: EMIB_w_var_3_10 - EMIB_x_grid_var_3_7
   + EMIB_x_grid_var_3_10 + 216 p_EMIB_right_3_7_3_10 <= 216
 EMIB_non_overlap_right_rev_3_7_3_10: - EMIB_w_var_3_10
   + EMIB_x_grid_var_3_7 - EMIB_x_grid_var_3_10 - 216 p_EMIB_right_3_7_3_10
   <= 0
 EMIB_non_overlap_down_3_7_3_10: EMIB_h_var_3_7 + EMIB_y_grid_var_3_7
   - EMIB_y_grid_var_3_10 + 216 p_EMIB_down_3_7_3_10 <= 216
 EMIB_non_overlap_down_rev_3_7_3_10: - EMIB_h_var_3_7 - EMIB_y_grid_var_3_7
   + EMIB_y_grid_var_3_10 - 216 p_EMIB_down_3_7_3_10 <= 0
 EMIB_non_overlap_up_3_7_3_10: EMIB_h_var_3_10 - EMIB_y_grid_var_3_7
   + EMIB_y_grid_var_3_10 + 216 p_EMIB_up_3_7_3_10 <= 216
 EMIB_non_overlap_up_rev_3_7_3_10: - EMIB_h_var_3_10 + EMIB_y_grid_var_3_7
   - EMIB_y_grid_var_3_10 - 216 p_EMIB_up_3_7_3_10 <= 0
 EMIB_non_overlap_any_3_7_7_11: p_EMIB_left_3_7_7_11
   + p_EMIB_right_3_7_7_11 + p_EMIB_down_3_7_7_11 + p_EMIB_up_3_7_7_11
   >= 1
 EMIB_non_overlap_left_3_7_7_11: EMIB_w_var_3_7 + EMIB_x_grid_var_3_7
   - EMIB_x_grid_var_7_11 + 216 p_EMIB_left_3_7_7_11 <= 216
 EMIB_non_overlap_left_rev_3_7_7_11: - EMIB_w_var_3_7 - EMIB_x_grid_var_3_7
   + EMIB_x_grid_var_7_11 - 216 p_EMIB_left_3_7_7_11 <= 0
 EMIB_non_overlap_right_3_7_7_11: EMIB_w_var_7_11 - EMIB_x_grid_var_3_7
   + EMIB_x_grid_var_7_11 + 216 p_EMIB_right_3_7_7_11 <= 216
 EMIB_non_overlap_right_rev_3_7_7_11: - EMIB_w_var_7_11
   + EMIB_x_grid_var_3_7 - EMIB_x_grid_var_7_11 - 216 p_EMIB_right_3_7_7_11
   <= 0
 EMIB_non_overlap_down_3_7_7_11: EMIB_h_var_3_7 + EMIB_y_grid_var_3_7
   - EMIB_y_grid_var_7_11 + 216 p_EMIB_down_3_7_7_11 <= 216
 EMIB_non_overlap_down_rev_3_7_7_11: - EMIB_h_var_3_7 - EMIB_y_grid_var_3_7
   + EMIB_y_grid_var_7_11 - 216 p_EMIB_down_3_7_7_11 <= 0
 EMIB_non_overlap_up_3_7_7_11: EMIB_h_var_7_11 - EMIB_y_grid_var_3_7
   + EMIB_y_grid_var_7_11 + 216 p_EMIB_up_3_7_7_11 <= 216
 EMIB_non_overlap_up_rev_3_7_7_11: - EMIB_h_var_7_11 + EMIB_y_grid_var_3_7
   - EMIB_y_grid_var_7_11 - 216 p_EMIB_up_3_7_7_11 <= 0
 EMIB_non_overlap_any_3_10_6_10: p_EMIB_left_3_10_6_10
   + p_EMIB_right_3_10_6_10 + p_EMIB_down_3_10_6_10 + p_EMIB_up_3_10_6_10
   >= 1
 EMIB_non_overlap_left_3_10_6_10: EMIB_w_var_3_10 + EMIB_x_grid_var_3_10
   - EMIB_x_grid_var_6_10 + 216 p_EMIB_left_3_10_6_10 <= 216
 EMIB_non_overlap_left_rev_3_10_6_10: - EMIB_w_var_3_10
   - EMIB_x_grid_var_3_10 + EMIB_x_grid_var_6_10
   - 216 p_EMIB_left_3_10_6_10 <= 0
 EMIB_non_overlap_right_3_10_6_10: EMIB_w_var_6_10 - EMIB_x_grid_var_3_10
   + EMIB_x_grid_var_6_10 + 216 p_EMIB_right_3_10_6_10 <= 216
 EMIB_non_overlap_right_rev_3_10_6_10: - EMIB_w_var_6_10
   + EMIB_x_grid_var_3_10 - EMIB_x_grid_var_6_10
   - 216 p_EMIB_right_3_10_6_10 <= 0
 EMIB_non_overlap_down_3_10_6_10: EMIB_h_var_3_10 + EMIB_y_grid_var_3_10
   - EMIB_y_grid_var_6_10 + 216 p_EMIB_down_3_10_6_10 <= 216
 EMIB_non_overlap_down_rev_3_10_6_10: - EMIB_h_var_3_10
   - EMIB_y_grid_var_3_10 + EMIB_y_grid_var_6_10
   - 216 p_EMIB_down_3_10_6_10 <= 0
 EMIB_non_overlap_up_3_10_6_10: EMIB_h_var_6_10 - EMIB_y_grid_var_3_10
   + EMIB_y_grid_var_6_10 + 216 p_EMIB_up_3_10_6_10 <= 216
 EMIB_non_overlap_up_rev_3_10_6_10: - EMIB_h_var_6_10
   + EMIB_y_grid_var_3_10 - EMIB_y_grid_var_6_10 - 216 p_EMIB_up_3_10_6_10
   <= 0
 EMIB_non_overlap_any_3_10_10_12: p_EMIB_left_3_10_10_12
   + p_EMIB_right_3_10_10_12 + p_EMIB_down_3_10_10_12
   + p_EMIB_up_3_10_10_12 >= 1
 EMIB_non_overlap_left_3_10_10_12: EMIB_w_var_3_10 + EMIB_x_grid_var_3_10
   - EMIB_x_grid_var_10_12 + 216 p_EMIB_left_3_10_10_12 <= 216
 EMIB_non_overlap_left_rev_3_10_10_12: - EMIB_w_var_3_10
   - EMIB_x_grid_var_3_10 + EMIB_x_grid_var_10_12
   - 216 p_EMIB_left_3_10_10_12 <= 0
 EMIB_non_overlap_right_3_10_10_12: EMIB_w_var_10_12 - EMIB_x_grid_var_3_10
   + EMIB_x_grid_var_10_12 + 216 p_EMIB_right_3_10_10_12 <= 216
 EMIB_non_overlap_right_rev_3_10_10_12: - EMIB_w_var_10_12
   + EMIB_x_grid_var_3_10 - EMIB_x_grid_var_10_12
   - 216 p_EMIB_right_3_10_10_12 <= 0
 EMIB_non_overlap_down_3_10_10_12: EMIB_h_var_3_10 + EMIB_y_grid_var_3_10
   - EMIB_y_grid_var_10_12 + 216 p_EMIB_down_3_10_10_12 <= 216
 EMIB_non_overlap_down_rev_3_10_10_12: - EMIB_h_var_3_10
   - EMIB_y_grid_var_3_10 + EMIB_y_grid_var_10_12
   - 216 p_EMIB_down_3_10_10_12 <= 0
 EMIB_non_overlap_up_3_10_10_12: EMIB_h_var_10_12 - EMIB_y_grid_var_3_10
   + EMIB_y_grid_var_10_12 + 216 p_EMIB_up_3_10_10_12 <= 216
 EMIB_non_overlap_up_rev_3_10_10_12: - EMIB_h_var_10_12
   + EMIB_y_grid_var_3_10 - EMIB_y_grid_var_10_12
   - 216 p_EMIB_up_3_10_10_12 <= 0
 EMIB_non_overlap_any_4_6_4_8: p_EMIB_left_4_6_4_8 + p_EMIB_right_4_6_4_8
   + p_EMIB_down_4_6_4_8 + p_EMIB_up_4_6_4_8 >= 1
 EMIB_non_overlap_left_4_6_4_8: EMIB_w_var_4_6 + EMIB_x_grid_var_4_6
   - EMIB_x_grid_var_4_8 + 216 p_EMIB_left_4_6_4_8 <= 216
 EMIB_non_overlap_left_rev_4_6_4_8: - EMIB_w_var_4_6 - EMIB_x_grid_var_4_6
   + EMIB_x_grid_var_4_8 - 216 p_EMIB_left_4_6_4_8 <= 0
 EMIB_non_overlap_right_4_6_4_8: EMIB_w_var_4_8 - EMIB_x_grid_var_4_6
   + EMIB_x_grid_var_4_8 + 216 p_EMIB_right_4_6_4_8 <= 216
 EMIB_non_overlap_right_rev_4_6_4_8: - EMIB_w_var_4_8 + EMIB_x_grid_var_4_6
   - EMIB_x_grid_var_4_8 - 216 p_EMIB_right_4_6_4_8 <= 0
 EMIB_non_overlap_down_4_6_4_8: EMIB_h_var_4_6 + EMIB_y_grid_var_4_6
   - EMIB_y_grid_var_4_8 + 216 p_EMIB_down_4_6_4_8 <= 216
 EMIB_non_overlap_down_rev_4_6_4_8: - EMIB_h_var_4_6 - EMIB_y_grid_var_4_6
   + EMIB_y_grid_var_4_8 - 216 p_EMIB_down_4_6_4_8 <= 0
 EMIB_non_overlap_up_4_6_4_8: EMIB_h_var_4_8 - EMIB_y_grid_var_4_6
   + EMIB_y_grid_var_4_8 + 216 p_EMIB_up_4_6_4_8 <= 216
 EMIB_non_overlap_up_rev_4_6_4_8: - EMIB_h_var_4_8 + EMIB_y_grid_var_4_6
   - EMIB_y_grid_var_4_8 - 216 p_EMIB_up_4_6_4_8 <= 0
 EMIB_non_overlap_any_4_6_6_10: p_EMIB_left_4_6_6_10
   + p_EMIB_right_4_6_6_10 + p_EMIB_down_4_6_6_10 + p_EMIB_up_4_6_6_10
   >= 1
 EMIB_non_overlap_left_4_6_6_10: EMIB_w_var_4_6 + EMIB_x_grid_var_4_6
   - EMIB_x_grid_var_6_10 + 216 p_EMIB_left_4_6_6_10 <= 216
 EMIB_non_overlap_left_rev_4_6_6_10: - EMIB_w_var_4_6 - EMIB_x_grid_var_4_6
   + EMIB_x_grid_var_6_10 - 216 p_EMIB_left_4_6_6_10 <= 0
 EMIB_non_overlap_right_4_6_6_10: EMIB_w_var_6_10 - EMIB_x_grid_var_4_6
   + EMIB_x_grid_var_6_10 + 216 p_EMIB_right_4_6_6_10 <= 216
 EMIB_non_overlap_right_rev_4_6_6_10: - EMIB_w_var_6_10
   + EMIB_x_grid_var_4_6 - EMIB_x_grid_var_6_10 - 216 p_EMIB_right_4_6_6_10
   <= 0
 EMIB_non_overlap_down_4_6_6_10: EMIB_h_var_4_6 + EMIB_y_grid_var_4_6
   - EMIB_y_grid_var_6_10 + 216 p_EMIB_down_4_6_6_10 <= 216
 EMIB_non_overlap_down_rev_4_6_6_10: - EMIB_h_var_4_6 - EMIB_y_grid_var_4_6
   + EMIB_y_grid_var_6_10 - 216 p_EMIB_down_4_6_6_10 <= 0
 EMIB_non_overlap_up_4_6_6_10: EMIB_h_var_6_10 - EMIB_y_grid_var_4_6
   + EMIB_y_grid_var_6_10 + 216 p_EMIB_up_4_6_6_10 <= 216
 EMIB_non_overlap_up_rev_4_6_6_10: - EMIB_h_var_6_10 + EMIB_y_grid_var_4_6
   - EMIB_y_grid_var_6_10 - 216 p_EMIB_up_4_6_6_10 <= 0
 EMIB_non_overlap_any_4_8_8_12: p_EMIB_left_4_8_8_12
   + p_EMIB_right_4_8_8_12 + p_EMIB_down_4_8_8_12 + p_EMIB_up_4_8_8_12
   >= 1
 EMIB_non_overlap_left_4_8_8_12: EMIB_w_var_4_8 + EMIB_x_grid_var_4_8
   - EMIB_x_grid_var_8_12 + 216 p_EMIB_left_4_8_8_12 <= 216
 EMIB_non_overlap_left_rev_4_8_8_12: - EMIB_w_var_4_8 - EMIB_x_grid_var_4_8
   + EMIB_x_grid_var_8_12 - 216 p_EMIB_left_4_8_8_12 <= 0
 EMIB_non_overlap_right_4_8_8_12: EMIB_w_var_8_12 - EMIB_x_grid_var_4_8
   + EMIB_x_grid_var_8_12 + 216 p_EMIB_right_4_8_8_12 <= 216
 EMIB_non_overlap_right_rev_4_8_8_12: - EMIB_w_var_8_12
   + EMIB_x_grid_var_4_8 - EMIB_x_grid_var_8_12 - 216 p_EMIB_right_4_8_8_12
   <= 0
 EMIB_non_overlap_down_4_8_8_12: EMIB_h_var_4_8 + EMIB_y_grid_var_4_8
   - EMIB_y_grid_var_8_12 + 216 p_EMIB_down_4_8_8_12 <= 216
 EMIB_non_overlap_down_rev_4_8_8_12: - EMIB_h_var_4_8 - EMIB_y_grid_var_4_8
   + EMIB_y_grid_var_8_12 - 216 p_EMIB_down_4_8_8_12 <= 0
 EMIB_non_overlap_up_4_8_8_12: EMIB_h_var_8_12 - EMIB_y_grid_var_4_8
   + EMIB_y_grid_var_8_12 + 216 p_EMIB_up_4_8_8_12 <= 216
 EMIB_non_overlap_up_rev_4_8_8_12: - EMIB_h_var_8_12 + EMIB_y_grid_var_4_8
   - EMIB_y_grid_var_8_12 - 216 p_EMIB_up_4_8_8_12 <= 0
 EMIB_non_overlap_any_6_10_10_12: p_EMIB_left_6_10_10_12
   + p_EMIB_right_6_10_10_12 + p_EMIB_down_6_10_10_12
   + p_EMIB_up_6_10_10_12 >= 1
 EMIB_non_overlap_left_6_10_10_12: EMIB_w_var_6_10 + EMIB_x_grid_var_6_10
   - EMIB_x_grid_var_10_12 + 216 p_EMIB_left_6_10_10_12 <= 216
 EMIB_non_overlap_left_rev_6_10_10_12: - EMIB_w_var_6_10
   - EMIB_x_grid_var_6_10 + EMIB_x_grid_var_10_12
   - 216 p_EMIB_left_6_10_10_12 <= 0
 EMIB_non_overlap_right_6_10_10_12: EMIB_w_var_10_12 - EMIB_x_grid_var_6_10
   + EMIB_x_grid_var_10_12 + 216 p_EMIB_right_6_10_10_12 <= 216
 EMIB_non_overlap_right_rev_6_10_10_12: - EMIB_w_var_10_12
   + EMIB_x_grid_var_6_10 - EMIB_x_grid_var_10_12
   - 216 p_EMIB_right_6_10_10_12 <= 0
 EMIB_non_overlap_down_6_10_10_12: EMIB_h_var_6_10 + EMIB_y_grid_var_6_10
   - EMIB_y_grid_var_10_12 + 216 p_EMIB_down_6_10_10_12 <= 216
 EMIB_non_overlap_down_rev_6_10_10_12: - EMIB_h_var_6_10
   - EMIB_y_grid_var_6_10 + EMIB_y_grid_var_10_12
   - 216 p_EMIB_down_6_10_10_12 <= 0
 EMIB_non_overlap_up_6_10_10_12: EMIB_h_var_10_12 - EMIB_y_grid_var_6_10
   + EMIB_y_grid_var_10_12 + 216 p_EMIB_up_6_10_10_12 <= 216
 EMIB_non_overlap_up_rev_6_10_10_12: - EMIB_h_var_10_12
   + EMIB_y_grid_var_6_10 - EMIB_y_grid_var_10_12
   - 216 p_EMIB_up_6_10_10_12 <= 0
 EMIB_non_overlap_any_8_12_10_12: p_EMIB_left_8_12_10_12
   + p_EMIB_right_8_12_10_12 + p_EMIB_down_8_12_10_12
   + p_EMIB_up_8_12_10_12 >= 1
 EMIB_non_overlap_left_8_12_10_12: EMIB_w_var_8_12 + EMIB_x_grid_var_8_12
   - EMIB_x_grid_var_10_12 + 216 p_EMIB_left_8_12_10_12 <= 216
 EMIB_non_overlap_left_rev_8_12_10_12: - EMIB_w_var_8_12
   - EMIB_x_grid_var_8_12 + EMIB_x_grid_var_10_12
   - 216 p_EMIB_left_8_12_10_12 <= 0
 EMIB_non_overlap_right_8_12_10_12: EMIB_w_var_10_12 - EMIB_x_grid_var_8_12
   + EMIB_x_grid_var_10_12 + 216 p_EMIB_right_8_12_10_12 <= 216
 EMIB_non_overlap_right_rev_8_12_10_12: - EMIB_w_var_10_12
   + EMIB_x_grid_var_8_12 - EMIB_x_grid_var_10_12
   - 216 p_EMIB_right_8_12_10_12 <= 0
 EMIB_non_overlap_down_8_12_10_12: EMIB_h_var_8_12 + EMIB_y_grid_var_8_12
   - EMIB_y_grid_var_10_12 + 216 p_EMIB_down_8_12_10_12 <= 216
 EMIB_non_overlap_down_rev_8_12_10_12: - EMIB_h_var_8_12
   - EMIB_y_grid_var_8_12 + EMIB_y_grid_var_10_12
   - 216 p_EMIB_down_8_12_10_12 <= 0
 EMIB_non_overlap_up_8_12_10_12: EMIB_h_var_10_12 - EMIB_y_grid_var_8_12
   + EMIB_y_grid_var_10_12 + 216 p_EMIB_up_8_12_10_12 <= 216
 EMIB_non_overlap_up_rev_8_12_10_12: - EMIB_h_var_10_12
   + EMIB_y_grid_var_8_12 - EMIB_y_grid_var_10_12
   - 216 p_EMIB_up_8_12_10_12 <= 0
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
 bbox_min_x_8: - x_grid_var_8 + bbox_min_x <= 0
 bbox_max_x_8: - w_var_8 - x_grid_var_8 + bbox_max_x >= 0
 bbox_min_y_8: - y_grid_var_8 + bbox_min_y <= 0
 bbox_max_y_8: - h_var_8 - y_grid_var_8 + bbox_max_y >= 0
 bbox_min_x_9: - x_grid_var_9 + bbox_min_x <= 0
 bbox_max_x_9: - w_var_9 - x_grid_var_9 + bbox_max_x >= 0
 bbox_min_y_9: - y_grid_var_9 + bbox_min_y <= 0
 bbox_max_y_9: - h_var_9 - y_grid_var_9 + bbox_max_y >= 0
 bbox_min_x_10: - x_grid_var_10 + bbox_min_x <= 0
 bbox_max_x_10: - w_var_10 - x_grid_var_10 + bbox_max_x >= 0
 bbox_min_y_10: - y_grid_var_10 + bbox_min_y <= 0
 bbox_max_y_10: - h_var_10 - y_grid_var_10 + bbox_max_y >= 0
 bbox_min_x_11: - x_grid_var_11 + bbox_min_x <= 0
 bbox_max_x_11: - w_var_11 - x_grid_var_11 + bbox_max_x >= 0
 bbox_min_y_11: - y_grid_var_11 + bbox_min_y <= 0
 bbox_max_y_11: - h_var_11 - y_grid_var_11 + bbox_max_y >= 0
 bbox_min_x_12: - x_grid_var_12 + bbox_min_x <= 0
 bbox_max_x_12: - w_var_12 - x_grid_var_12 + bbox_max_x >= 0
 bbox_min_y_12: - y_grid_var_12 + bbox_min_y <= 0
 bbox_max_y_12: - h_var_12 - y_grid_var_12 + bbox_max_y >= 0
 bbox_min_x_13: - x_grid_var_13 + bbox_min_x <= 0
 bbox_max_x_13: - w_var_13 - x_grid_var_13 + bbox_max_x >= 0
 bbox_min_y_13: - y_grid_var_13 + bbox_min_y <= 0
 bbox_max_y_13: - h_var_13 - y_grid_var_13 + bbox_max_y >= 0
 bbox_w_def: bbox_min_x - bbox_max_x + bbox_w = 0
 bbox_h_def: bbox_min_y - bbox_max_y + bbox_h = 0
 cx_center_def: cx_center - 0.5 bbox_min_x - 0.5 bbox_max_x = 0
 cy_center_def: cy_center - 0.5 bbox_min_y - 0.5 bbox_max_y = 0
 aspect_ratio_diff_ge_w_minus_h: - bbox_w + bbox_h + aspect_ratio_penalty
   >= 0
 aspect_ratio_diff_ge_h_minus_w: bbox_w - bbox_h + aspect_ratio_penalty
   >= 0
 dx_grid_diff_def_1_2: - cx_grid_var_1 + cx_grid_var_2 + dx_grid_diff_1_2
   = 0
 dx_grid_abs_pair_1_2_abs_ge_orig: dx_grid_abs_pair_1_2 - dx_grid_diff_1_2
   - 216 dx_grid_abs_pair_1_2_is_positive >= -216
 dx_grid_abs_pair_1_2_abs_le_orig: dx_grid_abs_pair_1_2 - dx_grid_diff_1_2
   + 216 dx_grid_abs_pair_1_2_is_positive <= 216
 dx_grid_abs_pair_1_2_abs_ge_neg_orig: dx_grid_abs_pair_1_2
   + dx_grid_diff_1_2 + 216 dx_grid_abs_pair_1_2_is_positive >= 0
 dx_grid_abs_pair_1_2_abs_le_neg_orig: dx_grid_abs_pair_1_2
   + dx_grid_diff_1_2 - 216 dx_grid_abs_pair_1_2_is_positive <= 0
 dx_grid_abs_pair_1_2_force_positive: dx_grid_diff_1_2
   - 216 dx_grid_abs_pair_1_2_is_positive >= -216
 dx_grid_abs_pair_1_2_force_negative: dx_grid_diff_1_2
   - 216 dx_grid_abs_pair_1_2_is_positive <= 0
 dy_grid_diff_def_1_2: - cy_grid_var_1 + cy_grid_var_2 + dy_grid_diff_1_2
   = 0
 dy_grid_abs_pair_1_2_abs_ge_orig: dy_grid_abs_pair_1_2 - dy_grid_diff_1_2
   - 216 dy_grid_abs_pair_1_2_is_positive >= -216
 dy_grid_abs_pair_1_2_abs_le_orig: dy_grid_abs_pair_1_2 - dy_grid_diff_1_2
   + 216 dy_grid_abs_pair_1_2_is_positive <= 216
 dy_grid_abs_pair_1_2_abs_ge_neg_orig: dy_grid_abs_pair_1_2
   + dy_grid_diff_1_2 + 216 dy_grid_abs_pair_1_2_is_positive >= 0
 dy_grid_abs_pair_1_2_abs_le_neg_orig: dy_grid_abs_pair_1_2
   + dy_grid_diff_1_2 - 216 dy_grid_abs_pair_1_2_is_positive <= 0
 dy_grid_abs_pair_1_2_force_positive: dy_grid_diff_1_2
   - 216 dy_grid_abs_pair_1_2_is_positive >= -216
 dy_grid_abs_pair_1_2_force_negative: dy_grid_diff_1_2
   - 216 dy_grid_abs_pair_1_2_is_positive <= 0
 dist_curr_pair_def_1_2: - dx_grid_abs_pair_1_2 - dy_grid_abs_pair_1_2
   + dist_curr_pair_1_2 = 0
 dx_grid_diff_def_1_4: - cx_grid_var_1 + cx_grid_var_4 + dx_grid_diff_1_4
   = 0
 dx_grid_abs_pair_1_4_abs_ge_orig: dx_grid_abs_pair_1_4 - dx_grid_diff_1_4
   - 216 dx_grid_abs_pair_1_4_is_positive >= -216
 dx_grid_abs_pair_1_4_abs_le_orig: dx_grid_abs_pair_1_4 - dx_grid_diff_1_4
   + 216 dx_grid_abs_pair_1_4_is_positive <= 216
 dx_grid_abs_pair_1_4_abs_ge_neg_orig: dx_grid_abs_pair_1_4
   + dx_grid_diff_1_4 + 216 dx_grid_abs_pair_1_4_is_positive >= 0
 dx_grid_abs_pair_1_4_abs_le_neg_orig: dx_grid_abs_pair_1_4
   + dx_grid_diff_1_4 - 216 dx_grid_abs_pair_1_4_is_positive <= 0
 dx_grid_abs_pair_1_4_force_positive: dx_grid_diff_1_4
   - 216 dx_grid_abs_pair_1_4_is_positive >= -216
 dx_grid_abs_pair_1_4_force_negative: dx_grid_diff_1_4
   - 216 dx_grid_abs_pair_1_4_is_positive <= 0
 dy_grid_diff_def_1_4: - cy_grid_var_1 + cy_grid_var_4 + dy_grid_diff_1_4
   = 0
 dy_grid_abs_pair_1_4_abs_ge_orig: dy_grid_abs_pair_1_4 - dy_grid_diff_1_4
   - 216 dy_grid_abs_pair_1_4_is_positive >= -216
 dy_grid_abs_pair_1_4_abs_le_orig: dy_grid_abs_pair_1_4 - dy_grid_diff_1_4
   + 216 dy_grid_abs_pair_1_4_is_positive <= 216
 dy_grid_abs_pair_1_4_abs_ge_neg_orig: dy_grid_abs_pair_1_4
   + dy_grid_diff_1_4 + 216 dy_grid_abs_pair_1_4_is_positive >= 0
 dy_grid_abs_pair_1_4_abs_le_neg_orig: dy_grid_abs_pair_1_4
   + dy_grid_diff_1_4 - 216 dy_grid_abs_pair_1_4_is_positive <= 0
 dy_grid_abs_pair_1_4_force_positive: dy_grid_diff_1_4
   - 216 dy_grid_abs_pair_1_4_is_positive >= -216
 dy_grid_abs_pair_1_4_force_negative: dy_grid_diff_1_4
   - 216 dy_grid_abs_pair_1_4_is_positive <= 0
 dist_curr_pair_def_1_4: - dx_grid_abs_pair_1_4 - dy_grid_abs_pair_1_4
   + dist_curr_pair_1_4 = 0
 dx_grid_diff_def_1_10: - cx_grid_var_1 + cx_grid_var_10
   + dx_grid_diff_1_10 = 0
 dx_grid_abs_pair_1_10_abs_ge_orig: dx_grid_abs_pair_1_10
   - dx_grid_diff_1_10 - 216 dx_grid_abs_pair_1_10_is_positive >= -216
 dx_grid_abs_pair_1_10_abs_le_orig: dx_grid_abs_pair_1_10
   - dx_grid_diff_1_10 + 216 dx_grid_abs_pair_1_10_is_positive <= 216
 dx_grid_abs_pair_1_10_abs_ge_neg_orig: dx_grid_abs_pair_1_10
   + dx_grid_diff_1_10 + 216 dx_grid_abs_pair_1_10_is_positive >= 0
 dx_grid_abs_pair_1_10_abs_le_neg_orig: dx_grid_abs_pair_1_10
   + dx_grid_diff_1_10 - 216 dx_grid_abs_pair_1_10_is_positive <= 0
 dx_grid_abs_pair_1_10_force_positive: dx_grid_diff_1_10
   - 216 dx_grid_abs_pair_1_10_is_positive >= -216
 dx_grid_abs_pair_1_10_force_negative: dx_grid_diff_1_10
   - 216 dx_grid_abs_pair_1_10_is_positive <= 0
 dy_grid_diff_def_1_10: - cy_grid_var_1 + cy_grid_var_10
   + dy_grid_diff_1_10 = 0
 dy_grid_abs_pair_1_10_abs_ge_orig: dy_grid_abs_pair_1_10
   - dy_grid_diff_1_10 - 216 dy_grid_abs_pair_1_10_is_positive >= -216
 dy_grid_abs_pair_1_10_abs_le_orig: dy_grid_abs_pair_1_10
   - dy_grid_diff_1_10 + 216 dy_grid_abs_pair_1_10_is_positive <= 216
 dy_grid_abs_pair_1_10_abs_ge_neg_orig: dy_grid_abs_pair_1_10
   + dy_grid_diff_1_10 + 216 dy_grid_abs_pair_1_10_is_positive >= 0
 dy_grid_abs_pair_1_10_abs_le_neg_orig: dy_grid_abs_pair_1_10
   + dy_grid_diff_1_10 - 216 dy_grid_abs_pair_1_10_is_positive <= 0
 dy_grid_abs_pair_1_10_force_positive: dy_grid_diff_1_10
   - 216 dy_grid_abs_pair_1_10_is_positive >= -216
 dy_grid_abs_pair_1_10_force_negative: dy_grid_diff_1_10
   - 216 dy_grid_abs_pair_1_10_is_positive <= 0
 dist_curr_pair_def_1_10: - dx_grid_abs_pair_1_10 - dy_grid_abs_pair_1_10
   + dist_curr_pair_1_10 = 0
 dx_grid_diff_def_2_4: - cx_grid_var_2 + cx_grid_var_4 + dx_grid_diff_2_4
   = 0
 dx_grid_abs_pair_2_4_abs_ge_orig: dx_grid_abs_pair_2_4 - dx_grid_diff_2_4
   - 216 dx_grid_abs_pair_2_4_is_positive >= -216
 dx_grid_abs_pair_2_4_abs_le_orig: dx_grid_abs_pair_2_4 - dx_grid_diff_2_4
   + 216 dx_grid_abs_pair_2_4_is_positive <= 216
 dx_grid_abs_pair_2_4_abs_ge_neg_orig: dx_grid_abs_pair_2_4
   + dx_grid_diff_2_4 + 216 dx_grid_abs_pair_2_4_is_positive >= 0
 dx_grid_abs_pair_2_4_abs_le_neg_orig: dx_grid_abs_pair_2_4
   + dx_grid_diff_2_4 - 216 dx_grid_abs_pair_2_4_is_positive <= 0
 dx_grid_abs_pair_2_4_force_positive: dx_grid_diff_2_4
   - 216 dx_grid_abs_pair_2_4_is_positive >= -216
 dx_grid_abs_pair_2_4_force_negative: dx_grid_diff_2_4
   - 216 dx_grid_abs_pair_2_4_is_positive <= 0
 dy_grid_diff_def_2_4: - cy_grid_var_2 + cy_grid_var_4 + dy_grid_diff_2_4
   = 0
 dy_grid_abs_pair_2_4_abs_ge_orig: dy_grid_abs_pair_2_4 - dy_grid_diff_2_4
   - 216 dy_grid_abs_pair_2_4_is_positive >= -216
 dy_grid_abs_pair_2_4_abs_le_orig: dy_grid_abs_pair_2_4 - dy_grid_diff_2_4
   + 216 dy_grid_abs_pair_2_4_is_positive <= 216
 dy_grid_abs_pair_2_4_abs_ge_neg_orig: dy_grid_abs_pair_2_4
   + dy_grid_diff_2_4 + 216 dy_grid_abs_pair_2_4_is_positive >= 0
 dy_grid_abs_pair_2_4_abs_le_neg_orig: dy_grid_abs_pair_2_4
   + dy_grid_diff_2_4 - 216 dy_grid_abs_pair_2_4_is_positive <= 0
 dy_grid_abs_pair_2_4_force_positive: dy_grid_diff_2_4
   - 216 dy_grid_abs_pair_2_4_is_positive >= -216
 dy_grid_abs_pair_2_4_force_negative: dy_grid_diff_2_4
   - 216 dy_grid_abs_pair_2_4_is_positive <= 0
 dist_curr_pair_def_2_4: - dx_grid_abs_pair_2_4 - dy_grid_abs_pair_2_4
   + dist_curr_pair_2_4 = 0
 dx_grid_diff_def_2_10: - cx_grid_var_2 + cx_grid_var_10
   + dx_grid_diff_2_10 = 0
 dx_grid_abs_pair_2_10_abs_ge_orig: dx_grid_abs_pair_2_10
   - dx_grid_diff_2_10 - 216 dx_grid_abs_pair_2_10_is_positive >= -216
 dx_grid_abs_pair_2_10_abs_le_orig: dx_grid_abs_pair_2_10
   - dx_grid_diff_2_10 + 216 dx_grid_abs_pair_2_10_is_positive <= 216
 dx_grid_abs_pair_2_10_abs_ge_neg_orig: dx_grid_abs_pair_2_10
   + dx_grid_diff_2_10 + 216 dx_grid_abs_pair_2_10_is_positive >= 0
 dx_grid_abs_pair_2_10_abs_le_neg_orig: dx_grid_abs_pair_2_10
   + dx_grid_diff_2_10 - 216 dx_grid_abs_pair_2_10_is_positive <= 0
 dx_grid_abs_pair_2_10_force_positive: dx_grid_diff_2_10
   - 216 dx_grid_abs_pair_2_10_is_positive >= -216
 dx_grid_abs_pair_2_10_force_negative: dx_grid_diff_2_10
   - 216 dx_grid_abs_pair_2_10_is_positive <= 0
 dy_grid_diff_def_2_10: - cy_grid_var_2 + cy_grid_var_10
   + dy_grid_diff_2_10 = 0
 dy_grid_abs_pair_2_10_abs_ge_orig: dy_grid_abs_pair_2_10
   - dy_grid_diff_2_10 - 216 dy_grid_abs_pair_2_10_is_positive >= -216
 dy_grid_abs_pair_2_10_abs_le_orig: dy_grid_abs_pair_2_10
   - dy_grid_diff_2_10 + 216 dy_grid_abs_pair_2_10_is_positive <= 216
 dy_grid_abs_pair_2_10_abs_ge_neg_orig: dy_grid_abs_pair_2_10
   + dy_grid_diff_2_10 + 216 dy_grid_abs_pair_2_10_is_positive >= 0
 dy_grid_abs_pair_2_10_abs_le_neg_orig: dy_grid_abs_pair_2_10
   + dy_grid_diff_2_10 - 216 dy_grid_abs_pair_2_10_is_positive <= 0
 dy_grid_abs_pair_2_10_force_positive: dy_grid_diff_2_10
   - 216 dy_grid_abs_pair_2_10_is_positive >= -216
 dy_grid_abs_pair_2_10_force_negative: dy_grid_diff_2_10
   - 216 dy_grid_abs_pair_2_10_is_positive <= 0
 dist_curr_pair_def_2_10: - dx_grid_abs_pair_2_10 - dy_grid_abs_pair_2_10
   + dist_curr_pair_2_10 = 0
 dx_grid_diff_def_4_10: - cx_grid_var_4 + cx_grid_var_10
   + dx_grid_diff_4_10 = 0
 dx_grid_abs_pair_4_10_abs_ge_orig: dx_grid_abs_pair_4_10
   - dx_grid_diff_4_10 - 216 dx_grid_abs_pair_4_10_is_positive >= -216
 dx_grid_abs_pair_4_10_abs_le_orig: dx_grid_abs_pair_4_10
   - dx_grid_diff_4_10 + 216 dx_grid_abs_pair_4_10_is_positive <= 216
 dx_grid_abs_pair_4_10_abs_ge_neg_orig: dx_grid_abs_pair_4_10
   + dx_grid_diff_4_10 + 216 dx_grid_abs_pair_4_10_is_positive >= 0
 dx_grid_abs_pair_4_10_abs_le_neg_orig: dx_grid_abs_pair_4_10
   + dx_grid_diff_4_10 - 216 dx_grid_abs_pair_4_10_is_positive <= 0
 dx_grid_abs_pair_4_10_force_positive: dx_grid_diff_4_10
   - 216 dx_grid_abs_pair_4_10_is_positive >= -216
 dx_grid_abs_pair_4_10_force_negative: dx_grid_diff_4_10
   - 216 dx_grid_abs_pair_4_10_is_positive <= 0
 dy_grid_diff_def_4_10: - cy_grid_var_4 + cy_grid_var_10
   + dy_grid_diff_4_10 = 0
 dy_grid_abs_pair_4_10_abs_ge_orig: dy_grid_abs_pair_4_10
   - dy_grid_diff_4_10 - 216 dy_grid_abs_pair_4_10_is_positive >= -216
 dy_grid_abs_pair_4_10_abs_le_orig: dy_grid_abs_pair_4_10
   - dy_grid_diff_4_10 + 216 dy_grid_abs_pair_4_10_is_positive <= 216
 dy_grid_abs_pair_4_10_abs_ge_neg_orig: dy_grid_abs_pair_4_10
   + dy_grid_diff_4_10 + 216 dy_grid_abs_pair_4_10_is_positive >= 0
 dy_grid_abs_pair_4_10_abs_le_neg_orig: dy_grid_abs_pair_4_10
   + dy_grid_diff_4_10 - 216 dy_grid_abs_pair_4_10_is_positive <= 0
 dy_grid_abs_pair_4_10_force_positive: dy_grid_diff_4_10
   - 216 dy_grid_abs_pair_4_10_is_positive >= -216
 dy_grid_abs_pair_4_10_force_negative: dy_grid_diff_4_10
   - 216 dy_grid_abs_pair_4_10_is_positive <= 0
 dist_curr_pair_def_4_10: - dx_grid_abs_pair_4_10 - dy_grid_abs_pair_4_10
   + dist_curr_pair_4_10 = 0
 dx_center_diff_def_1: - cx_grid_var_1 + cx_center + dx_center_diff_1 = 0
 dx_center_abs_1_abs_ge_orig: - dx_center_diff_1 + dx_center_abs_1
   - 216 dx_center_abs_1_is_positive >= -216
 dx_center_abs_1_abs_le_orig: - dx_center_diff_1 + dx_center_abs_1
   + 216 dx_center_abs_1_is_positive <= 216
 dx_center_abs_1_abs_ge_neg_orig: dx_center_diff_1 + dx_center_abs_1
   + 216 dx_center_abs_1_is_positive >= 0
 dx_center_abs_1_abs_le_neg_orig: dx_center_diff_1 + dx_center_abs_1
   - 216 dx_center_abs_1_is_positive <= 0
 dx_center_abs_1_force_positive: dx_center_diff_1
   - 216 dx_center_abs_1_is_positive >= -216
 dx_center_abs_1_force_negative: dx_center_diff_1
   - 216 dx_center_abs_1_is_positive <= 0
 dy_center_diff_def_1: - cy_grid_var_1 + cy_center + dy_center_diff_1 = 0
 dy_center_abs_1_abs_ge_orig: - dy_center_diff_1 + dy_center_abs_1
   - 216 dy_center_abs_1_is_positive >= -216
 dy_center_abs_1_abs_le_orig: - dy_center_diff_1 + dy_center_abs_1
   + 216 dy_center_abs_1_is_positive <= 216
 dy_center_abs_1_abs_ge_neg_orig: dy_center_diff_1 + dy_center_abs_1
   + 216 dy_center_abs_1_is_positive >= 0
 dy_center_abs_1_abs_le_neg_orig: dy_center_diff_1 + dy_center_abs_1
   - 216 dy_center_abs_1_is_positive <= 0
 dy_center_abs_1_force_positive: dy_center_diff_1
   - 216 dy_center_abs_1_is_positive >= -216
 dy_center_abs_1_force_negative: dy_center_diff_1
   - 216 dy_center_abs_1_is_positive <= 0
 dist_center_def_1: - dx_center_abs_1 - dy_center_abs_1 + dist_center_1
   = 0
 dx_center_diff_def_2: - cx_grid_var_2 + cx_center + dx_center_diff_2 = 0
 dx_center_abs_2_abs_ge_orig: - dx_center_diff_2 + dx_center_abs_2
   - 216 dx_center_abs_2_is_positive >= -216
 dx_center_abs_2_abs_le_orig: - dx_center_diff_2 + dx_center_abs_2
   + 216 dx_center_abs_2_is_positive <= 216
 dx_center_abs_2_abs_ge_neg_orig: dx_center_diff_2 + dx_center_abs_2
   + 216 dx_center_abs_2_is_positive >= 0
 dx_center_abs_2_abs_le_neg_orig: dx_center_diff_2 + dx_center_abs_2
   - 216 dx_center_abs_2_is_positive <= 0
 dx_center_abs_2_force_positive: dx_center_diff_2
   - 216 dx_center_abs_2_is_positive >= -216
 dx_center_abs_2_force_negative: dx_center_diff_2
   - 216 dx_center_abs_2_is_positive <= 0
 dy_center_diff_def_2: - cy_grid_var_2 + cy_center + dy_center_diff_2 = 0
 dy_center_abs_2_abs_ge_orig: - dy_center_diff_2 + dy_center_abs_2
   - 216 dy_center_abs_2_is_positive >= -216
 dy_center_abs_2_abs_le_orig: - dy_center_diff_2 + dy_center_abs_2
   + 216 dy_center_abs_2_is_positive <= 216
 dy_center_abs_2_abs_ge_neg_orig: dy_center_diff_2 + dy_center_abs_2
   + 216 dy_center_abs_2_is_positive >= 0
 dy_center_abs_2_abs_le_neg_orig: dy_center_diff_2 + dy_center_abs_2
   - 216 dy_center_abs_2_is_positive <= 0
 dy_center_abs_2_force_positive: dy_center_diff_2
   - 216 dy_center_abs_2_is_positive >= -216
 dy_center_abs_2_force_negative: dy_center_diff_2
   - 216 dy_center_abs_2_is_positive <= 0
 dist_center_def_2: - dx_center_abs_2 - dy_center_abs_2 + dist_center_2
   = 0
 dx_center_diff_def_4: - cx_grid_var_4 + cx_center + dx_center_diff_4 = 0
 dx_center_abs_4_abs_ge_orig: - dx_center_diff_4 + dx_center_abs_4
   - 216 dx_center_abs_4_is_positive >= -216
 dx_center_abs_4_abs_le_orig: - dx_center_diff_4 + dx_center_abs_4
   + 216 dx_center_abs_4_is_positive <= 216
 dx_center_abs_4_abs_ge_neg_orig: dx_center_diff_4 + dx_center_abs_4
   + 216 dx_center_abs_4_is_positive >= 0
 dx_center_abs_4_abs_le_neg_orig: dx_center_diff_4 + dx_center_abs_4
   - 216 dx_center_abs_4_is_positive <= 0
 dx_center_abs_4_force_positive: dx_center_diff_4
   - 216 dx_center_abs_4_is_positive >= -216
 dx_center_abs_4_force_negative: dx_center_diff_4
   - 216 dx_center_abs_4_is_positive <= 0
 dy_center_diff_def_4: - cy_grid_var_4 + cy_center + dy_center_diff_4 = 0
 dy_center_abs_4_abs_ge_orig: - dy_center_diff_4 + dy_center_abs_4
   - 216 dy_center_abs_4_is_positive >= -216
 dy_center_abs_4_abs_le_orig: - dy_center_diff_4 + dy_center_abs_4
   + 216 dy_center_abs_4_is_positive <= 216
 dy_center_abs_4_abs_ge_neg_orig: dy_center_diff_4 + dy_center_abs_4
   + 216 dy_center_abs_4_is_positive >= 0
 dy_center_abs_4_abs_le_neg_orig: dy_center_diff_4 + dy_center_abs_4
   - 216 dy_center_abs_4_is_positive <= 0
 dy_center_abs_4_force_positive: dy_center_diff_4
   - 216 dy_center_abs_4_is_positive >= -216
 dy_center_abs_4_force_negative: dy_center_diff_4
   - 216 dy_center_abs_4_is_positive <= 0
 dist_center_def_4: - dx_center_abs_4 - dy_center_abs_4 + dist_center_4
   = 0
 dx_center_diff_def_10: - cx_grid_var_10 + cx_center + dx_center_diff_10
   = 0
 dx_center_abs_10_abs_ge_orig: - dx_center_diff_10 + dx_center_abs_10
   - 216 dx_center_abs_10_is_positive >= -216
 dx_center_abs_10_abs_le_orig: - dx_center_diff_10 + dx_center_abs_10
   + 216 dx_center_abs_10_is_positive <= 216
 dx_center_abs_10_abs_ge_neg_orig: dx_center_diff_10 + dx_center_abs_10
   + 216 dx_center_abs_10_is_positive >= 0
 dx_center_abs_10_abs_le_neg_orig: dx_center_diff_10 + dx_center_abs_10
   - 216 dx_center_abs_10_is_positive <= 0
 dx_center_abs_10_force_positive: dx_center_diff_10
   - 216 dx_center_abs_10_is_positive >= -216
 dx_center_abs_10_force_negative: dx_center_diff_10
   - 216 dx_center_abs_10_is_positive <= 0
 dy_center_diff_def_10: - cy_grid_var_10 + cy_center + dy_center_diff_10
   = 0
 dy_center_abs_10_abs_ge_orig: - dy_center_diff_10 + dy_center_abs_10
   - 216 dy_center_abs_10_is_positive >= -216
 dy_center_abs_10_abs_le_orig: - dy_center_diff_10 + dy_center_abs_10
   + 216 dy_center_abs_10_is_positive <= 216
 dy_center_abs_10_abs_ge_neg_orig: dy_center_diff_10 + dy_center_abs_10
   + 216 dy_center_abs_10_is_positive >= 0
 dy_center_abs_10_abs_le_neg_orig: dy_center_diff_10 + dy_center_abs_10
   - 216 dy_center_abs_10_is_positive <= 0
 dy_center_abs_10_force_positive: dy_center_diff_10
   - 216 dy_center_abs_10_is_positive >= -216
 dy_center_abs_10_force_negative: dy_center_diff_10
   - 216 dy_center_abs_10_is_positive <= 0
 dist_center_def_10: - dx_center_abs_10 - dy_center_abs_10 + dist_center_10
   = 0
 power_aware_penalty_def: power_aware_penalty - 1122 dist_curr_pair_1_2
   - 1287 dist_curr_pair_1_4 - 1650 dist_curr_pair_1_10
   - 1326 dist_curr_pair_2_4 - 1700 dist_curr_pair_2_10
   - 1950 dist_curr_pair_4_10 - 1089 dist_center_1 - 1156 dist_center_2
   - 1521 dist_center_4 - 2500 dist_center_10 = 0
 dx_diff_def_0_10: - cx_grid_var_0 + cx_grid_var_10 + dx_diff_0_10 = 0
 dy_diff_def_0_10: - cy_grid_var_0 + cy_grid_var_10 + dy_diff_0_10 = 0
 dx_abs_0_10_abs_ge_orig: dx_abs_0_10 - dx_diff_0_10
   - 216 dx_abs_0_10_is_positive >= -216
 dx_abs_0_10_abs_le_orig: dx_abs_0_10 - dx_diff_0_10
   + 216 dx_abs_0_10_is_positive <= 216
 dx_abs_0_10_abs_ge_neg_orig: dx_abs_0_10 + dx_diff_0_10
   + 216 dx_abs_0_10_is_positive >= 0
 dx_abs_0_10_abs_le_neg_orig: dx_abs_0_10 + dx_diff_0_10
   - 216 dx_abs_0_10_is_positive <= 0
 dx_abs_0_10_force_positive: dx_diff_0_10 - 216 dx_abs_0_10_is_positive
   >= -216
 dx_abs_0_10_force_negative: dx_diff_0_10 - 216 dx_abs_0_10_is_positive
   <= 0
 dy_abs_0_10_abs_ge_orig: dy_abs_0_10 - dy_diff_0_10
   - 216 dy_abs_0_10_is_positive >= -216
 dy_abs_0_10_abs_le_orig: dy_abs_0_10 - dy_diff_0_10
   + 216 dy_abs_0_10_is_positive <= 216
 dy_abs_0_10_abs_ge_neg_orig: dy_abs_0_10 + dy_diff_0_10
   + 216 dy_abs_0_10_is_positive >= 0
 dy_abs_0_10_abs_le_neg_orig: dy_abs_0_10 + dy_diff_0_10
   - 216 dy_abs_0_10_is_positive <= 0
 dy_abs_0_10_force_positive: dy_diff_0_10 - 216 dy_abs_0_10_is_positive
   >= -216
 dy_abs_0_10_force_negative: dy_diff_0_10 - 216 dy_abs_0_10_is_positive
   <= 0
 dx_diff_def_0_13: - cx_grid_var_0 + cx_grid_var_13 + dx_diff_0_13 = 0
 dy_diff_def_0_13: - cy_grid_var_0 + cy_grid_var_13 + dy_diff_0_13 = 0
 dx_abs_0_13_abs_ge_orig: dx_abs_0_13 - dx_diff_0_13
   - 216 dx_abs_0_13_is_positive >= -216
 dx_abs_0_13_abs_le_orig: dx_abs_0_13 - dx_diff_0_13
   + 216 dx_abs_0_13_is_positive <= 216
 dx_abs_0_13_abs_ge_neg_orig: dx_abs_0_13 + dx_diff_0_13
   + 216 dx_abs_0_13_is_positive >= 0
 dx_abs_0_13_abs_le_neg_orig: dx_abs_0_13 + dx_diff_0_13
   - 216 dx_abs_0_13_is_positive <= 0
 dx_abs_0_13_force_positive: dx_diff_0_13 - 216 dx_abs_0_13_is_positive
   >= -216
 dx_abs_0_13_force_negative: dx_diff_0_13 - 216 dx_abs_0_13_is_positive
   <= 0
 dy_abs_0_13_abs_ge_orig: dy_abs_0_13 - dy_diff_0_13
   - 216 dy_abs_0_13_is_positive >= -216
 dy_abs_0_13_abs_le_orig: dy_abs_0_13 - dy_diff_0_13
   + 216 dy_abs_0_13_is_positive <= 216
 dy_abs_0_13_abs_ge_neg_orig: dy_abs_0_13 + dy_diff_0_13
   + 216 dy_abs_0_13_is_positive >= 0
 dy_abs_0_13_abs_le_neg_orig: dy_abs_0_13 + dy_diff_0_13
   - 216 dy_abs_0_13_is_positive <= 0
 dy_abs_0_13_force_positive: dy_diff_0_13 - 216 dy_abs_0_13_is_positive
   >= -216
 dy_abs_0_13_force_negative: dy_diff_0_13 - 216 dy_abs_0_13_is_positive
   <= 0
 dx_diff_def_1_3: - cx_grid_var_1 + cx_grid_var_3 + dx_diff_1_3 = 0
 dy_diff_def_1_3: - cy_grid_var_1 + cy_grid_var_3 + dy_diff_1_3 = 0
 dx_abs_1_3_abs_ge_orig: dx_abs_1_3 - dx_diff_1_3
   - 216 dx_abs_1_3_is_positive >= -216
 dx_abs_1_3_abs_le_orig: dx_abs_1_3 - dx_diff_1_3
   + 216 dx_abs_1_3_is_positive <= 216
 dx_abs_1_3_abs_ge_neg_orig: dx_abs_1_3 + dx_diff_1_3
   + 216 dx_abs_1_3_is_positive >= 0
 dx_abs_1_3_abs_le_neg_orig: dx_abs_1_3 + dx_diff_1_3
   - 216 dx_abs_1_3_is_positive <= 0
 dx_abs_1_3_force_positive: dx_diff_1_3 - 216 dx_abs_1_3_is_positive
   >= -216
 dx_abs_1_3_force_negative: dx_diff_1_3 - 216 dx_abs_1_3_is_positive <= 0
 dy_abs_1_3_abs_ge_orig: dy_abs_1_3 - dy_diff_1_3
   - 216 dy_abs_1_3_is_positive >= -216
 dy_abs_1_3_abs_le_orig: dy_abs_1_3 - dy_diff_1_3
   + 216 dy_abs_1_3_is_positive <= 216
 dy_abs_1_3_abs_ge_neg_orig: dy_abs_1_3 + dy_diff_1_3
   + 216 dy_abs_1_3_is_positive >= 0
 dy_abs_1_3_abs_le_neg_orig: dy_abs_1_3 + dy_diff_1_3
   - 216 dy_abs_1_3_is_positive <= 0
 dy_abs_1_3_force_positive: dy_diff_1_3 - 216 dy_abs_1_3_is_positive
   >= -216
 dy_abs_1_3_force_negative: dy_diff_1_3 - 216 dy_abs_1_3_is_positive <= 0
 dx_diff_def_1_8: - cx_grid_var_1 + cx_grid_var_8 + dx_diff_1_8 = 0
 dy_diff_def_1_8: - cy_grid_var_1 + cy_grid_var_8 + dy_diff_1_8 = 0
 dx_abs_1_8_abs_ge_orig: dx_abs_1_8 - dx_diff_1_8
   - 216 dx_abs_1_8_is_positive >= -216
 dx_abs_1_8_abs_le_orig: dx_abs_1_8 - dx_diff_1_8
   + 216 dx_abs_1_8_is_positive <= 216
 dx_abs_1_8_abs_ge_neg_orig: dx_abs_1_8 + dx_diff_1_8
   + 216 dx_abs_1_8_is_positive >= 0
 dx_abs_1_8_abs_le_neg_orig: dx_abs_1_8 + dx_diff_1_8
   - 216 dx_abs_1_8_is_positive <= 0
 dx_abs_1_8_force_positive: dx_diff_1_8 - 216 dx_abs_1_8_is_positive
   >= -216
 dx_abs_1_8_force_negative: dx_diff_1_8 - 216 dx_abs_1_8_is_positive <= 0
 dy_abs_1_8_abs_ge_orig: dy_abs_1_8 - dy_diff_1_8
   - 216 dy_abs_1_8_is_positive >= -216
 dy_abs_1_8_abs_le_orig: dy_abs_1_8 - dy_diff_1_8
   + 216 dy_abs_1_8_is_positive <= 216
 dy_abs_1_8_abs_ge_neg_orig: dy_abs_1_8 + dy_diff_1_8
   + 216 dy_abs_1_8_is_positive >= 0
 dy_abs_1_8_abs_le_neg_orig: dy_abs_1_8 + dy_diff_1_8
   - 216 dy_abs_1_8_is_positive <= 0
 dy_abs_1_8_force_positive: dy_diff_1_8 - 216 dy_abs_1_8_is_positive
   >= -216
 dy_abs_1_8_force_negative: dy_diff_1_8 - 216 dy_abs_1_8_is_positive <= 0
 dx_diff_def_3_4: - cx_grid_var_3 + cx_grid_var_4 + dx_diff_3_4 = 0
 dy_diff_def_3_4: - cy_grid_var_3 + cy_grid_var_4 + dy_diff_3_4 = 0
 dx_abs_3_4_abs_ge_orig: dx_abs_3_4 - dx_diff_3_4
   - 216 dx_abs_3_4_is_positive >= -216
 dx_abs_3_4_abs_le_orig: dx_abs_3_4 - dx_diff_3_4
   + 216 dx_abs_3_4_is_positive <= 216
 dx_abs_3_4_abs_ge_neg_orig: dx_abs_3_4 + dx_diff_3_4
   + 216 dx_abs_3_4_is_positive >= 0
 dx_abs_3_4_abs_le_neg_orig: dx_abs_3_4 + dx_diff_3_4
   - 216 dx_abs_3_4_is_positive <= 0
 dx_abs_3_4_force_positive: dx_diff_3_4 - 216 dx_abs_3_4_is_positive
   >= -216
 dx_abs_3_4_force_negative: dx_diff_3_4 - 216 dx_abs_3_4_is_positive <= 0
 dy_abs_3_4_abs_ge_orig: dy_abs_3_4 - dy_diff_3_4
   - 216 dy_abs_3_4_is_positive >= -216
 dy_abs_3_4_abs_le_orig: dy_abs_3_4 - dy_diff_3_4
   + 216 dy_abs_3_4_is_positive <= 216
 dy_abs_3_4_abs_ge_neg_orig: dy_abs_3_4 + dy_diff_3_4
   + 216 dy_abs_3_4_is_positive >= 0
 dy_abs_3_4_abs_le_neg_orig: dy_abs_3_4 + dy_diff_3_4
   - 216 dy_abs_3_4_is_positive <= 0
 dy_abs_3_4_force_positive: dy_diff_3_4 - 216 dy_abs_3_4_is_positive
   >= -216
 dy_abs_3_4_force_negative: dy_diff_3_4 - 216 dy_abs_3_4_is_positive <= 0
 dx_diff_def_3_5: - cx_grid_var_3 + cx_grid_var_5 + dx_diff_3_5 = 0
 dy_diff_def_3_5: - cy_grid_var_3 + cy_grid_var_5 + dy_diff_3_5 = 0
 dx_abs_3_5_abs_ge_orig: dx_abs_3_5 - dx_diff_3_5
   - 216 dx_abs_3_5_is_positive >= -216
 dx_abs_3_5_abs_le_orig: dx_abs_3_5 - dx_diff_3_5
   + 216 dx_abs_3_5_is_positive <= 216
 dx_abs_3_5_abs_ge_neg_orig: dx_abs_3_5 + dx_diff_3_5
   + 216 dx_abs_3_5_is_positive >= 0
 dx_abs_3_5_abs_le_neg_orig: dx_abs_3_5 + dx_diff_3_5
   - 216 dx_abs_3_5_is_positive <= 0
 dx_abs_3_5_force_positive: dx_diff_3_5 - 216 dx_abs_3_5_is_positive
   >= -216
 dx_abs_3_5_force_negative: dx_diff_3_5 - 216 dx_abs_3_5_is_positive <= 0
 dy_abs_3_5_abs_ge_orig: dy_abs_3_5 - dy_diff_3_5
   - 216 dy_abs_3_5_is_positive >= -216
 dy_abs_3_5_abs_le_orig: dy_abs_3_5 - dy_diff_3_5
   + 216 dy_abs_3_5_is_positive <= 216
 dy_abs_3_5_abs_ge_neg_orig: dy_abs_3_5 + dy_diff_3_5
   + 216 dy_abs_3_5_is_positive >= 0
 dy_abs_3_5_abs_le_neg_orig: dy_abs_3_5 + dy_diff_3_5
   - 216 dy_abs_3_5_is_positive <= 0
 dy_abs_3_5_force_positive: dy_diff_3_5 - 216 dy_abs_3_5_is_positive
   >= -216
 dy_abs_3_5_force_negative: dy_diff_3_5 - 216 dy_abs_3_5_is_positive <= 0
 dx_diff_def_4_5: - cx_grid_var_4 + cx_grid_var_5 + dx_diff_4_5 = 0
 dy_diff_def_4_5: - cy_grid_var_4 + cy_grid_var_5 + dy_diff_4_5 = 0
 dx_abs_4_5_abs_ge_orig: dx_abs_4_5 - dx_diff_4_5
   - 216 dx_abs_4_5_is_positive >= -216
 dx_abs_4_5_abs_le_orig: dx_abs_4_5 - dx_diff_4_5
   + 216 dx_abs_4_5_is_positive <= 216
 dx_abs_4_5_abs_ge_neg_orig: dx_abs_4_5 + dx_diff_4_5
   + 216 dx_abs_4_5_is_positive >= 0
 dx_abs_4_5_abs_le_neg_orig: dx_abs_4_5 + dx_diff_4_5
   - 216 dx_abs_4_5_is_positive <= 0
 dx_abs_4_5_force_positive: dx_diff_4_5 - 216 dx_abs_4_5_is_positive
   >= -216
 dx_abs_4_5_force_negative: dx_diff_4_5 - 216 dx_abs_4_5_is_positive <= 0
 dy_abs_4_5_abs_ge_orig: dy_abs_4_5 - dy_diff_4_5
   - 216 dy_abs_4_5_is_positive >= -216
 dy_abs_4_5_abs_le_orig: dy_abs_4_5 - dy_diff_4_5
   + 216 dy_abs_4_5_is_positive <= 216
 dy_abs_4_5_abs_ge_neg_orig: dy_abs_4_5 + dy_diff_4_5
   + 216 dy_abs_4_5_is_positive >= 0
 dy_abs_4_5_abs_le_neg_orig: dy_abs_4_5 + dy_diff_4_5
   - 216 dy_abs_4_5_is_positive <= 0
 dy_abs_4_5_force_positive: dy_diff_4_5 - 216 dy_abs_4_5_is_positive
   >= -216
 dy_abs_4_5_force_negative: dy_diff_4_5 - 216 dy_abs_4_5_is_positive <= 0
 dx_diff_def_4_9: - cx_grid_var_4 + cx_grid_var_9 + dx_diff_4_9 = 0
 dy_diff_def_4_9: - cy_grid_var_4 + cy_grid_var_9 + dy_diff_4_9 = 0
 dx_abs_4_9_abs_ge_orig: dx_abs_4_9 - dx_diff_4_9
   - 216 dx_abs_4_9_is_positive >= -216
 dx_abs_4_9_abs_le_orig: dx_abs_4_9 - dx_diff_4_9
   + 216 dx_abs_4_9_is_positive <= 216
 dx_abs_4_9_abs_ge_neg_orig: dx_abs_4_9 + dx_diff_4_9
   + 216 dx_abs_4_9_is_positive >= 0
 dx_abs_4_9_abs_le_neg_orig: dx_abs_4_9 + dx_diff_4_9
   - 216 dx_abs_4_9_is_positive <= 0
 dx_abs_4_9_force_positive: dx_diff_4_9 - 216 dx_abs_4_9_is_positive
   >= -216
 dx_abs_4_9_force_negative: dx_diff_4_9 - 216 dx_abs_4_9_is_positive <= 0
 dy_abs_4_9_abs_ge_orig: dy_abs_4_9 - dy_diff_4_9
   - 216 dy_abs_4_9_is_positive >= -216
 dy_abs_4_9_abs_le_orig: dy_abs_4_9 - dy_diff_4_9
   + 216 dy_abs_4_9_is_positive <= 216
 dy_abs_4_9_abs_ge_neg_orig: dy_abs_4_9 + dy_diff_4_9
   + 216 dy_abs_4_9_is_positive >= 0
 dy_abs_4_9_abs_le_neg_orig: dy_abs_4_9 + dy_diff_4_9
   - 216 dy_abs_4_9_is_positive <= 0
 dy_abs_4_9_force_positive: dy_diff_4_9 - 216 dy_abs_4_9_is_positive
   >= -216
 dy_abs_4_9_force_negative: dy_diff_4_9 - 216 dy_abs_4_9_is_positive <= 0
 dx_diff_def_4_13: - cx_grid_var_4 + cx_grid_var_13 + dx_diff_4_13 = 0
 dy_diff_def_4_13: - cy_grid_var_4 + cy_grid_var_13 + dy_diff_4_13 = 0
 dx_abs_4_13_abs_ge_orig: dx_abs_4_13 - dx_diff_4_13
   - 216 dx_abs_4_13_is_positive >= -216
 dx_abs_4_13_abs_le_orig: dx_abs_4_13 - dx_diff_4_13
   + 216 dx_abs_4_13_is_positive <= 216
 dx_abs_4_13_abs_ge_neg_orig: dx_abs_4_13 + dx_diff_4_13
   + 216 dx_abs_4_13_is_positive >= 0
 dx_abs_4_13_abs_le_neg_orig: dx_abs_4_13 + dx_diff_4_13
   - 216 dx_abs_4_13_is_positive <= 0
 dx_abs_4_13_force_positive: dx_diff_4_13 - 216 dx_abs_4_13_is_positive
   >= -216
 dx_abs_4_13_force_negative: dx_diff_4_13 - 216 dx_abs_4_13_is_positive
   <= 0
 dy_abs_4_13_abs_ge_orig: dy_abs_4_13 - dy_diff_4_13
   - 216 dy_abs_4_13_is_positive >= -216
 dy_abs_4_13_abs_le_orig: dy_abs_4_13 - dy_diff_4_13
   + 216 dy_abs_4_13_is_positive <= 216
 dy_abs_4_13_abs_ge_neg_orig: dy_abs_4_13 + dy_diff_4_13
   + 216 dy_abs_4_13_is_positive >= 0
 dy_abs_4_13_abs_le_neg_orig: dy_abs_4_13 + dy_diff_4_13
   - 216 dy_abs_4_13_is_positive <= 0
 dy_abs_4_13_force_positive: dy_diff_4_13 - 216 dy_abs_4_13_is_positive
   >= -216
 dy_abs_4_13_force_negative: dy_diff_4_13 - 216 dy_abs_4_13_is_positive
   <= 0
 dx_diff_def_5_6: - cx_grid_var_5 + cx_grid_var_6 + dx_diff_5_6 = 0
 dy_diff_def_5_6: - cy_grid_var_5 + cy_grid_var_6 + dy_diff_5_6 = 0
 dx_abs_5_6_abs_ge_orig: dx_abs_5_6 - dx_diff_5_6
   - 216 dx_abs_5_6_is_positive >= -216
 dx_abs_5_6_abs_le_orig: dx_abs_5_6 - dx_diff_5_6
   + 216 dx_abs_5_6_is_positive <= 216
 dx_abs_5_6_abs_ge_neg_orig: dx_abs_5_6 + dx_diff_5_6
   + 216 dx_abs_5_6_is_positive >= 0
 dx_abs_5_6_abs_le_neg_orig: dx_abs_5_6 + dx_diff_5_6
   - 216 dx_abs_5_6_is_positive <= 0
 dx_abs_5_6_force_positive: dx_diff_5_6 - 216 dx_abs_5_6_is_positive
   >= -216
 dx_abs_5_6_force_negative: dx_diff_5_6 - 216 dx_abs_5_6_is_positive <= 0
 dy_abs_5_6_abs_ge_orig: dy_abs_5_6 - dy_diff_5_6
   - 216 dy_abs_5_6_is_positive >= -216
 dy_abs_5_6_abs_le_orig: dy_abs_5_6 - dy_diff_5_6
   + 216 dy_abs_5_6_is_positive <= 216
 dy_abs_5_6_abs_ge_neg_orig: dy_abs_5_6 + dy_diff_5_6
   + 216 dy_abs_5_6_is_positive >= 0
 dy_abs_5_6_abs_le_neg_orig: dy_abs_5_6 + dy_diff_5_6
   - 216 dy_abs_5_6_is_positive <= 0
 dy_abs_5_6_force_positive: dy_diff_5_6 - 216 dy_abs_5_6_is_positive
   >= -216
 dy_abs_5_6_force_negative: dy_diff_5_6 - 216 dy_abs_5_6_is_positive <= 0
 dx_diff_def_5_12: - cx_grid_var_5 + cx_grid_var_12 + dx_diff_5_12 = 0
 dy_diff_def_5_12: - cy_grid_var_5 + cy_grid_var_12 + dy_diff_5_12 = 0
 dx_abs_5_12_abs_ge_orig: dx_abs_5_12 - dx_diff_5_12
   - 216 dx_abs_5_12_is_positive >= -216
 dx_abs_5_12_abs_le_orig: dx_abs_5_12 - dx_diff_5_12
   + 216 dx_abs_5_12_is_positive <= 216
 dx_abs_5_12_abs_ge_neg_orig: dx_abs_5_12 + dx_diff_5_12
   + 216 dx_abs_5_12_is_positive >= 0
 dx_abs_5_12_abs_le_neg_orig: dx_abs_5_12 + dx_diff_5_12
   - 216 dx_abs_5_12_is_positive <= 0
 dx_abs_5_12_force_positive: dx_diff_5_12 - 216 dx_abs_5_12_is_positive
   >= -216
 dx_abs_5_12_force_negative: dx_diff_5_12 - 216 dx_abs_5_12_is_positive
   <= 0
 dy_abs_5_12_abs_ge_orig: dy_abs_5_12 - dy_diff_5_12
   - 216 dy_abs_5_12_is_positive >= -216
 dy_abs_5_12_abs_le_orig: dy_abs_5_12 - dy_diff_5_12
   + 216 dy_abs_5_12_is_positive <= 216
 dy_abs_5_12_abs_ge_neg_orig: dy_abs_5_12 + dy_diff_5_12
   + 216 dy_abs_5_12_is_positive >= 0
 dy_abs_5_12_abs_le_neg_orig: dy_abs_5_12 + dy_diff_5_12
   - 216 dy_abs_5_12_is_positive <= 0
 dy_abs_5_12_force_positive: dy_diff_5_12 - 216 dy_abs_5_12_is_positive
   >= -216
 dy_abs_5_12_force_negative: dy_diff_5_12 - 216 dy_abs_5_12_is_positive
   <= 0
 dx_diff_def_7_10: - cx_grid_var_7 + cx_grid_var_10 + dx_diff_7_10 = 0
 dy_diff_def_7_10: - cy_grid_var_7 + cy_grid_var_10 + dy_diff_7_10 = 0
 dx_abs_7_10_abs_ge_orig: dx_abs_7_10 - dx_diff_7_10
   - 216 dx_abs_7_10_is_positive >= -216
 dx_abs_7_10_abs_le_orig: dx_abs_7_10 - dx_diff_7_10
   + 216 dx_abs_7_10_is_positive <= 216
 dx_abs_7_10_abs_ge_neg_orig: dx_abs_7_10 + dx_diff_7_10
   + 216 dx_abs_7_10_is_positive >= 0
 dx_abs_7_10_abs_le_neg_orig: dx_abs_7_10 + dx_diff_7_10
   - 216 dx_abs_7_10_is_positive <= 0
 dx_abs_7_10_force_positive: dx_diff_7_10 - 216 dx_abs_7_10_is_positive
   >= -216
 dx_abs_7_10_force_negative: dx_diff_7_10 - 216 dx_abs_7_10_is_positive
   <= 0
 dy_abs_7_10_abs_ge_orig: dy_abs_7_10 - dy_diff_7_10
   - 216 dy_abs_7_10_is_positive >= -216
 dy_abs_7_10_abs_le_orig: dy_abs_7_10 - dy_diff_7_10
   + 216 dy_abs_7_10_is_positive <= 216
 dy_abs_7_10_abs_ge_neg_orig: dy_abs_7_10 + dy_diff_7_10
   + 216 dy_abs_7_10_is_positive >= 0
 dy_abs_7_10_abs_le_neg_orig: dy_abs_7_10 + dy_diff_7_10
   - 216 dy_abs_7_10_is_positive <= 0
 dy_abs_7_10_force_positive: dy_diff_7_10 - 216 dy_abs_7_10_is_positive
   >= -216
 dy_abs_7_10_force_negative: dy_diff_7_10 - 216 dy_abs_7_10_is_positive
   <= 0
 dx_diff_def_7_12: - cx_grid_var_7 + cx_grid_var_12 + dx_diff_7_12 = 0
 dy_diff_def_7_12: - cy_grid_var_7 + cy_grid_var_12 + dy_diff_7_12 = 0
 dx_abs_7_12_abs_ge_orig: dx_abs_7_12 - dx_diff_7_12
   - 216 dx_abs_7_12_is_positive >= -216
 dx_abs_7_12_abs_le_orig: dx_abs_7_12 - dx_diff_7_12
   + 216 dx_abs_7_12_is_positive <= 216
 dx_abs_7_12_abs_ge_neg_orig: dx_abs_7_12 + dx_diff_7_12
   + 216 dx_abs_7_12_is_positive >= 0
 dx_abs_7_12_abs_le_neg_orig: dx_abs_7_12 + dx_diff_7_12
   - 216 dx_abs_7_12_is_positive <= 0
 dx_abs_7_12_force_positive: dx_diff_7_12 - 216 dx_abs_7_12_is_positive
   >= -216
 dx_abs_7_12_force_negative: dx_diff_7_12 - 216 dx_abs_7_12_is_positive
   <= 0
 dy_abs_7_12_abs_ge_orig: dy_abs_7_12 - dy_diff_7_12
   - 216 dy_abs_7_12_is_positive >= -216
 dy_abs_7_12_abs_le_orig: dy_abs_7_12 - dy_diff_7_12
   + 216 dy_abs_7_12_is_positive <= 216
 dy_abs_7_12_abs_ge_neg_orig: dy_abs_7_12 + dy_diff_7_12
   + 216 dy_abs_7_12_is_positive >= 0
 dy_abs_7_12_abs_le_neg_orig: dy_abs_7_12 + dy_diff_7_12
   - 216 dy_abs_7_12_is_positive <= 0
 dy_abs_7_12_force_positive: dy_diff_7_12 - 216 dy_abs_7_12_is_positive
   >= -216
 dy_abs_7_12_force_negative: dy_diff_7_12 - 216 dy_abs_7_12_is_positive
   <= 0
 dx_diff_def_8_10: - cx_grid_var_8 + cx_grid_var_10 + dx_diff_8_10 = 0
 dy_diff_def_8_10: - cy_grid_var_8 + cy_grid_var_10 + dy_diff_8_10 = 0
 dx_abs_8_10_abs_ge_orig: dx_abs_8_10 - dx_diff_8_10
   - 216 dx_abs_8_10_is_positive >= -216
 dx_abs_8_10_abs_le_orig: dx_abs_8_10 - dx_diff_8_10
   + 216 dx_abs_8_10_is_positive <= 216
 dx_abs_8_10_abs_ge_neg_orig: dx_abs_8_10 + dx_diff_8_10
   + 216 dx_abs_8_10_is_positive >= 0
 dx_abs_8_10_abs_le_neg_orig: dx_abs_8_10 + dx_diff_8_10
   - 216 dx_abs_8_10_is_positive <= 0
 dx_abs_8_10_force_positive: dx_diff_8_10 - 216 dx_abs_8_10_is_positive
   >= -216
 dx_abs_8_10_force_negative: dx_diff_8_10 - 216 dx_abs_8_10_is_positive
   <= 0
 dy_abs_8_10_abs_ge_orig: dy_abs_8_10 - dy_diff_8_10
   - 216 dy_abs_8_10_is_positive >= -216
 dy_abs_8_10_abs_le_orig: dy_abs_8_10 - dy_diff_8_10
   + 216 dy_abs_8_10_is_positive <= 216
 dy_abs_8_10_abs_ge_neg_orig: dy_abs_8_10 + dy_diff_8_10
   + 216 dy_abs_8_10_is_positive >= 0
 dy_abs_8_10_abs_le_neg_orig: dy_abs_8_10 + dy_diff_8_10
   - 216 dy_abs_8_10_is_positive <= 0
 dy_abs_8_10_force_positive: dy_diff_8_10 - 216 dy_abs_8_10_is_positive
   >= -216
 dy_abs_8_10_force_negative: dy_diff_8_10 - 216 dy_abs_8_10_is_positive
   <= 0
 dx_diff_def_9_13: - cx_grid_var_9 + cx_grid_var_13 + dx_diff_9_13 = 0
 dy_diff_def_9_13: - cy_grid_var_9 + cy_grid_var_13 + dy_diff_9_13 = 0
 dx_abs_9_13_abs_ge_orig: dx_abs_9_13 - dx_diff_9_13
   - 216 dx_abs_9_13_is_positive >= -216
 dx_abs_9_13_abs_le_orig: dx_abs_9_13 - dx_diff_9_13
   + 216 dx_abs_9_13_is_positive <= 216
 dx_abs_9_13_abs_ge_neg_orig: dx_abs_9_13 + dx_diff_9_13
   + 216 dx_abs_9_13_is_positive >= 0
 dx_abs_9_13_abs_le_neg_orig: dx_abs_9_13 + dx_diff_9_13
   - 216 dx_abs_9_13_is_positive <= 0
 dx_abs_9_13_force_positive: dx_diff_9_13 - 216 dx_abs_9_13_is_positive
   >= -216
 dx_abs_9_13_force_negative: dx_diff_9_13 - 216 dx_abs_9_13_is_positive
   <= 0
 dy_abs_9_13_abs_ge_orig: dy_abs_9_13 - dy_diff_9_13
   - 216 dy_abs_9_13_is_positive >= -216
 dy_abs_9_13_abs_le_orig: dy_abs_9_13 - dy_diff_9_13
   + 216 dy_abs_9_13_is_positive <= 216
 dy_abs_9_13_abs_ge_neg_orig: dy_abs_9_13 + dy_diff_9_13
   + 216 dy_abs_9_13_is_positive >= 0
 dy_abs_9_13_abs_le_neg_orig: dy_abs_9_13 + dy_diff_9_13
   - 216 dy_abs_9_13_is_positive <= 0
 dy_abs_9_13_force_positive: dy_diff_9_13 - 216 dy_abs_9_13_is_positive
   >= -216
 dy_abs_9_13_force_negative: dy_diff_9_13 - 216 dy_abs_9_13_is_positive
   <= 0
 dx_diff_def_11_13: - cx_grid_var_11 + cx_grid_var_13 + dx_diff_11_13 = 0
 dy_diff_def_11_13: - cy_grid_var_11 + cy_grid_var_13 + dy_diff_11_13 = 0
 dx_abs_11_13_abs_ge_orig: dx_abs_11_13 - dx_diff_11_13
   - 216 dx_abs_11_13_is_positive >= -216
 dx_abs_11_13_abs_le_orig: dx_abs_11_13 - dx_diff_11_13
   + 216 dx_abs_11_13_is_positive <= 216
 dx_abs_11_13_abs_ge_neg_orig: dx_abs_11_13 + dx_diff_11_13
   + 216 dx_abs_11_13_is_positive >= 0
 dx_abs_11_13_abs_le_neg_orig: dx_abs_11_13 + dx_diff_11_13
   - 216 dx_abs_11_13_is_positive <= 0
 dx_abs_11_13_force_positive: dx_diff_11_13 - 216 dx_abs_11_13_is_positive
   >= -216
 dx_abs_11_13_force_negative: dx_diff_11_13 - 216 dx_abs_11_13_is_positive
   <= 0
 dy_abs_11_13_abs_ge_orig: dy_abs_11_13 - dy_diff_11_13
   - 216 dy_abs_11_13_is_positive >= -216
 dy_abs_11_13_abs_le_orig: dy_abs_11_13 - dy_diff_11_13
   + 216 dy_abs_11_13_is_positive <= 216
 dy_abs_11_13_abs_ge_neg_orig: dy_abs_11_13 + dy_diff_11_13
   + 216 dy_abs_11_13_is_positive >= 0
 dy_abs_11_13_abs_le_neg_orig: dy_abs_11_13 + dy_diff_11_13
   - 216 dy_abs_11_13_is_positive <= 0
 dy_abs_11_13_force_positive: dy_diff_11_13 - 216 dy_abs_11_13_is_positive
   >= -216
 dy_abs_11_13_force_negative: dy_diff_11_13 - 216 dy_abs_11_13_is_positive
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
   - 216 dx_abs_i_0_3_is_positive >= -216
 dx_abs_i_0_3_abs_le_orig: dx_abs_i_0_3 - dx_diff_i_0_3
   + 216 dx_abs_i_0_3_is_positive <= 216
 dx_abs_i_0_3_abs_ge_neg_orig: dx_abs_i_0_3 + dx_diff_i_0_3
   + 216 dx_abs_i_0_3_is_positive >= 0
 dx_abs_i_0_3_abs_le_neg_orig: dx_abs_i_0_3 + dx_diff_i_0_3
   - 216 dx_abs_i_0_3_is_positive <= 0
 dx_abs_i_0_3_force_positive: dx_diff_i_0_3 - 216 dx_abs_i_0_3_is_positive
   >= -216
 dx_abs_i_0_3_force_negative: dx_diff_i_0_3 - 216 dx_abs_i_0_3_is_positive
   <= 0
 dy_abs_i_0_3_abs_ge_orig: dy_abs_i_0_3 - dy_diff_i_0_3
   - 216 dy_abs_i_0_3_is_positive >= -216
 dy_abs_i_0_3_abs_le_orig: dy_abs_i_0_3 - dy_diff_i_0_3
   + 216 dy_abs_i_0_3_is_positive <= 216
 dy_abs_i_0_3_abs_ge_neg_orig: dy_abs_i_0_3 + dy_diff_i_0_3
   + 216 dy_abs_i_0_3_is_positive >= 0
 dy_abs_i_0_3_abs_le_neg_orig: dy_abs_i_0_3 + dy_diff_i_0_3
   - 216 dy_abs_i_0_3_is_positive <= 0
 dy_abs_i_0_3_force_positive: dy_diff_i_0_3 - 216 dy_abs_i_0_3_is_positive
   >= -216
 dy_abs_i_0_3_force_negative: dy_diff_i_0_3 - 216 dy_abs_i_0_3_is_positive
   <= 0
 dx_abs_j_0_3_abs_ge_orig: dx_abs_j_0_3 - dx_diff_j_0_3
   - 216 dx_abs_j_0_3_is_positive >= -216
 dx_abs_j_0_3_abs_le_orig: dx_abs_j_0_3 - dx_diff_j_0_3
   + 216 dx_abs_j_0_3_is_positive <= 216
 dx_abs_j_0_3_abs_ge_neg_orig: dx_abs_j_0_3 + dx_diff_j_0_3
   + 216 dx_abs_j_0_3_is_positive >= 0
 dx_abs_j_0_3_abs_le_neg_orig: dx_abs_j_0_3 + dx_diff_j_0_3
   - 216 dx_abs_j_0_3_is_positive <= 0
 dx_abs_j_0_3_force_positive: dx_diff_j_0_3 - 216 dx_abs_j_0_3_is_positive
   >= -216
 dx_abs_j_0_3_force_negative: dx_diff_j_0_3 - 216 dx_abs_j_0_3_is_positive
   <= 0
 dy_abs_j_0_3_abs_ge_orig: dy_abs_j_0_3 - dy_diff_j_0_3
   - 216 dy_abs_j_0_3_is_positive >= -216
 dy_abs_j_0_3_abs_le_orig: dy_abs_j_0_3 - dy_diff_j_0_3
   + 216 dy_abs_j_0_3_is_positive <= 216
 dy_abs_j_0_3_abs_ge_neg_orig: dy_abs_j_0_3 + dy_diff_j_0_3
   + 216 dy_abs_j_0_3_is_positive >= 0
 dy_abs_j_0_3_abs_le_neg_orig: dy_abs_j_0_3 + dy_diff_j_0_3
   - 216 dy_abs_j_0_3_is_positive <= 0
 dy_abs_j_0_3_force_positive: dy_diff_j_0_3 - 216 dy_abs_j_0_3_is_positive
   >= -216
 dy_abs_j_0_3_force_negative: dy_diff_j_0_3 - 216 dy_abs_j_0_3_is_positive
   <= 0
 dx_diff_def_i_1_7: EMIB_cx_grid_var_1_7 - cx_grid_var_1 + dx_diff_i_1_7
   = 0
 dx_diff_def_j_1_7: EMIB_cx_grid_var_1_7 - cx_grid_var_7 + dx_diff_j_1_7
   = 0
 dy_diff_def_i_1_7: EMIB_cy_grid_var_1_7 - cy_grid_var_1 + dy_diff_i_1_7
   = 0
 dy_diff_def_j_1_7: EMIB_cy_grid_var_1_7 - cy_grid_var_7 + dy_diff_j_1_7
   = 0
 dx_abs_i_1_7_abs_ge_orig: dx_abs_i_1_7 - dx_diff_i_1_7
   - 216 dx_abs_i_1_7_is_positive >= -216
 dx_abs_i_1_7_abs_le_orig: dx_abs_i_1_7 - dx_diff_i_1_7
   + 216 dx_abs_i_1_7_is_positive <= 216
 dx_abs_i_1_7_abs_ge_neg_orig: dx_abs_i_1_7 + dx_diff_i_1_7
   + 216 dx_abs_i_1_7_is_positive >= 0
 dx_abs_i_1_7_abs_le_neg_orig: dx_abs_i_1_7 + dx_diff_i_1_7
   - 216 dx_abs_i_1_7_is_positive <= 0
 dx_abs_i_1_7_force_positive: dx_diff_i_1_7 - 216 dx_abs_i_1_7_is_positive
   >= -216
 dx_abs_i_1_7_force_negative: dx_diff_i_1_7 - 216 dx_abs_i_1_7_is_positive
   <= 0
 dy_abs_i_1_7_abs_ge_orig: dy_abs_i_1_7 - dy_diff_i_1_7
   - 216 dy_abs_i_1_7_is_positive >= -216
 dy_abs_i_1_7_abs_le_orig: dy_abs_i_1_7 - dy_diff_i_1_7
   + 216 dy_abs_i_1_7_is_positive <= 216
 dy_abs_i_1_7_abs_ge_neg_orig: dy_abs_i_1_7 + dy_diff_i_1_7
   + 216 dy_abs_i_1_7_is_positive >= 0
 dy_abs_i_1_7_abs_le_neg_orig: dy_abs_i_1_7 + dy_diff_i_1_7
   - 216 dy_abs_i_1_7_is_positive <= 0
 dy_abs_i_1_7_force_positive: dy_diff_i_1_7 - 216 dy_abs_i_1_7_is_positive
   >= -216
 dy_abs_i_1_7_force_negative: dy_diff_i_1_7 - 216 dy_abs_i_1_7_is_positive
   <= 0
 dx_abs_j_1_7_abs_ge_orig: dx_abs_j_1_7 - dx_diff_j_1_7
   - 216 dx_abs_j_1_7_is_positive >= -216
 dx_abs_j_1_7_abs_le_orig: dx_abs_j_1_7 - dx_diff_j_1_7
   + 216 dx_abs_j_1_7_is_positive <= 216
 dx_abs_j_1_7_abs_ge_neg_orig: dx_abs_j_1_7 + dx_diff_j_1_7
   + 216 dx_abs_j_1_7_is_positive >= 0
 dx_abs_j_1_7_abs_le_neg_orig: dx_abs_j_1_7 + dx_diff_j_1_7
   - 216 dx_abs_j_1_7_is_positive <= 0
 dx_abs_j_1_7_force_positive: dx_diff_j_1_7 - 216 dx_abs_j_1_7_is_positive
   >= -216
 dx_abs_j_1_7_force_negative: dx_diff_j_1_7 - 216 dx_abs_j_1_7_is_positive
   <= 0
 dy_abs_j_1_7_abs_ge_orig: dy_abs_j_1_7 - dy_diff_j_1_7
   - 216 dy_abs_j_1_7_is_positive >= -216
 dy_abs_j_1_7_abs_le_orig: dy_abs_j_1_7 - dy_diff_j_1_7
   + 216 dy_abs_j_1_7_is_positive <= 216
 dy_abs_j_1_7_abs_ge_neg_orig: dy_abs_j_1_7 + dy_diff_j_1_7
   + 216 dy_abs_j_1_7_is_positive >= 0
 dy_abs_j_1_7_abs_le_neg_orig: dy_abs_j_1_7 + dy_diff_j_1_7
   - 216 dy_abs_j_1_7_is_positive <= 0
 dy_abs_j_1_7_force_positive: dy_diff_j_1_7 - 216 dy_abs_j_1_7_is_positive
   >= -216
 dy_abs_j_1_7_force_negative: dy_diff_j_1_7 - 216 dy_abs_j_1_7_is_positive
   <= 0
 dx_diff_def_i_2_11: EMIB_cx_grid_var_2_11 - cx_grid_var_2 + dx_diff_i_2_11
   = 0
 dx_diff_def_j_2_11: EMIB_cx_grid_var_2_11 - cx_grid_var_11
   + dx_diff_j_2_11 = 0
 dy_diff_def_i_2_11: EMIB_cy_grid_var_2_11 - cy_grid_var_2 + dy_diff_i_2_11
   = 0
 dy_diff_def_j_2_11: EMIB_cy_grid_var_2_11 - cy_grid_var_11
   + dy_diff_j_2_11 = 0
 dx_abs_i_2_11_abs_ge_orig: dx_abs_i_2_11 - dx_diff_i_2_11
   - 216 dx_abs_i_2_11_is_positive >= -216
 dx_abs_i_2_11_abs_le_orig: dx_abs_i_2_11 - dx_diff_i_2_11
   + 216 dx_abs_i_2_11_is_positive <= 216
 dx_abs_i_2_11_abs_ge_neg_orig: dx_abs_i_2_11 + dx_diff_i_2_11
   + 216 dx_abs_i_2_11_is_positive >= 0
 dx_abs_i_2_11_abs_le_neg_orig: dx_abs_i_2_11 + dx_diff_i_2_11
   - 216 dx_abs_i_2_11_is_positive <= 0
 dx_abs_i_2_11_force_positive: dx_diff_i_2_11
   - 216 dx_abs_i_2_11_is_positive >= -216
 dx_abs_i_2_11_force_negative: dx_diff_i_2_11
   - 216 dx_abs_i_2_11_is_positive <= 0
 dy_abs_i_2_11_abs_ge_orig: dy_abs_i_2_11 - dy_diff_i_2_11
   - 216 dy_abs_i_2_11_is_positive >= -216
 dy_abs_i_2_11_abs_le_orig: dy_abs_i_2_11 - dy_diff_i_2_11
   + 216 dy_abs_i_2_11_is_positive <= 216
 dy_abs_i_2_11_abs_ge_neg_orig: dy_abs_i_2_11 + dy_diff_i_2_11
   + 216 dy_abs_i_2_11_is_positive >= 0
 dy_abs_i_2_11_abs_le_neg_orig: dy_abs_i_2_11 + dy_diff_i_2_11
   - 216 dy_abs_i_2_11_is_positive <= 0
 dy_abs_i_2_11_force_positive: dy_diff_i_2_11
   - 216 dy_abs_i_2_11_is_positive >= -216
 dy_abs_i_2_11_force_negative: dy_diff_i_2_11
   - 216 dy_abs_i_2_11_is_positive <= 0
 dx_abs_j_2_11_abs_ge_orig: dx_abs_j_2_11 - dx_diff_j_2_11
   - 216 dx_abs_j_2_11_is_positive >= -216
 dx_abs_j_2_11_abs_le_orig: dx_abs_j_2_11 - dx_diff_j_2_11
   + 216 dx_abs_j_2_11_is_positive <= 216
 dx_abs_j_2_11_abs_ge_neg_orig: dx_abs_j_2_11 + dx_diff_j_2_11
   + 216 dx_abs_j_2_11_is_positive >= 0
 dx_abs_j_2_11_abs_le_neg_orig: dx_abs_j_2_11 + dx_diff_j_2_11
   - 216 dx_abs_j_2_11_is_positive <= 0
 dx_abs_j_2_11_force_positive: dx_diff_j_2_11
   - 216 dx_abs_j_2_11_is_positive >= -216
 dx_abs_j_2_11_force_negative: dx_diff_j_2_11
   - 216 dx_abs_j_2_11_is_positive <= 0
 dy_abs_j_2_11_abs_ge_orig: dy_abs_j_2_11 - dy_diff_j_2_11
   - 216 dy_abs_j_2_11_is_positive >= -216
 dy_abs_j_2_11_abs_le_orig: dy_abs_j_2_11 - dy_diff_j_2_11
   + 216 dy_abs_j_2_11_is_positive <= 216
 dy_abs_j_2_11_abs_ge_neg_orig: dy_abs_j_2_11 + dy_diff_j_2_11
   + 216 dy_abs_j_2_11_is_positive >= 0
 dy_abs_j_2_11_abs_le_neg_orig: dy_abs_j_2_11 + dy_diff_j_2_11
   - 216 dy_abs_j_2_11_is_positive <= 0
 dy_abs_j_2_11_force_positive: dy_diff_j_2_11
   - 216 dy_abs_j_2_11_is_positive >= -216
 dy_abs_j_2_11_force_negative: dy_diff_j_2_11
   - 216 dy_abs_j_2_11_is_positive <= 0
 dx_diff_def_i_2_12: EMIB_cx_grid_var_2_12 - cx_grid_var_2 + dx_diff_i_2_12
   = 0
 dx_diff_def_j_2_12: EMIB_cx_grid_var_2_12 - cx_grid_var_12
   + dx_diff_j_2_12 = 0
 dy_diff_def_i_2_12: EMIB_cy_grid_var_2_12 - cy_grid_var_2 + dy_diff_i_2_12
   = 0
 dy_diff_def_j_2_12: EMIB_cy_grid_var_2_12 - cy_grid_var_12
   + dy_diff_j_2_12 = 0
 dx_abs_i_2_12_abs_ge_orig: dx_abs_i_2_12 - dx_diff_i_2_12
   - 216 dx_abs_i_2_12_is_positive >= -216
 dx_abs_i_2_12_abs_le_orig: dx_abs_i_2_12 - dx_diff_i_2_12
   + 216 dx_abs_i_2_12_is_positive <= 216
 dx_abs_i_2_12_abs_ge_neg_orig: dx_abs_i_2_12 + dx_diff_i_2_12
   + 216 dx_abs_i_2_12_is_positive >= 0
 dx_abs_i_2_12_abs_le_neg_orig: dx_abs_i_2_12 + dx_diff_i_2_12
   - 216 dx_abs_i_2_12_is_positive <= 0
 dx_abs_i_2_12_force_positive: dx_diff_i_2_12
   - 216 dx_abs_i_2_12_is_positive >= -216
 dx_abs_i_2_12_force_negative: dx_diff_i_2_12
   - 216 dx_abs_i_2_12_is_positive <= 0
 dy_abs_i_2_12_abs_ge_orig: dy_abs_i_2_12 - dy_diff_i_2_12
   - 216 dy_abs_i_2_12_is_positive >= -216
 dy_abs_i_2_12_abs_le_orig: dy_abs_i_2_12 - dy_diff_i_2_12
   + 216 dy_abs_i_2_12_is_positive <= 216
 dy_abs_i_2_12_abs_ge_neg_orig: dy_abs_i_2_12 + dy_diff_i_2_12
   + 216 dy_abs_i_2_12_is_positive >= 0
 dy_abs_i_2_12_abs_le_neg_orig: dy_abs_i_2_12 + dy_diff_i_2_12
   - 216 dy_abs_i_2_12_is_positive <= 0
 dy_abs_i_2_12_force_positive: dy_diff_i_2_12
   - 216 dy_abs_i_2_12_is_positive >= -216
 dy_abs_i_2_12_force_negative: dy_diff_i_2_12
   - 216 dy_abs_i_2_12_is_positive <= 0
 dx_abs_j_2_12_abs_ge_orig: dx_abs_j_2_12 - dx_diff_j_2_12
   - 216 dx_abs_j_2_12_is_positive >= -216
 dx_abs_j_2_12_abs_le_orig: dx_abs_j_2_12 - dx_diff_j_2_12
   + 216 dx_abs_j_2_12_is_positive <= 216
 dx_abs_j_2_12_abs_ge_neg_orig: dx_abs_j_2_12 + dx_diff_j_2_12
   + 216 dx_abs_j_2_12_is_positive >= 0
 dx_abs_j_2_12_abs_le_neg_orig: dx_abs_j_2_12 + dx_diff_j_2_12
   - 216 dx_abs_j_2_12_is_positive <= 0
 dx_abs_j_2_12_force_positive: dx_diff_j_2_12
   - 216 dx_abs_j_2_12_is_positive >= -216
 dx_abs_j_2_12_force_negative: dx_diff_j_2_12
   - 216 dx_abs_j_2_12_is_positive <= 0
 dy_abs_j_2_12_abs_ge_orig: dy_abs_j_2_12 - dy_diff_j_2_12
   - 216 dy_abs_j_2_12_is_positive >= -216
 dy_abs_j_2_12_abs_le_orig: dy_abs_j_2_12 - dy_diff_j_2_12
   + 216 dy_abs_j_2_12_is_positive <= 216
 dy_abs_j_2_12_abs_ge_neg_orig: dy_abs_j_2_12 + dy_diff_j_2_12
   + 216 dy_abs_j_2_12_is_positive >= 0
 dy_abs_j_2_12_abs_le_neg_orig: dy_abs_j_2_12 + dy_diff_j_2_12
   - 216 dy_abs_j_2_12_is_positive <= 0
 dy_abs_j_2_12_force_positive: dy_diff_j_2_12
   - 216 dy_abs_j_2_12_is_positive >= -216
 dy_abs_j_2_12_force_negative: dy_diff_j_2_12
   - 216 dy_abs_j_2_12_is_positive <= 0
 dx_diff_def_i_3_7: EMIB_cx_grid_var_3_7 - cx_grid_var_3 + dx_diff_i_3_7
   = 0
 dx_diff_def_j_3_7: EMIB_cx_grid_var_3_7 - cx_grid_var_7 + dx_diff_j_3_7
   = 0
 dy_diff_def_i_3_7: EMIB_cy_grid_var_3_7 - cy_grid_var_3 + dy_diff_i_3_7
   = 0
 dy_diff_def_j_3_7: EMIB_cy_grid_var_3_7 - cy_grid_var_7 + dy_diff_j_3_7
   = 0
 dx_abs_i_3_7_abs_ge_orig: dx_abs_i_3_7 - dx_diff_i_3_7
   - 216 dx_abs_i_3_7_is_positive >= -216
 dx_abs_i_3_7_abs_le_orig: dx_abs_i_3_7 - dx_diff_i_3_7
   + 216 dx_abs_i_3_7_is_positive <= 216
 dx_abs_i_3_7_abs_ge_neg_orig: dx_abs_i_3_7 + dx_diff_i_3_7
   + 216 dx_abs_i_3_7_is_positive >= 0
 dx_abs_i_3_7_abs_le_neg_orig: dx_abs_i_3_7 + dx_diff_i_3_7
   - 216 dx_abs_i_3_7_is_positive <= 0
 dx_abs_i_3_7_force_positive: dx_diff_i_3_7 - 216 dx_abs_i_3_7_is_positive
   >= -216
 dx_abs_i_3_7_force_negative: dx_diff_i_3_7 - 216 dx_abs_i_3_7_is_positive
   <= 0
 dy_abs_i_3_7_abs_ge_orig: dy_abs_i_3_7 - dy_diff_i_3_7
   - 216 dy_abs_i_3_7_is_positive >= -216
 dy_abs_i_3_7_abs_le_orig: dy_abs_i_3_7 - dy_diff_i_3_7
   + 216 dy_abs_i_3_7_is_positive <= 216
 dy_abs_i_3_7_abs_ge_neg_orig: dy_abs_i_3_7 + dy_diff_i_3_7
   + 216 dy_abs_i_3_7_is_positive >= 0
 dy_abs_i_3_7_abs_le_neg_orig: dy_abs_i_3_7 + dy_diff_i_3_7
   - 216 dy_abs_i_3_7_is_positive <= 0
 dy_abs_i_3_7_force_positive: dy_diff_i_3_7 - 216 dy_abs_i_3_7_is_positive
   >= -216
 dy_abs_i_3_7_force_negative: dy_diff_i_3_7 - 216 dy_abs_i_3_7_is_positive
   <= 0
 dx_abs_j_3_7_abs_ge_orig: dx_abs_j_3_7 - dx_diff_j_3_7
   - 216 dx_abs_j_3_7_is_positive >= -216
 dx_abs_j_3_7_abs_le_orig: dx_abs_j_3_7 - dx_diff_j_3_7
   + 216 dx_abs_j_3_7_is_positive <= 216
 dx_abs_j_3_7_abs_ge_neg_orig: dx_abs_j_3_7 + dx_diff_j_3_7
   + 216 dx_abs_j_3_7_is_positive >= 0
 dx_abs_j_3_7_abs_le_neg_orig: dx_abs_j_3_7 + dx_diff_j_3_7
   - 216 dx_abs_j_3_7_is_positive <= 0
 dx_abs_j_3_7_force_positive: dx_diff_j_3_7 - 216 dx_abs_j_3_7_is_positive
   >= -216
 dx_abs_j_3_7_force_negative: dx_diff_j_3_7 - 216 dx_abs_j_3_7_is_positive
   <= 0
 dy_abs_j_3_7_abs_ge_orig: dy_abs_j_3_7 - dy_diff_j_3_7
   - 216 dy_abs_j_3_7_is_positive >= -216
 dy_abs_j_3_7_abs_le_orig: dy_abs_j_3_7 - dy_diff_j_3_7
   + 216 dy_abs_j_3_7_is_positive <= 216
 dy_abs_j_3_7_abs_ge_neg_orig: dy_abs_j_3_7 + dy_diff_j_3_7
   + 216 dy_abs_j_3_7_is_positive >= 0
 dy_abs_j_3_7_abs_le_neg_orig: dy_abs_j_3_7 + dy_diff_j_3_7
   - 216 dy_abs_j_3_7_is_positive <= 0
 dy_abs_j_3_7_force_positive: dy_diff_j_3_7 - 216 dy_abs_j_3_7_is_positive
   >= -216
 dy_abs_j_3_7_force_negative: dy_diff_j_3_7 - 216 dy_abs_j_3_7_is_positive
   <= 0
 dx_diff_def_i_3_10: EMIB_cx_grid_var_3_10 - cx_grid_var_3 + dx_diff_i_3_10
   = 0
 dx_diff_def_j_3_10: EMIB_cx_grid_var_3_10 - cx_grid_var_10
   + dx_diff_j_3_10 = 0
 dy_diff_def_i_3_10: EMIB_cy_grid_var_3_10 - cy_grid_var_3 + dy_diff_i_3_10
   = 0
 dy_diff_def_j_3_10: EMIB_cy_grid_var_3_10 - cy_grid_var_10
   + dy_diff_j_3_10 = 0
 dx_abs_i_3_10_abs_ge_orig: dx_abs_i_3_10 - dx_diff_i_3_10
   - 216 dx_abs_i_3_10_is_positive >= -216
 dx_abs_i_3_10_abs_le_orig: dx_abs_i_3_10 - dx_diff_i_3_10
   + 216 dx_abs_i_3_10_is_positive <= 216
 dx_abs_i_3_10_abs_ge_neg_orig: dx_abs_i_3_10 + dx_diff_i_3_10
   + 216 dx_abs_i_3_10_is_positive >= 0
 dx_abs_i_3_10_abs_le_neg_orig: dx_abs_i_3_10 + dx_diff_i_3_10
   - 216 dx_abs_i_3_10_is_positive <= 0
 dx_abs_i_3_10_force_positive: dx_diff_i_3_10
   - 216 dx_abs_i_3_10_is_positive >= -216
 dx_abs_i_3_10_force_negative: dx_diff_i_3_10
   - 216 dx_abs_i_3_10_is_positive <= 0
 dy_abs_i_3_10_abs_ge_orig: dy_abs_i_3_10 - dy_diff_i_3_10
   - 216 dy_abs_i_3_10_is_positive >= -216
 dy_abs_i_3_10_abs_le_orig: dy_abs_i_3_10 - dy_diff_i_3_10
   + 216 dy_abs_i_3_10_is_positive <= 216
 dy_abs_i_3_10_abs_ge_neg_orig: dy_abs_i_3_10 + dy_diff_i_3_10
   + 216 dy_abs_i_3_10_is_positive >= 0
 dy_abs_i_3_10_abs_le_neg_orig: dy_abs_i_3_10 + dy_diff_i_3_10
   - 216 dy_abs_i_3_10_is_positive <= 0
 dy_abs_i_3_10_force_positive: dy_diff_i_3_10
   - 216 dy_abs_i_3_10_is_positive >= -216
 dy_abs_i_3_10_force_negative: dy_diff_i_3_10
   - 216 dy_abs_i_3_10_is_positive <= 0
 dx_abs_j_3_10_abs_ge_orig: dx_abs_j_3_10 - dx_diff_j_3_10
   - 216 dx_abs_j_3_10_is_positive >= -216
 dx_abs_j_3_10_abs_le_orig: dx_abs_j_3_10 - dx_diff_j_3_10
   + 216 dx_abs_j_3_10_is_positive <= 216
 dx_abs_j_3_10_abs_ge_neg_orig: dx_abs_j_3_10 + dx_diff_j_3_10
   + 216 dx_abs_j_3_10_is_positive >= 0
 dx_abs_j_3_10_abs_le_neg_orig: dx_abs_j_3_10 + dx_diff_j_3_10
   - 216 dx_abs_j_3_10_is_positive <= 0
 dx_abs_j_3_10_force_positive: dx_diff_j_3_10
   - 216 dx_abs_j_3_10_is_positive >= -216
 dx_abs_j_3_10_force_negative: dx_diff_j_3_10
   - 216 dx_abs_j_3_10_is_positive <= 0
 dy_abs_j_3_10_abs_ge_orig: dy_abs_j_3_10 - dy_diff_j_3_10
   - 216 dy_abs_j_3_10_is_positive >= -216
 dy_abs_j_3_10_abs_le_orig: dy_abs_j_3_10 - dy_diff_j_3_10
   + 216 dy_abs_j_3_10_is_positive <= 216
 dy_abs_j_3_10_abs_ge_neg_orig: dy_abs_j_3_10 + dy_diff_j_3_10
   + 216 dy_abs_j_3_10_is_positive >= 0
 dy_abs_j_3_10_abs_le_neg_orig: dy_abs_j_3_10 + dy_diff_j_3_10
   - 216 dy_abs_j_3_10_is_positive <= 0
 dy_abs_j_3_10_force_positive: dy_diff_j_3_10
   - 216 dy_abs_j_3_10_is_positive >= -216
 dy_abs_j_3_10_force_negative: dy_diff_j_3_10
   - 216 dy_abs_j_3_10_is_positive <= 0
 dx_diff_def_i_4_6: EMIB_cx_grid_var_4_6 - cx_grid_var_4 + dx_diff_i_4_6
   = 0
 dx_diff_def_j_4_6: EMIB_cx_grid_var_4_6 - cx_grid_var_6 + dx_diff_j_4_6
   = 0
 dy_diff_def_i_4_6: EMIB_cy_grid_var_4_6 - cy_grid_var_4 + dy_diff_i_4_6
   = 0
 dy_diff_def_j_4_6: EMIB_cy_grid_var_4_6 - cy_grid_var_6 + dy_diff_j_4_6
   = 0
 dx_abs_i_4_6_abs_ge_orig: dx_abs_i_4_6 - dx_diff_i_4_6
   - 216 dx_abs_i_4_6_is_positive >= -216
 dx_abs_i_4_6_abs_le_orig: dx_abs_i_4_6 - dx_diff_i_4_6
   + 216 dx_abs_i_4_6_is_positive <= 216
 dx_abs_i_4_6_abs_ge_neg_orig: dx_abs_i_4_6 + dx_diff_i_4_6
   + 216 dx_abs_i_4_6_is_positive >= 0
 dx_abs_i_4_6_abs_le_neg_orig: dx_abs_i_4_6 + dx_diff_i_4_6
   - 216 dx_abs_i_4_6_is_positive <= 0
 dx_abs_i_4_6_force_positive: dx_diff_i_4_6 - 216 dx_abs_i_4_6_is_positive
   >= -216
 dx_abs_i_4_6_force_negative: dx_diff_i_4_6 - 216 dx_abs_i_4_6_is_positive
   <= 0
 dy_abs_i_4_6_abs_ge_orig: dy_abs_i_4_6 - dy_diff_i_4_6
   - 216 dy_abs_i_4_6_is_positive >= -216
 dy_abs_i_4_6_abs_le_orig: dy_abs_i_4_6 - dy_diff_i_4_6
   + 216 dy_abs_i_4_6_is_positive <= 216
 dy_abs_i_4_6_abs_ge_neg_orig: dy_abs_i_4_6 + dy_diff_i_4_6
   + 216 dy_abs_i_4_6_is_positive >= 0
 dy_abs_i_4_6_abs_le_neg_orig: dy_abs_i_4_6 + dy_diff_i_4_6
   - 216 dy_abs_i_4_6_is_positive <= 0
 dy_abs_i_4_6_force_positive: dy_diff_i_4_6 - 216 dy_abs_i_4_6_is_positive
   >= -216
 dy_abs_i_4_6_force_negative: dy_diff_i_4_6 - 216 dy_abs_i_4_6_is_positive
   <= 0
 dx_abs_j_4_6_abs_ge_orig: dx_abs_j_4_6 - dx_diff_j_4_6
   - 216 dx_abs_j_4_6_is_positive >= -216
 dx_abs_j_4_6_abs_le_orig: dx_abs_j_4_6 - dx_diff_j_4_6
   + 216 dx_abs_j_4_6_is_positive <= 216
 dx_abs_j_4_6_abs_ge_neg_orig: dx_abs_j_4_6 + dx_diff_j_4_6
   + 216 dx_abs_j_4_6_is_positive >= 0
 dx_abs_j_4_6_abs_le_neg_orig: dx_abs_j_4_6 + dx_diff_j_4_6
   - 216 dx_abs_j_4_6_is_positive <= 0
 dx_abs_j_4_6_force_positive: dx_diff_j_4_6 - 216 dx_abs_j_4_6_is_positive
   >= -216
 dx_abs_j_4_6_force_negative: dx_diff_j_4_6 - 216 dx_abs_j_4_6_is_positive
   <= 0
 dy_abs_j_4_6_abs_ge_orig: dy_abs_j_4_6 - dy_diff_j_4_6
   - 216 dy_abs_j_4_6_is_positive >= -216
 dy_abs_j_4_6_abs_le_orig: dy_abs_j_4_6 - dy_diff_j_4_6
   + 216 dy_abs_j_4_6_is_positive <= 216
 dy_abs_j_4_6_abs_ge_neg_orig: dy_abs_j_4_6 + dy_diff_j_4_6
   + 216 dy_abs_j_4_6_is_positive >= 0
 dy_abs_j_4_6_abs_le_neg_orig: dy_abs_j_4_6 + dy_diff_j_4_6
   - 216 dy_abs_j_4_6_is_positive <= 0
 dy_abs_j_4_6_force_positive: dy_diff_j_4_6 - 216 dy_abs_j_4_6_is_positive
   >= -216
 dy_abs_j_4_6_force_negative: dy_diff_j_4_6 - 216 dy_abs_j_4_6_is_positive
   <= 0
 dx_diff_def_i_4_8: EMIB_cx_grid_var_4_8 - cx_grid_var_4 + dx_diff_i_4_8
   = 0
 dx_diff_def_j_4_8: EMIB_cx_grid_var_4_8 - cx_grid_var_8 + dx_diff_j_4_8
   = 0
 dy_diff_def_i_4_8: EMIB_cy_grid_var_4_8 - cy_grid_var_4 + dy_diff_i_4_8
   = 0
 dy_diff_def_j_4_8: EMIB_cy_grid_var_4_8 - cy_grid_var_8 + dy_diff_j_4_8
   = 0
 dx_abs_i_4_8_abs_ge_orig: dx_abs_i_4_8 - dx_diff_i_4_8
   - 216 dx_abs_i_4_8_is_positive >= -216
 dx_abs_i_4_8_abs_le_orig: dx_abs_i_4_8 - dx_diff_i_4_8
   + 216 dx_abs_i_4_8_is_positive <= 216
 dx_abs_i_4_8_abs_ge_neg_orig: dx_abs_i_4_8 + dx_diff_i_4_8
   + 216 dx_abs_i_4_8_is_positive >= 0
 dx_abs_i_4_8_abs_le_neg_orig: dx_abs_i_4_8 + dx_diff_i_4_8
   - 216 dx_abs_i_4_8_is_positive <= 0
 dx_abs_i_4_8_force_positive: dx_diff_i_4_8 - 216 dx_abs_i_4_8_is_positive
   >= -216
 dx_abs_i_4_8_force_negative: dx_diff_i_4_8 - 216 dx_abs_i_4_8_is_positive
   <= 0
 dy_abs_i_4_8_abs_ge_orig: dy_abs_i_4_8 - dy_diff_i_4_8
   - 216 dy_abs_i_4_8_is_positive >= -216
 dy_abs_i_4_8_abs_le_orig: dy_abs_i_4_8 - dy_diff_i_4_8
   + 216 dy_abs_i_4_8_is_positive <= 216
 dy_abs_i_4_8_abs_ge_neg_orig: dy_abs_i_4_8 + dy_diff_i_4_8
   + 216 dy_abs_i_4_8_is_positive >= 0
 dy_abs_i_4_8_abs_le_neg_orig: dy_abs_i_4_8 + dy_diff_i_4_8
   - 216 dy_abs_i_4_8_is_positive <= 0
 dy_abs_i_4_8_force_positive: dy_diff_i_4_8 - 216 dy_abs_i_4_8_is_positive
   >= -216
 dy_abs_i_4_8_force_negative: dy_diff_i_4_8 - 216 dy_abs_i_4_8_is_positive
   <= 0
 dx_abs_j_4_8_abs_ge_orig: dx_abs_j_4_8 - dx_diff_j_4_8
   - 216 dx_abs_j_4_8_is_positive >= -216
 dx_abs_j_4_8_abs_le_orig: dx_abs_j_4_8 - dx_diff_j_4_8
   + 216 dx_abs_j_4_8_is_positive <= 216
 dx_abs_j_4_8_abs_ge_neg_orig: dx_abs_j_4_8 + dx_diff_j_4_8
   + 216 dx_abs_j_4_8_is_positive >= 0
 dx_abs_j_4_8_abs_le_neg_orig: dx_abs_j_4_8 + dx_diff_j_4_8
   - 216 dx_abs_j_4_8_is_positive <= 0
 dx_abs_j_4_8_force_positive: dx_diff_j_4_8 - 216 dx_abs_j_4_8_is_positive
   >= -216
 dx_abs_j_4_8_force_negative: dx_diff_j_4_8 - 216 dx_abs_j_4_8_is_positive
   <= 0
 dy_abs_j_4_8_abs_ge_orig: dy_abs_j_4_8 - dy_diff_j_4_8
   - 216 dy_abs_j_4_8_is_positive >= -216
 dy_abs_j_4_8_abs_le_orig: dy_abs_j_4_8 - dy_diff_j_4_8
   + 216 dy_abs_j_4_8_is_positive <= 216
 dy_abs_j_4_8_abs_ge_neg_orig: dy_abs_j_4_8 + dy_diff_j_4_8
   + 216 dy_abs_j_4_8_is_positive >= 0
 dy_abs_j_4_8_abs_le_neg_orig: dy_abs_j_4_8 + dy_diff_j_4_8
   - 216 dy_abs_j_4_8_is_positive <= 0
 dy_abs_j_4_8_force_positive: dy_diff_j_4_8 - 216 dy_abs_j_4_8_is_positive
   >= -216
 dy_abs_j_4_8_force_negative: dy_diff_j_4_8 - 216 dy_abs_j_4_8_is_positive
   <= 0
 dx_diff_def_i_5_13: EMIB_cx_grid_var_5_13 - cx_grid_var_5 + dx_diff_i_5_13
   = 0
 dx_diff_def_j_5_13: EMIB_cx_grid_var_5_13 - cx_grid_var_13
   + dx_diff_j_5_13 = 0
 dy_diff_def_i_5_13: EMIB_cy_grid_var_5_13 - cy_grid_var_5 + dy_diff_i_5_13
   = 0
 dy_diff_def_j_5_13: EMIB_cy_grid_var_5_13 - cy_grid_var_13
   + dy_diff_j_5_13 = 0
 dx_abs_i_5_13_abs_ge_orig: dx_abs_i_5_13 - dx_diff_i_5_13
   - 216 dx_abs_i_5_13_is_positive >= -216
 dx_abs_i_5_13_abs_le_orig: dx_abs_i_5_13 - dx_diff_i_5_13
   + 216 dx_abs_i_5_13_is_positive <= 216
 dx_abs_i_5_13_abs_ge_neg_orig: dx_abs_i_5_13 + dx_diff_i_5_13
   + 216 dx_abs_i_5_13_is_positive >= 0
 dx_abs_i_5_13_abs_le_neg_orig: dx_abs_i_5_13 + dx_diff_i_5_13
   - 216 dx_abs_i_5_13_is_positive <= 0
 dx_abs_i_5_13_force_positive: dx_diff_i_5_13
   - 216 dx_abs_i_5_13_is_positive >= -216
 dx_abs_i_5_13_force_negative: dx_diff_i_5_13
   - 216 dx_abs_i_5_13_is_positive <= 0
 dy_abs_i_5_13_abs_ge_orig: dy_abs_i_5_13 - dy_diff_i_5_13
   - 216 dy_abs_i_5_13_is_positive >= -216
 dy_abs_i_5_13_abs_le_orig: dy_abs_i_5_13 - dy_diff_i_5_13
   + 216 dy_abs_i_5_13_is_positive <= 216
 dy_abs_i_5_13_abs_ge_neg_orig: dy_abs_i_5_13 + dy_diff_i_5_13
   + 216 dy_abs_i_5_13_is_positive >= 0
 dy_abs_i_5_13_abs_le_neg_orig: dy_abs_i_5_13 + dy_diff_i_5_13
   - 216 dy_abs_i_5_13_is_positive <= 0
 dy_abs_i_5_13_force_positive: dy_diff_i_5_13
   - 216 dy_abs_i_5_13_is_positive >= -216
 dy_abs_i_5_13_force_negative: dy_diff_i_5_13
   - 216 dy_abs_i_5_13_is_positive <= 0
 dx_abs_j_5_13_abs_ge_orig: dx_abs_j_5_13 - dx_diff_j_5_13
   - 216 dx_abs_j_5_13_is_positive >= -216
 dx_abs_j_5_13_abs_le_orig: dx_abs_j_5_13 - dx_diff_j_5_13
   + 216 dx_abs_j_5_13_is_positive <= 216
 dx_abs_j_5_13_abs_ge_neg_orig: dx_abs_j_5_13 + dx_diff_j_5_13
   + 216 dx_abs_j_5_13_is_positive >= 0
 dx_abs_j_5_13_abs_le_neg_orig: dx_abs_j_5_13 + dx_diff_j_5_13
   - 216 dx_abs_j_5_13_is_positive <= 0
 dx_abs_j_5_13_force_positive: dx_diff_j_5_13
   - 216 dx_abs_j_5_13_is_positive >= -216
 dx_abs_j_5_13_force_negative: dx_diff_j_5_13
   - 216 dx_abs_j_5_13_is_positive <= 0
 dy_abs_j_5_13_abs_ge_orig: dy_abs_j_5_13 - dy_diff_j_5_13
   - 216 dy_abs_j_5_13_is_positive >= -216
 dy_abs_j_5_13_abs_le_orig: dy_abs_j_5_13 - dy_diff_j_5_13
   + 216 dy_abs_j_5_13_is_positive <= 216
 dy_abs_j_5_13_abs_ge_neg_orig: dy_abs_j_5_13 + dy_diff_j_5_13
   + 216 dy_abs_j_5_13_is_positive >= 0
 dy_abs_j_5_13_abs_le_neg_orig: dy_abs_j_5_13 + dy_diff_j_5_13
   - 216 dy_abs_j_5_13_is_positive <= 0
 dy_abs_j_5_13_force_positive: dy_diff_j_5_13
   - 216 dy_abs_j_5_13_is_positive >= -216
 dy_abs_j_5_13_force_negative: dy_diff_j_5_13
   - 216 dy_abs_j_5_13_is_positive <= 0
 dx_diff_def_i_6_10: EMIB_cx_grid_var_6_10 - cx_grid_var_6 + dx_diff_i_6_10
   = 0
 dx_diff_def_j_6_10: EMIB_cx_grid_var_6_10 - cx_grid_var_10
   + dx_diff_j_6_10 = 0
 dy_diff_def_i_6_10: EMIB_cy_grid_var_6_10 - cy_grid_var_6 + dy_diff_i_6_10
   = 0
 dy_diff_def_j_6_10: EMIB_cy_grid_var_6_10 - cy_grid_var_10
   + dy_diff_j_6_10 = 0
 dx_abs_i_6_10_abs_ge_orig: dx_abs_i_6_10 - dx_diff_i_6_10
   - 216 dx_abs_i_6_10_is_positive >= -216
 dx_abs_i_6_10_abs_le_orig: dx_abs_i_6_10 - dx_diff_i_6_10
   + 216 dx_abs_i_6_10_is_positive <= 216
 dx_abs_i_6_10_abs_ge_neg_orig: dx_abs_i_6_10 + dx_diff_i_6_10
   + 216 dx_abs_i_6_10_is_positive >= 0
 dx_abs_i_6_10_abs_le_neg_orig: dx_abs_i_6_10 + dx_diff_i_6_10
   - 216 dx_abs_i_6_10_is_positive <= 0
 dx_abs_i_6_10_force_positive: dx_diff_i_6_10
   - 216 dx_abs_i_6_10_is_positive >= -216
 dx_abs_i_6_10_force_negative: dx_diff_i_6_10
   - 216 dx_abs_i_6_10_is_positive <= 0
 dy_abs_i_6_10_abs_ge_orig: dy_abs_i_6_10 - dy_diff_i_6_10
   - 216 dy_abs_i_6_10_is_positive >= -216
 dy_abs_i_6_10_abs_le_orig: dy_abs_i_6_10 - dy_diff_i_6_10
   + 216 dy_abs_i_6_10_is_positive <= 216
 dy_abs_i_6_10_abs_ge_neg_orig: dy_abs_i_6_10 + dy_diff_i_6_10
   + 216 dy_abs_i_6_10_is_positive >= 0
 dy_abs_i_6_10_abs_le_neg_orig: dy_abs_i_6_10 + dy_diff_i_6_10
   - 216 dy_abs_i_6_10_is_positive <= 0
 dy_abs_i_6_10_force_positive: dy_diff_i_6_10
   - 216 dy_abs_i_6_10_is_positive >= -216
 dy_abs_i_6_10_force_negative: dy_diff_i_6_10
   - 216 dy_abs_i_6_10_is_positive <= 0
 dx_abs_j_6_10_abs_ge_orig: dx_abs_j_6_10 - dx_diff_j_6_10
   - 216 dx_abs_j_6_10_is_positive >= -216
 dx_abs_j_6_10_abs_le_orig: dx_abs_j_6_10 - dx_diff_j_6_10
   + 216 dx_abs_j_6_10_is_positive <= 216
 dx_abs_j_6_10_abs_ge_neg_orig: dx_abs_j_6_10 + dx_diff_j_6_10
   + 216 dx_abs_j_6_10_is_positive >= 0
 dx_abs_j_6_10_abs_le_neg_orig: dx_abs_j_6_10 + dx_diff_j_6_10
   - 216 dx_abs_j_6_10_is_positive <= 0
 dx_abs_j_6_10_force_positive: dx_diff_j_6_10
   - 216 dx_abs_j_6_10_is_positive >= -216
 dx_abs_j_6_10_force_negative: dx_diff_j_6_10
   - 216 dx_abs_j_6_10_is_positive <= 0
 dy_abs_j_6_10_abs_ge_orig: dy_abs_j_6_10 - dy_diff_j_6_10
   - 216 dy_abs_j_6_10_is_positive >= -216
 dy_abs_j_6_10_abs_le_orig: dy_abs_j_6_10 - dy_diff_j_6_10
   + 216 dy_abs_j_6_10_is_positive <= 216
 dy_abs_j_6_10_abs_ge_neg_orig: dy_abs_j_6_10 + dy_diff_j_6_10
   + 216 dy_abs_j_6_10_is_positive >= 0
 dy_abs_j_6_10_abs_le_neg_orig: dy_abs_j_6_10 + dy_diff_j_6_10
   - 216 dy_abs_j_6_10_is_positive <= 0
 dy_abs_j_6_10_force_positive: dy_diff_j_6_10
   - 216 dy_abs_j_6_10_is_positive >= -216
 dy_abs_j_6_10_force_negative: dy_diff_j_6_10
   - 216 dy_abs_j_6_10_is_positive <= 0
 dx_diff_def_i_7_11: EMIB_cx_grid_var_7_11 - cx_grid_var_7 + dx_diff_i_7_11
   = 0
 dx_diff_def_j_7_11: EMIB_cx_grid_var_7_11 - cx_grid_var_11
   + dx_diff_j_7_11 = 0
 dy_diff_def_i_7_11: EMIB_cy_grid_var_7_11 - cy_grid_var_7 + dy_diff_i_7_11
   = 0
 dy_diff_def_j_7_11: EMIB_cy_grid_var_7_11 - cy_grid_var_11
   + dy_diff_j_7_11 = 0
 dx_abs_i_7_11_abs_ge_orig: dx_abs_i_7_11 - dx_diff_i_7_11
   - 216 dx_abs_i_7_11_is_positive >= -216
 dx_abs_i_7_11_abs_le_orig: dx_abs_i_7_11 - dx_diff_i_7_11
   + 216 dx_abs_i_7_11_is_positive <= 216
 dx_abs_i_7_11_abs_ge_neg_orig: dx_abs_i_7_11 + dx_diff_i_7_11
   + 216 dx_abs_i_7_11_is_positive >= 0
 dx_abs_i_7_11_abs_le_neg_orig: dx_abs_i_7_11 + dx_diff_i_7_11
   - 216 dx_abs_i_7_11_is_positive <= 0
 dx_abs_i_7_11_force_positive: dx_diff_i_7_11
   - 216 dx_abs_i_7_11_is_positive >= -216
 dx_abs_i_7_11_force_negative: dx_diff_i_7_11
   - 216 dx_abs_i_7_11_is_positive <= 0
 dy_abs_i_7_11_abs_ge_orig: dy_abs_i_7_11 - dy_diff_i_7_11
   - 216 dy_abs_i_7_11_is_positive >= -216
 dy_abs_i_7_11_abs_le_orig: dy_abs_i_7_11 - dy_diff_i_7_11
   + 216 dy_abs_i_7_11_is_positive <= 216
 dy_abs_i_7_11_abs_ge_neg_orig: dy_abs_i_7_11 + dy_diff_i_7_11
   + 216 dy_abs_i_7_11_is_positive >= 0
 dy_abs_i_7_11_abs_le_neg_orig: dy_abs_i_7_11 + dy_diff_i_7_11
   - 216 dy_abs_i_7_11_is_positive <= 0
 dy_abs_i_7_11_force_positive: dy_diff_i_7_11
   - 216 dy_abs_i_7_11_is_positive >= -216
 dy_abs_i_7_11_force_negative: dy_diff_i_7_11
   - 216 dy_abs_i_7_11_is_positive <= 0
 dx_abs_j_7_11_abs_ge_orig: dx_abs_j_7_11 - dx_diff_j_7_11
   - 216 dx_abs_j_7_11_is_positive >= -216
 dx_abs_j_7_11_abs_le_orig: dx_abs_j_7_11 - dx_diff_j_7_11
   + 216 dx_abs_j_7_11_is_positive <= 216
 dx_abs_j_7_11_abs_ge_neg_orig: dx_abs_j_7_11 + dx_diff_j_7_11
   + 216 dx_abs_j_7_11_is_positive >= 0
 dx_abs_j_7_11_abs_le_neg_orig: dx_abs_j_7_11 + dx_diff_j_7_11
   - 216 dx_abs_j_7_11_is_positive <= 0
 dx_abs_j_7_11_force_positive: dx_diff_j_7_11
   - 216 dx_abs_j_7_11_is_positive >= -216
 dx_abs_j_7_11_force_negative: dx_diff_j_7_11
   - 216 dx_abs_j_7_11_is_positive <= 0
 dy_abs_j_7_11_abs_ge_orig: dy_abs_j_7_11 - dy_diff_j_7_11
   - 216 dy_abs_j_7_11_is_positive >= -216
 dy_abs_j_7_11_abs_le_orig: dy_abs_j_7_11 - dy_diff_j_7_11
   + 216 dy_abs_j_7_11_is_positive <= 216
 dy_abs_j_7_11_abs_ge_neg_orig: dy_abs_j_7_11 + dy_diff_j_7_11
   + 216 dy_abs_j_7_11_is_positive >= 0
 dy_abs_j_7_11_abs_le_neg_orig: dy_abs_j_7_11 + dy_diff_j_7_11
   - 216 dy_abs_j_7_11_is_positive <= 0
 dy_abs_j_7_11_force_positive: dy_diff_j_7_11
   - 216 dy_abs_j_7_11_is_positive >= -216
 dy_abs_j_7_11_force_negative: dy_diff_j_7_11
   - 216 dy_abs_j_7_11_is_positive <= 0
 dx_diff_def_i_8_12: EMIB_cx_grid_var_8_12 - cx_grid_var_8 + dx_diff_i_8_12
   = 0
 dx_diff_def_j_8_12: EMIB_cx_grid_var_8_12 - cx_grid_var_12
   + dx_diff_j_8_12 = 0
 dy_diff_def_i_8_12: EMIB_cy_grid_var_8_12 - cy_grid_var_8 + dy_diff_i_8_12
   = 0
 dy_diff_def_j_8_12: EMIB_cy_grid_var_8_12 - cy_grid_var_12
   + dy_diff_j_8_12 = 0
 dx_abs_i_8_12_abs_ge_orig: dx_abs_i_8_12 - dx_diff_i_8_12
   - 216 dx_abs_i_8_12_is_positive >= -216
 dx_abs_i_8_12_abs_le_orig: dx_abs_i_8_12 - dx_diff_i_8_12
   + 216 dx_abs_i_8_12_is_positive <= 216
 dx_abs_i_8_12_abs_ge_neg_orig: dx_abs_i_8_12 + dx_diff_i_8_12
   + 216 dx_abs_i_8_12_is_positive >= 0
 dx_abs_i_8_12_abs_le_neg_orig: dx_abs_i_8_12 + dx_diff_i_8_12
   - 216 dx_abs_i_8_12_is_positive <= 0
 dx_abs_i_8_12_force_positive: dx_diff_i_8_12
   - 216 dx_abs_i_8_12_is_positive >= -216
 dx_abs_i_8_12_force_negative: dx_diff_i_8_12
   - 216 dx_abs_i_8_12_is_positive <= 0
 dy_abs_i_8_12_abs_ge_orig: dy_abs_i_8_12 - dy_diff_i_8_12
   - 216 dy_abs_i_8_12_is_positive >= -216
 dy_abs_i_8_12_abs_le_orig: dy_abs_i_8_12 - dy_diff_i_8_12
   + 216 dy_abs_i_8_12_is_positive <= 216
 dy_abs_i_8_12_abs_ge_neg_orig: dy_abs_i_8_12 + dy_diff_i_8_12
   + 216 dy_abs_i_8_12_is_positive >= 0
 dy_abs_i_8_12_abs_le_neg_orig: dy_abs_i_8_12 + dy_diff_i_8_12
   - 216 dy_abs_i_8_12_is_positive <= 0
 dy_abs_i_8_12_force_positive: dy_diff_i_8_12
   - 216 dy_abs_i_8_12_is_positive >= -216
 dy_abs_i_8_12_force_negative: dy_diff_i_8_12
   - 216 dy_abs_i_8_12_is_positive <= 0
 dx_abs_j_8_12_abs_ge_orig: dx_abs_j_8_12 - dx_diff_j_8_12
   - 216 dx_abs_j_8_12_is_positive >= -216
 dx_abs_j_8_12_abs_le_orig: dx_abs_j_8_12 - dx_diff_j_8_12
   + 216 dx_abs_j_8_12_is_positive <= 216
 dx_abs_j_8_12_abs_ge_neg_orig: dx_abs_j_8_12 + dx_diff_j_8_12
   + 216 dx_abs_j_8_12_is_positive >= 0
 dx_abs_j_8_12_abs_le_neg_orig: dx_abs_j_8_12 + dx_diff_j_8_12
   - 216 dx_abs_j_8_12_is_positive <= 0
 dx_abs_j_8_12_force_positive: dx_diff_j_8_12
   - 216 dx_abs_j_8_12_is_positive >= -216
 dx_abs_j_8_12_force_negative: dx_diff_j_8_12
   - 216 dx_abs_j_8_12_is_positive <= 0
 dy_abs_j_8_12_abs_ge_orig: dy_abs_j_8_12 - dy_diff_j_8_12
   - 216 dy_abs_j_8_12_is_positive >= -216
 dy_abs_j_8_12_abs_le_orig: dy_abs_j_8_12 - dy_diff_j_8_12
   + 216 dy_abs_j_8_12_is_positive <= 216
 dy_abs_j_8_12_abs_ge_neg_orig: dy_abs_j_8_12 + dy_diff_j_8_12
   + 216 dy_abs_j_8_12_is_positive >= 0
 dy_abs_j_8_12_abs_le_neg_orig: dy_abs_j_8_12 + dy_diff_j_8_12
   - 216 dy_abs_j_8_12_is_positive <= 0
 dy_abs_j_8_12_force_positive: dy_diff_j_8_12
   - 216 dy_abs_j_8_12_is_positive >= -216
 dy_abs_j_8_12_force_negative: dy_diff_j_8_12
   - 216 dy_abs_j_8_12_is_positive <= 0
 dx_diff_def_i_10_12: EMIB_cx_grid_var_10_12 - cx_grid_var_10
   + dx_diff_i_10_12 = 0
 dx_diff_def_j_10_12: EMIB_cx_grid_var_10_12 - cx_grid_var_12
   + dx_diff_j_10_12 = 0
 dy_diff_def_i_10_12: EMIB_cy_grid_var_10_12 - cy_grid_var_10
   + dy_diff_i_10_12 = 0
 dy_diff_def_j_10_12: EMIB_cy_grid_var_10_12 - cy_grid_var_12
   + dy_diff_j_10_12 = 0
 dx_abs_i_10_12_abs_ge_orig: dx_abs_i_10_12 - dx_diff_i_10_12
   - 216 dx_abs_i_10_12_is_positive >= -216
 dx_abs_i_10_12_abs_le_orig: dx_abs_i_10_12 - dx_diff_i_10_12
   + 216 dx_abs_i_10_12_is_positive <= 216
 dx_abs_i_10_12_abs_ge_neg_orig: dx_abs_i_10_12 + dx_diff_i_10_12
   + 216 dx_abs_i_10_12_is_positive >= 0
 dx_abs_i_10_12_abs_le_neg_orig: dx_abs_i_10_12 + dx_diff_i_10_12
   - 216 dx_abs_i_10_12_is_positive <= 0
 dx_abs_i_10_12_force_positive: dx_diff_i_10_12
   - 216 dx_abs_i_10_12_is_positive >= -216
 dx_abs_i_10_12_force_negative: dx_diff_i_10_12
   - 216 dx_abs_i_10_12_is_positive <= 0
 dy_abs_i_10_12_abs_ge_orig: dy_abs_i_10_12 - dy_diff_i_10_12
   - 216 dy_abs_i_10_12_is_positive >= -216
 dy_abs_i_10_12_abs_le_orig: dy_abs_i_10_12 - dy_diff_i_10_12
   + 216 dy_abs_i_10_12_is_positive <= 216
 dy_abs_i_10_12_abs_ge_neg_orig: dy_abs_i_10_12 + dy_diff_i_10_12
   + 216 dy_abs_i_10_12_is_positive >= 0
 dy_abs_i_10_12_abs_le_neg_orig: dy_abs_i_10_12 + dy_diff_i_10_12
   - 216 dy_abs_i_10_12_is_positive <= 0
 dy_abs_i_10_12_force_positive: dy_diff_i_10_12
   - 216 dy_abs_i_10_12_is_positive >= -216
 dy_abs_i_10_12_force_negative: dy_diff_i_10_12
   - 216 dy_abs_i_10_12_is_positive <= 0
 dx_abs_j_10_12_abs_ge_orig: dx_abs_j_10_12 - dx_diff_j_10_12
   - 216 dx_abs_j_10_12_is_positive >= -216
 dx_abs_j_10_12_abs_le_orig: dx_abs_j_10_12 - dx_diff_j_10_12
   + 216 dx_abs_j_10_12_is_positive <= 216
 dx_abs_j_10_12_abs_ge_neg_orig: dx_abs_j_10_12 + dx_diff_j_10_12
   + 216 dx_abs_j_10_12_is_positive >= 0
 dx_abs_j_10_12_abs_le_neg_orig: dx_abs_j_10_12 + dx_diff_j_10_12
   - 216 dx_abs_j_10_12_is_positive <= 0
 dx_abs_j_10_12_force_positive: dx_diff_j_10_12
   - 216 dx_abs_j_10_12_is_positive >= -216
 dx_abs_j_10_12_force_negative: dx_diff_j_10_12
   - 216 dx_abs_j_10_12_is_positive <= 0
 dy_abs_j_10_12_abs_ge_orig: dy_abs_j_10_12 - dy_diff_j_10_12
   - 216 dy_abs_j_10_12_is_positive >= -216
 dy_abs_j_10_12_abs_le_orig: dy_abs_j_10_12 - dy_diff_j_10_12
   + 216 dy_abs_j_10_12_is_positive <= 216
 dy_abs_j_10_12_abs_ge_neg_orig: dy_abs_j_10_12 + dy_diff_j_10_12
   + 216 dy_abs_j_10_12_is_positive >= 0
 dy_abs_j_10_12_abs_le_neg_orig: dy_abs_j_10_12 + dy_diff_j_10_12
   - 216 dy_abs_j_10_12_is_positive <= 0
 dy_abs_j_10_12_force_positive: dy_diff_j_10_12
   - 216 dy_abs_j_10_12_is_positive >= -216
 dy_abs_j_10_12_force_negative: dy_diff_j_10_12
   - 216 dy_abs_j_10_12_is_positive <= 0
 wirelength_def: wirelength - 128 dx_abs_0_10 - 128 dy_abs_0_10
   - 128 dx_abs_0_13 - 128 dy_abs_0_13 - 128 dx_abs_1_3 - 128 dy_abs_1_3
   - 128 dx_abs_1_8 - 128 dy_abs_1_8 - 128 dx_abs_3_4 - 128 dy_abs_3_4
   - 128 dx_abs_3_5 - 128 dy_abs_3_5 - 128 dx_abs_4_5 - 128 dy_abs_4_5
   - 128 dx_abs_4_9 - 128 dy_abs_4_9 - 128 dx_abs_4_13 - 128 dy_abs_4_13
   - 128 dx_abs_5_6 - 128 dy_abs_5_6 - 128 dx_abs_5_12 - 128 dy_abs_5_12
   - 128 dx_abs_7_10 - 128 dy_abs_7_10 - 128 dx_abs_7_12 - 128 dy_abs_7_12
   - 128 dx_abs_8_10 - 128 dy_abs_8_10 - 128 dx_abs_9_13 - 128 dy_abs_9_13
   - 128 dx_abs_11_13 - 128 dy_abs_11_13 - 256 dx_abs_i_0_3
   - 256 dy_abs_i_0_3 - 256 dx_abs_j_0_3 - 256 dy_abs_j_0_3
   - 256 dx_abs_i_1_7 - 256 dy_abs_i_1_7 - 256 dx_abs_j_1_7
   - 256 dy_abs_j_1_7 - 256 dx_abs_i_2_11 - 256 dy_abs_i_2_11
   - 256 dx_abs_j_2_11 - 256 dy_abs_j_2_11 - 256 dx_abs_i_2_12
   - 256 dy_abs_i_2_12 - 256 dx_abs_j_2_12 - 256 dy_abs_j_2_12
   - 512 dx_abs_i_3_7 - 512 dy_abs_i_3_7 - 512 dx_abs_j_3_7
   - 512 dy_abs_j_3_7 - 512 dx_abs_i_3_10 - 512 dy_abs_i_3_10
   - 512 dx_abs_j_3_10 - 512 dy_abs_j_3_10 - 256 dx_abs_i_4_6
   - 256 dy_abs_i_4_6 - 256 dx_abs_j_4_6 - 256 dy_abs_j_4_6
   - 256 dx_abs_i_4_8 - 256 dy_abs_i_4_8 - 256 dx_abs_j_4_8
   - 256 dy_abs_j_4_8 - 256 dx_abs_i_5_13 - 256 dy_abs_i_5_13
   - 256 dx_abs_j_5_13 - 256 dy_abs_j_5_13 - 512 dx_abs_i_6_10
   - 512 dy_abs_i_6_10 - 512 dx_abs_j_6_10 - 512 dy_abs_j_6_10
   - 256 dx_abs_i_7_11 - 256 dy_abs_i_7_11 - 256 dx_abs_j_7_11
   - 256 dy_abs_j_7_11 - 512 dx_abs_i_8_12 - 512 dy_abs_i_8_12
   - 512 dx_abs_j_8_12 - 512 dy_abs_j_8_12 - 256 dx_abs_i_10_12
   - 256 dy_abs_i_10_12 - 256 dx_abs_j_10_12 - 256 dy_abs_j_10_12 = 0
 t_ge_scaled_mean: - 0.8 bbox_w - 0.8 bbox_h + bbox_area_proxy_t >= 0
Bounds
 5 <= w_var_0 <= 7
 5 <= h_var_0 <= 7
 w_var_1 = 5
 h_var_1 = 5
 5 <= w_var_2 <= 6
 5 <= h_var_2 <= 6
 7 <= w_var_3 <= 8
 7 <= h_var_3 <= 8
 w_var_4 = 5
 h_var_4 = 5
 w_var_5 = 5
 h_var_5 = 5
 6 <= w_var_6 <= 9
 6 <= h_var_6 <= 9
 w_var_7 = 8
 h_var_7 = 8
 6 <= w_var_8 <= 8
 6 <= h_var_8 <= 8
 8 <= w_var_9 <= 9
 8 <= h_var_9 <= 9
 w_var_10 = 6
 h_var_10 = 6
 8 <= w_var_11 <= 9
 8 <= h_var_11 <= 9
 5 <= w_var_12 <= 9
 5 <= h_var_12 <= 9
 w_var_13 = 7
 h_var_13 = 7
 0.8533 <= EMIB_w_var_0_3 <= 2
 0.8533 <= EMIB_h_var_0_3 <= 2
 0.8533 <= EMIB_w_var_1_7 <= 2
 0.8533 <= EMIB_h_var_1_7 <= 2
 0.8533 <= EMIB_w_var_2_11 <= 2
 0.8533 <= EMIB_h_var_2_11 <= 2
 0.8533 <= EMIB_w_var_2_12 <= 2
 0.8533 <= EMIB_h_var_2_12 <= 2
 1.7067 <= EMIB_w_var_3_7 <= 2
 1.7067 <= EMIB_h_var_3_7 <= 2
 1.7067 <= EMIB_w_var_3_10 <= 2
 1.7067 <= EMIB_h_var_3_10 <= 2
 0.8533 <= EMIB_w_var_4_6 <= 2
 0.8533 <= EMIB_h_var_4_6 <= 2
 0.8533 <= EMIB_w_var_4_8 <= 2
 0.8533 <= EMIB_h_var_4_8 <= 2
 0.8533 <= EMIB_w_var_5_13 <= 2
 0.8533 <= EMIB_h_var_5_13 <= 2
 1.7067 <= EMIB_w_var_6_10 <= 2
 1.7067 <= EMIB_h_var_6_10 <= 2
 0.8533 <= EMIB_w_var_7_11 <= 2
 0.8533 <= EMIB_h_var_7_11 <= 2
 1.7067 <= EMIB_w_var_8_12 <= 2
 1.7067 <= EMIB_h_var_8_12 <= 2
 0.8533 <= EMIB_w_var_10_12 <= 2
 0.8533 <= EMIB_h_var_10_12 <= 2
 x_grid_var_0 <= 108
 y_grid_var_0 <= 108
 x_grid_var_1 <= 108
 y_grid_var_1 <= 108
 x_grid_var_2 <= 108
 y_grid_var_2 <= 108
 x_grid_var_3 <= 108
 y_grid_var_3 <= 108
 x_grid_var_4 <= 108
 y_grid_var_4 <= 108
 x_grid_var_5 <= 108
 y_grid_var_5 <= 108
 x_grid_var_6 <= 108
 y_grid_var_6 <= 108
 x_grid_var_7 <= 108
 y_grid_var_7 <= 108
 x_grid_var_8 <= 108
 y_grid_var_8 <= 108
 x_grid_var_9 <= 108
 y_grid_var_9 <= 108
 x_grid_var_10 <= 108
 y_grid_var_10 <= 108
 x_grid_var_11 <= 108
 y_grid_var_11 <= 108
 x_grid_var_12 <= 108
 y_grid_var_12 <= 108
 x_grid_var_13 <= 108
 y_grid_var_13 <= 108
 EMIB_x_grid_var_0_3 <= 108
 EMIB_y_grid_var_0_3 <= 108
 EMIB_x_grid_var_1_7 <= 108
 EMIB_y_grid_var_1_7 <= 108
 EMIB_x_grid_var_2_11 <= 108
 EMIB_y_grid_var_2_11 <= 108
 EMIB_x_grid_var_2_12 <= 108
 EMIB_y_grid_var_2_12 <= 108
 EMIB_x_grid_var_3_7 <= 108
 EMIB_y_grid_var_3_7 <= 108
 EMIB_x_grid_var_3_10 <= 108
 EMIB_y_grid_var_3_10 <= 108
 EMIB_x_grid_var_4_6 <= 108
 EMIB_y_grid_var_4_6 <= 108
 EMIB_x_grid_var_4_8 <= 108
 EMIB_y_grid_var_4_8 <= 108
 EMIB_x_grid_var_5_13 <= 108
 EMIB_y_grid_var_5_13 <= 108
 EMIB_x_grid_var_6_10 <= 108
 EMIB_y_grid_var_6_10 <= 108
 EMIB_x_grid_var_7_11 <= 108
 EMIB_y_grid_var_7_11 <= 108
 EMIB_x_grid_var_8_12 <= 108
 EMIB_y_grid_var_8_12 <= 108
 EMIB_x_grid_var_10_12 <= 108
 EMIB_y_grid_var_10_12 <= 108
 EMIB_cx_grid_var_0_3 <= 216
 EMIB_cy_grid_var_0_3 <= 216
 EMIB_cx_grid_var_1_7 <= 216
 EMIB_cy_grid_var_1_7 <= 216
 EMIB_cx_grid_var_2_11 <= 216
 EMIB_cy_grid_var_2_11 <= 216
 EMIB_cx_grid_var_2_12 <= 216
 EMIB_cy_grid_var_2_12 <= 216
 EMIB_cx_grid_var_3_7 <= 216
 EMIB_cy_grid_var_3_7 <= 216
 EMIB_cx_grid_var_3_10 <= 216
 EMIB_cy_grid_var_3_10 <= 216
 EMIB_cx_grid_var_4_6 <= 216
 EMIB_cy_grid_var_4_6 <= 216
 EMIB_cx_grid_var_4_8 <= 216
 EMIB_cy_grid_var_4_8 <= 216
 EMIB_cx_grid_var_5_13 <= 216
 EMIB_cy_grid_var_5_13 <= 216
 EMIB_cx_grid_var_6_10 <= 216
 EMIB_cy_grid_var_6_10 <= 216
 EMIB_cx_grid_var_7_11 <= 216
 EMIB_cy_grid_var_7_11 <= 216
 EMIB_cx_grid_var_8_12 <= 216
 EMIB_cy_grid_var_8_12 <= 216
 EMIB_cx_grid_var_10_12 <= 216
 EMIB_cy_grid_var_10_12 <= 216
 cx_grid_var_0 <= 216
 cy_grid_var_0 <= 216
 cx_grid_var_1 <= 216
 cy_grid_var_1 <= 216
 cx_grid_var_2 <= 216
 cy_grid_var_2 <= 216
 cx_grid_var_3 <= 216
 cy_grid_var_3 <= 216
 cx_grid_var_4 <= 216
 cy_grid_var_4 <= 216
 cx_grid_var_5 <= 216
 cy_grid_var_5 <= 216
 cx_grid_var_6 <= 216
 cy_grid_var_6 <= 216
 cx_grid_var_7 <= 216
 cy_grid_var_7 <= 216
 cx_grid_var_8 <= 216
 cy_grid_var_8 <= 216
 cx_grid_var_9 <= 216
 cy_grid_var_9 <= 216
 cx_grid_var_10 <= 216
 cy_grid_var_10 <= 216
 cx_grid_var_11 <= 216
 cy_grid_var_11 <= 216
 cx_grid_var_12 <= 216
 cy_grid_var_12 <= 216
 cx_grid_var_13 <= 216
 cy_grid_var_13 <= 216
 cx_center <= 108
 cy_center <= 108
 bbox_min_x <= 108
 bbox_max_x <= 108
 bbox_min_y <= 108
 bbox_max_y <= 108
 bbox_w <= 108
 bbox_h <= 108
 aspect_ratio_penalty <= 108
 dx_grid_abs_pair_1_2 <= 108
 dy_grid_abs_pair_1_2 <= 108
 -108 <= dx_grid_diff_1_2 <= 108
 -108 <= dy_grid_diff_1_2 <= 108
 dist_curr_pair_1_2 <= 216
 dx_grid_abs_pair_1_4 <= 108
 dy_grid_abs_pair_1_4 <= 108
 -108 <= dx_grid_diff_1_4 <= 108
 -108 <= dy_grid_diff_1_4 <= 108
 dist_curr_pair_1_4 <= 216
 dx_grid_abs_pair_1_10 <= 108
 dy_grid_abs_pair_1_10 <= 108
 -108 <= dx_grid_diff_1_10 <= 108
 -108 <= dy_grid_diff_1_10 <= 108
 dist_curr_pair_1_10 <= 216
 dx_grid_abs_pair_2_4 <= 108
 dy_grid_abs_pair_2_4 <= 108
 -108 <= dx_grid_diff_2_4 <= 108
 -108 <= dy_grid_diff_2_4 <= 108
 dist_curr_pair_2_4 <= 216
 dx_grid_abs_pair_2_10 <= 108
 dy_grid_abs_pair_2_10 <= 108
 -108 <= dx_grid_diff_2_10 <= 108
 -108 <= dy_grid_diff_2_10 <= 108
 dist_curr_pair_2_10 <= 216
 dx_grid_abs_pair_4_10 <= 108
 dy_grid_abs_pair_4_10 <= 108
 -108 <= dx_grid_diff_4_10 <= 108
 -108 <= dy_grid_diff_4_10 <= 108
 dist_curr_pair_4_10 <= 216
 -108 <= dx_center_diff_1 <= 108
 dx_center_abs_1 <= 108
 -108 <= dy_center_diff_1 <= 108
 dy_center_abs_1 <= 108
 dist_center_1 <= 216
 -108 <= dx_center_diff_2 <= 108
 dx_center_abs_2 <= 108
 -108 <= dy_center_diff_2 <= 108
 dy_center_abs_2 <= 108
 dist_center_2 <= 216
 -108 <= dx_center_diff_4 <= 108
 dx_center_abs_4 <= 108
 -108 <= dy_center_diff_4 <= 108
 dy_center_abs_4 <= 108
 dist_center_4 <= 216
 -108 <= dx_center_diff_10 <= 108
 dx_center_abs_10 <= 108
 -108 <= dy_center_diff_10 <= 108
 dy_center_abs_10 <= 108
 dist_center_10 <= 216
 wirelength <= 2.5657344e+07
 -108 <= dx_diff_0_10 <= 108
 -108 <= dy_diff_0_10 <= 108
 -108 <= dx_diff_0_13 <= 108
 -108 <= dy_diff_0_13 <= 108
 -108 <= dx_diff_1_3 <= 108
 -108 <= dy_diff_1_3 <= 108
 -108 <= dx_diff_1_8 <= 108
 -108 <= dy_diff_1_8 <= 108
 -108 <= dx_diff_3_4 <= 108
 -108 <= dy_diff_3_4 <= 108
 -108 <= dx_diff_3_5 <= 108
 -108 <= dy_diff_3_5 <= 108
 -108 <= dx_diff_4_5 <= 108
 -108 <= dy_diff_4_5 <= 108
 -108 <= dx_diff_4_9 <= 108
 -108 <= dy_diff_4_9 <= 108
 -108 <= dx_diff_4_13 <= 108
 -108 <= dy_diff_4_13 <= 108
 -108 <= dx_diff_5_6 <= 108
 -108 <= dy_diff_5_6 <= 108
 -108 <= dx_diff_5_12 <= 108
 -108 <= dy_diff_5_12 <= 108
 -108 <= dx_diff_7_10 <= 108
 -108 <= dy_diff_7_10 <= 108
 -108 <= dx_diff_7_12 <= 108
 -108 <= dy_diff_7_12 <= 108
 -108 <= dx_diff_8_10 <= 108
 -108 <= dy_diff_8_10 <= 108
 -108 <= dx_diff_9_13 <= 108
 -108 <= dy_diff_9_13 <= 108
 -108 <= dx_diff_11_13 <= 108
 -108 <= dy_diff_11_13 <= 108
 -108 <= dx_diff_i_0_3 <= 108
 -108 <= dy_diff_i_0_3 <= 108
 -108 <= dx_diff_j_0_3 <= 108
 -108 <= dy_diff_j_0_3 <= 108
 -108 <= dx_diff_i_1_7 <= 108
 -108 <= dy_diff_i_1_7 <= 108
 -108 <= dx_diff_j_1_7 <= 108
 -108 <= dy_diff_j_1_7 <= 108
 -108 <= dx_diff_i_2_11 <= 108
 -108 <= dy_diff_i_2_11 <= 108
 -108 <= dx_diff_j_2_11 <= 108
 -108 <= dy_diff_j_2_11 <= 108
 -108 <= dx_diff_i_2_12 <= 108
 -108 <= dy_diff_i_2_12 <= 108
 -108 <= dx_diff_j_2_12 <= 108
 -108 <= dy_diff_j_2_12 <= 108
 -108 <= dx_diff_i_3_7 <= 108
 -108 <= dy_diff_i_3_7 <= 108
 -108 <= dx_diff_j_3_7 <= 108
 -108 <= dy_diff_j_3_7 <= 108
 -108 <= dx_diff_i_3_10 <= 108
 -108 <= dy_diff_i_3_10 <= 108
 -108 <= dx_diff_j_3_10 <= 108
 -108 <= dy_diff_j_3_10 <= 108
 -108 <= dx_diff_i_4_6 <= 108
 -108 <= dy_diff_i_4_6 <= 108
 -108 <= dx_diff_j_4_6 <= 108
 -108 <= dy_diff_j_4_6 <= 108
 -108 <= dx_diff_i_4_8 <= 108
 -108 <= dy_diff_i_4_8 <= 108
 -108 <= dx_diff_j_4_8 <= 108
 -108 <= dy_diff_j_4_8 <= 108
 -108 <= dx_diff_i_5_13 <= 108
 -108 <= dy_diff_i_5_13 <= 108
 -108 <= dx_diff_j_5_13 <= 108
 -108 <= dy_diff_j_5_13 <= 108
 -108 <= dx_diff_i_6_10 <= 108
 -108 <= dy_diff_i_6_10 <= 108
 -108 <= dx_diff_j_6_10 <= 108
 -108 <= dy_diff_j_6_10 <= 108
 -108 <= dx_diff_i_7_11 <= 108
 -108 <= dy_diff_i_7_11 <= 108
 -108 <= dx_diff_j_7_11 <= 108
 -108 <= dy_diff_j_7_11 <= 108
 -108 <= dx_diff_i_8_12 <= 108
 -108 <= dy_diff_i_8_12 <= 108
 -108 <= dx_diff_j_8_12 <= 108
 -108 <= dy_diff_j_8_12 <= 108
 -108 <= dx_diff_i_10_12 <= 108
 -108 <= dy_diff_i_10_12 <= 108
 -108 <= dx_diff_j_10_12 <= 108
 -108 <= dy_diff_j_10_12 <= 108
 bbox_area_proxy_t <= 216
Binaries
 r_0 r_1 r_2 r_3 r_4 r_5 r_6 r_7 r_8 r_9 r_10 r_11 r_12 r_13 r_EMIB_0_3
 r_EMIB_1_7 r_EMIB_2_11 r_EMIB_2_12 r_EMIB_3_7 r_EMIB_3_10 r_EMIB_4_6
 r_EMIB_4_8 r_EMIB_5_13 r_EMIB_6_10 r_EMIB_7_11 r_EMIB_8_12 r_EMIB_10_12
 z1_0_3 z2_0_3 z1L_0_3 z1R_0_3 z2D_0_3 z2U_0_3 z1_1_7 z2_1_7 z1L_1_7
 z1R_1_7 z2D_1_7 z2U_1_7 z1_2_11 z2_2_11 z1L_2_11 z1R_2_11 z2D_2_11
 z2U_2_11 z1_2_12 z2_2_12 z1L_2_12 z1R_2_12 z2D_2_12 z2U_2_12 z1_3_7 z2_3_7
 z1L_3_7 z1R_3_7 z2D_3_7 z2U_3_7 z1_3_10 z2_3_10 z1L_3_10 z1R_3_10 z2D_3_10
 z2U_3_10 z1_4_6 z2_4_6 z1L_4_6 z1R_4_6 z2D_4_6 z2U_4_6 z1_4_8 z2_4_8
 z1L_4_8 z1R_4_8 z2D_4_8 z2U_4_8 z1_5_13 z2_5_13 z1L_5_13 z1R_5_13 z2D_5_13
 z2U_5_13 z1_6_10 z2_6_10 z1L_6_10 z1R_6_10 z2D_6_10 z2U_6_10 z1_7_11
 z2_7_11 z1L_7_11 z1R_7_11 z2D_7_11 z2U_7_11 z1_8_12 z2_8_12 z1L_8_12
 z1R_8_12 z2D_8_12 z2U_8_12 z1_10_12 z2_10_12 z1L_10_12 z1R_10_12 z2D_10_12
 z2U_10_12 p_left_0_1 p_right_0_1 p_down_0_1 p_up_0_1 p_left_0_2
 p_right_0_2 p_down_0_2 p_up_0_2 p_left_0_3 p_right_0_3 p_down_0_3 p_up_0_3
 p_left_0_4 p_right_0_4 p_down_0_4 p_up_0_4 p_left_0_5 p_right_0_5
 p_down_0_5 p_up_0_5 p_left_0_6 p_right_0_6 p_down_0_6 p_up_0_6 p_left_0_7
 p_right_0_7 p_down_0_7 p_up_0_7 p_left_0_8 p_right_0_8 p_down_0_8 p_up_0_8
 p_left_0_9 p_right_0_9 p_down_0_9 p_up_0_9 p_left_0_10 p_right_0_10
 p_down_0_10 p_up_0_10 p_left_0_11 p_right_0_11 p_down_0_11 p_up_0_11
 p_left_0_12 p_right_0_12 p_down_0_12 p_up_0_12 p_left_0_13 p_right_0_13
 p_down_0_13 p_up_0_13 p_left_1_2 p_right_1_2 p_down_1_2 p_up_1_2
 p_left_1_3 p_right_1_3 p_down_1_3 p_up_1_3 p_left_1_4 p_right_1_4
 p_down_1_4 p_up_1_4 p_left_1_5 p_right_1_5 p_down_1_5 p_up_1_5 p_left_1_6
 p_right_1_6 p_down_1_6 p_up_1_6 p_left_1_7 p_right_1_7 p_down_1_7 p_up_1_7
 p_left_1_8 p_right_1_8 p_down_1_8 p_up_1_8 p_left_1_9 p_right_1_9
 p_down_1_9 p_up_1_9 p_left_1_10 p_right_1_10 p_down_1_10 p_up_1_10
 p_left_1_11 p_right_1_11 p_down_1_11 p_up_1_11 p_left_1_12 p_right_1_12
 p_down_1_12 p_up_1_12 p_left_1_13 p_right_1_13 p_down_1_13 p_up_1_13
 p_left_2_3 p_right_2_3 p_down_2_3 p_up_2_3 p_left_2_4 p_right_2_4
 p_down_2_4 p_up_2_4 p_left_2_5 p_right_2_5 p_down_2_5 p_up_2_5 p_left_2_6
 p_right_2_6 p_down_2_6 p_up_2_6 p_left_2_7 p_right_2_7 p_down_2_7 p_up_2_7
 p_left_2_8 p_right_2_8 p_down_2_8 p_up_2_8 p_left_2_9 p_right_2_9
 p_down_2_9 p_up_2_9 p_left_2_10 p_right_2_10 p_down_2_10 p_up_2_10
 p_left_2_11 p_right_2_11 p_down_2_11 p_up_2_11 p_left_2_12 p_right_2_12
 p_down_2_12 p_up_2_12 p_left_2_13 p_right_2_13 p_down_2_13 p_up_2_13
 p_left_3_4 p_right_3_4 p_down_3_4 p_up_3_4 p_left_3_5 p_right_3_5
 p_down_3_5 p_up_3_5 p_left_3_6 p_right_3_6 p_down_3_6 p_up_3_6 p_left_3_7
 p_right_3_7 p_down_3_7 p_up_3_7 p_left_3_8 p_right_3_8 p_down_3_8 p_up_3_8
 p_left_3_9 p_right_3_9 p_down_3_9 p_up_3_9 p_left_3_10 p_right_3_10
 p_down_3_10 p_up_3_10 p_left_3_11 p_right_3_11 p_down_3_11 p_up_3_11
 p_left_3_12 p_right_3_12 p_down_3_12 p_up_3_12 p_left_3_13 p_right_3_13
 p_down_3_13 p_up_3_13 p_left_4_5 p_right_4_5 p_down_4_5 p_up_4_5
 p_left_4_6 p_right_4_6 p_down_4_6 p_up_4_6 p_left_4_7 p_right_4_7
 p_down_4_7 p_up_4_7 p_left_4_8 p_right_4_8 p_down_4_8 p_up_4_8 p_left_4_9
 p_right_4_9 p_down_4_9 p_up_4_9 p_left_4_10 p_right_4_10 p_down_4_10
 p_up_4_10 p_left_4_11 p_right_4_11 p_down_4_11 p_up_4_11 p_left_4_12
 p_right_4_12 p_down_4_12 p_up_4_12 p_left_4_13 p_right_4_13 p_down_4_13
 p_up_4_13 p_left_5_6 p_right_5_6 p_down_5_6 p_up_5_6 p_left_5_7
 p_right_5_7 p_down_5_7 p_up_5_7 p_left_5_8 p_right_5_8 p_down_5_8 p_up_5_8
 p_left_5_9 p_right_5_9 p_down_5_9 p_up_5_9 p_left_5_10 p_right_5_10
 p_down_5_10 p_up_5_10 p_left_5_11 p_right_5_11 p_down_5_11 p_up_5_11
 p_left_5_12 p_right_5_12 p_down_5_12 p_up_5_12 p_left_5_13 p_right_5_13
 p_down_5_13 p_up_5_13 p_left_6_7 p_right_6_7 p_down_6_7 p_up_6_7
 p_left_6_8 p_right_6_8 p_down_6_8 p_up_6_8 p_left_6_9 p_right_6_9
 p_down_6_9 p_up_6_9 p_left_6_10 p_right_6_10 p_down_6_10 p_up_6_10
 p_left_6_11 p_right_6_11 p_down_6_11 p_up_6_11 p_left_6_12 p_right_6_12
 p_down_6_12 p_up_6_12 p_left_6_13 p_right_6_13 p_down_6_13 p_up_6_13
 p_left_7_8 p_right_7_8 p_down_7_8 p_up_7_8 p_left_7_9 p_right_7_9
 p_down_7_9 p_up_7_9 p_left_7_10 p_right_7_10 p_down_7_10 p_up_7_10
 p_left_7_11 p_right_7_11 p_down_7_11 p_up_7_11 p_left_7_12 p_right_7_12
 p_down_7_12 p_up_7_12 p_left_7_13 p_right_7_13 p_down_7_13 p_up_7_13
 p_left_8_9 p_right_8_9 p_down_8_9 p_up_8_9 p_left_8_10 p_right_8_10
 p_down_8_10 p_up_8_10 p_left_8_11 p_right_8_11 p_down_8_11 p_up_8_11
 p_left_8_12 p_right_8_12 p_down_8_12 p_up_8_12 p_left_8_13 p_right_8_13
 p_down_8_13 p_up_8_13 p_left_9_10 p_right_9_10 p_down_9_10 p_up_9_10
 p_left_9_11 p_right_9_11 p_down_9_11 p_up_9_11 p_left_9_12 p_right_9_12
 p_down_9_12 p_up_9_12 p_left_9_13 p_right_9_13 p_down_9_13 p_up_9_13
 p_left_10_11 p_right_10_11 p_down_10_11 p_up_10_11 p_left_10_12
 p_right_10_12 p_down_10_12 p_up_10_12 p_left_10_13 p_right_10_13
 p_down_10_13 p_up_10_13 p_left_11_12 p_right_11_12 p_down_11_12 p_up_11_12
 p_left_11_13 p_right_11_13 p_down_11_13 p_up_11_13 p_left_12_13
 p_right_12_13 p_down_12_13 p_up_12_13 p_EMIB_left_0_3_3_7
 p_EMIB_right_0_3_3_7 p_EMIB_down_0_3_3_7 p_EMIB_up_0_3_3_7
 p_EMIB_left_0_3_3_10 p_EMIB_right_0_3_3_10 p_EMIB_down_0_3_3_10
 p_EMIB_up_0_3_3_10 p_EMIB_left_1_7_3_7 p_EMIB_right_1_7_3_7
 p_EMIB_down_1_7_3_7 p_EMIB_up_1_7_3_7 p_EMIB_left_1_7_7_11
 p_EMIB_right_1_7_7_11 p_EMIB_down_1_7_7_11 p_EMIB_up_1_7_7_11
 p_EMIB_left_2_11_2_12 p_EMIB_right_2_11_2_12 p_EMIB_down_2_11_2_12
 p_EMIB_up_2_11_2_12 p_EMIB_left_2_11_7_11 p_EMIB_right_2_11_7_11
 p_EMIB_down_2_11_7_11 p_EMIB_up_2_11_7_11 p_EMIB_left_2_12_8_12
 p_EMIB_right_2_12_8_12 p_EMIB_down_2_12_8_12 p_EMIB_up_2_12_8_12
 p_EMIB_left_2_12_10_12 p_EMIB_right_2_12_10_12 p_EMIB_down_2_12_10_12
 p_EMIB_up_2_12_10_12 p_EMIB_left_3_7_3_10 p_EMIB_right_3_7_3_10
 p_EMIB_down_3_7_3_10 p_EMIB_up_3_7_3_10 p_EMIB_left_3_7_7_11
 p_EMIB_right_3_7_7_11 p_EMIB_down_3_7_7_11 p_EMIB_up_3_7_7_11
 p_EMIB_left_3_10_6_10 p_EMIB_right_3_10_6_10 p_EMIB_down_3_10_6_10
 p_EMIB_up_3_10_6_10 p_EMIB_left_3_10_10_12 p_EMIB_right_3_10_10_12
 p_EMIB_down_3_10_10_12 p_EMIB_up_3_10_10_12 p_EMIB_left_4_6_4_8
 p_EMIB_right_4_6_4_8 p_EMIB_down_4_6_4_8 p_EMIB_up_4_6_4_8
 p_EMIB_left_4_6_6_10 p_EMIB_right_4_6_6_10 p_EMIB_down_4_6_6_10
 p_EMIB_up_4_6_6_10 p_EMIB_left_4_8_8_12 p_EMIB_right_4_8_8_12
 p_EMIB_down_4_8_8_12 p_EMIB_up_4_8_8_12 p_EMIB_left_6_10_10_12
 p_EMIB_right_6_10_10_12 p_EMIB_down_6_10_10_12 p_EMIB_up_6_10_10_12
 p_EMIB_left_8_12_10_12 p_EMIB_right_8_12_10_12 p_EMIB_down_8_12_10_12
 p_EMIB_up_8_12_10_12 dx_grid_abs_pair_1_2_is_positive
 dy_grid_abs_pair_1_2_is_positive dx_grid_abs_pair_1_4_is_positive
 dy_grid_abs_pair_1_4_is_positive dx_grid_abs_pair_1_10_is_positive
 dy_grid_abs_pair_1_10_is_positive dx_grid_abs_pair_2_4_is_positive
 dy_grid_abs_pair_2_4_is_positive dx_grid_abs_pair_2_10_is_positive
 dy_grid_abs_pair_2_10_is_positive dx_grid_abs_pair_4_10_is_positive
 dy_grid_abs_pair_4_10_is_positive dx_center_abs_1_is_positive
 dy_center_abs_1_is_positive dx_center_abs_2_is_positive
 dy_center_abs_2_is_positive dx_center_abs_4_is_positive
 dy_center_abs_4_is_positive dx_center_abs_10_is_positive
 dy_center_abs_10_is_positive dx_abs_0_10_is_positive
 dy_abs_0_10_is_positive dx_abs_0_13_is_positive dy_abs_0_13_is_positive
 dx_abs_1_3_is_positive dy_abs_1_3_is_positive dx_abs_1_8_is_positive
 dy_abs_1_8_is_positive dx_abs_3_4_is_positive dy_abs_3_4_is_positive
 dx_abs_3_5_is_positive dy_abs_3_5_is_positive dx_abs_4_5_is_positive
 dy_abs_4_5_is_positive dx_abs_4_9_is_positive dy_abs_4_9_is_positive
 dx_abs_4_13_is_positive dy_abs_4_13_is_positive dx_abs_5_6_is_positive
 dy_abs_5_6_is_positive dx_abs_5_12_is_positive dy_abs_5_12_is_positive
 dx_abs_7_10_is_positive dy_abs_7_10_is_positive dx_abs_7_12_is_positive
 dy_abs_7_12_is_positive dx_abs_8_10_is_positive dy_abs_8_10_is_positive
 dx_abs_9_13_is_positive dy_abs_9_13_is_positive dx_abs_11_13_is_positive
 dy_abs_11_13_is_positive dx_abs_i_0_3_is_positive dy_abs_i_0_3_is_positive
 dx_abs_j_0_3_is_positive dy_abs_j_0_3_is_positive dx_abs_i_1_7_is_positive
 dy_abs_i_1_7_is_positive dx_abs_j_1_7_is_positive dy_abs_j_1_7_is_positive
 dx_abs_i_2_11_is_positive dy_abs_i_2_11_is_positive
 dx_abs_j_2_11_is_positive dy_abs_j_2_11_is_positive
 dx_abs_i_2_12_is_positive dy_abs_i_2_12_is_positive
 dx_abs_j_2_12_is_positive dy_abs_j_2_12_is_positive
 dx_abs_i_3_7_is_positive dy_abs_i_3_7_is_positive dx_abs_j_3_7_is_positive
 dy_abs_j_3_7_is_positive dx_abs_i_3_10_is_positive
 dy_abs_i_3_10_is_positive dx_abs_j_3_10_is_positive
 dy_abs_j_3_10_is_positive dx_abs_i_4_6_is_positive
 dy_abs_i_4_6_is_positive dx_abs_j_4_6_is_positive dy_abs_j_4_6_is_positive
 dx_abs_i_4_8_is_positive dy_abs_i_4_8_is_positive dx_abs_j_4_8_is_positive
 dy_abs_j_4_8_is_positive dx_abs_i_5_13_is_positive
 dy_abs_i_5_13_is_positive dx_abs_j_5_13_is_positive
 dy_abs_j_5_13_is_positive dx_abs_i_6_10_is_positive
 dy_abs_i_6_10_is_positive dx_abs_j_6_10_is_positive
 dy_abs_j_6_10_is_positive dx_abs_i_7_11_is_positive
 dy_abs_i_7_11_is_positive dx_abs_j_7_11_is_positive
 dy_abs_j_7_11_is_positive dx_abs_i_8_12_is_positive
 dy_abs_i_8_12_is_positive dx_abs_j_8_12_is_positive
 dy_abs_j_8_12_is_positive dx_abs_i_10_12_is_positive
 dy_abs_i_10_12_is_positive dx_abs_j_10_12_is_positive
 dy_abs_j_10_12_is_positive
End
