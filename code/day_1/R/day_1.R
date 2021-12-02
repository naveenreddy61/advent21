require(data.table)
input = fread('../../../data/day_1/input_1.txt')
setnames(input, 'V1', 'depth')
diff_input = input[, .(difference = diff(depth))]
answer_1_1 = diff_input[difference > 0, .N]

roll_input = input[, .(roll_0 = depth[1:(.N - 2)], roll_1 = depth[2:(.N - 1)], 
                       roll_2 = depth[3:.N])]
roll_sum = roll_input[, .(s = roll_0 + roll_1 + roll_2)]
roll_sum_diff_answer = roll_sum[, .(difference = diff(s))][difference >0, .N]
