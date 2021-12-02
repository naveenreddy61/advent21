require(data.table)
input = fread('../../../data/day_2/input_2.txt')
setnames(input, c('V1', 'V2'), c('dir', 'l'))

input_grouped_by_dir = input[, .(s = sum(l)), by = dir]

answer_2_1 = input_grouped_by_dir[dir == 'forward', s] * (input_grouped_by_dir[dir =='down', s] - input_grouped_by_dir[dir == 'up', s])

input = input[, aim := rep(0L, .N)]
input = input[dir == 'down', aim := l]
input = input[dir == 'up', aim := l*-1]
input = input[, cum_aim := cumsum(aim)]

forward_coordinate = input[dir == 'forward', sum(l)]
depth_coordinate = input[dir == 'forward', sum(l * cum_aim)]
answer_2_2 = forward_coordinate * depth_coordinate
answer_2_2
