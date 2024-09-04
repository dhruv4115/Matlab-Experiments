function y = overlap_add_matrix(x,h,N)

% Initialize input sequence, impulse response, and block length
x = [1,2,3,4,5];
h = [1,-1,1];
N = 3;              % block length (size of the sub-sequence of x to process)

% Lengths of input and impulse response
L = length(h);
M = length(x);

% Number of blocks
num_blocks = ceil(M/N);

% Initialize the output sequence y
y = zeros(1,M+L-1);

% Create the Toeplitz matrix for the impulse response
h_matrix = toeplitz([h,zeros(1,N-1)],[h(1),zeros(1,N-1)]);

% Display the Toeplitz matrix
disp('Toeplitz matrix for the impulse response:');
disp(h_matrix);

% Perform Overlap-Add
for i = 1:num_blocks
    % Get the current block of the input sequence x
    start_idx = (i-1)*N + 1;
    end_idx = min(i*N,M);
    x_block = x(start_idx:end_idx);

    % Zero-pad the block to length N
    x_block_padded = [x_block,zeros(1,N - length(x_block))];

    % Display the current block and its padded version
    fprintf('Block %d of the input sequence:\n',i);
    disp(x_block_padded);

    % Perform convolution using the Toeplitz matrix
    conv_result = h_matrix * x_block_padded.';

    % Display the convolution result for the current block
    fprintf('Convolution result for block %d:\n',i);
    disp(conv_result.');

    % Calculate the end index for the output sequence
    end_idx_y = min(start_idx + L + N - 2, length(y));
    
    % Add the result to the output sequence y
    y(start_idx:end_idx_y) = y(start_idx:end_idx_y) + conv_result(1:(end_idx_y - start_idx + 1)).';
end

% Display the final output sequence
disp('Final output sequence after Overlap-Add method:');
disp(y);
end