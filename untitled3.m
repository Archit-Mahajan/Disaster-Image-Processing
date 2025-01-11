input_folder = '/Users/architmahajan/Documents/MATLAB/Blurr & images1';
output_folder = '/Users/architmahajan/Documents/MATLAB/Processed Images-1';
if ~exist(output_folder, 'dir')
    mkdir(output_folder); 
end

image_files = dir(fullfile(input_folder, '*.jpg')); 

for k = 1:length(image_files)
   
    img = imread(fullfile(input_folder, image_files(k).name));
    
    img_gray = rgb2gray(img);
    figure, imshow(img_gray);
    title('Step 1: Convert to Grayscale');
    step1_path = fullfile(output_folder, ['Step1_Gray_', image_files(k).name]);
    saveas(gcf, step1_path);% get current figure

    img_denoised = imgaussfilt(img_gray, 2); 
    figure, imshow(img_denoised);
    title('Step 2: Noise Reduction');
    step2_path = fullfile(output_folder, ['Step2_Denoised_', image_files(k).name]);
    saveas(gcf, step2_path);

    edges = edge(img_denoised, 'Canny'); 
    figure, imshow(edges);
    title('Step 3: Edge Detection');
    step3_path = fullfile(output_folder, ['Step3_Edges_', image_files(k).name]);
    saveas(gcf, step3_path);

    img_contrast = imadjust(img_denoised); 
    figure, imshow(img_contrast);
    title('Step 4: Contrast Adjustment');
    step4_path = fullfile(output_folder, ['Step4_Contrast_', image_files(k).name]);
    saveas(gcf, step4_path);

    avg_red = mean(mean(img(:,:,1))); 
    avg_blue = mean(mean(img(:,:,3))); 
    
    if avg_red > 100 && avg_red > avg_blue
        disaster_type = 'Fire';
    elseif avg_blue > 100 && avg_blue > avg_red
        disaster_type = 'Flood';
    else
        disaster_type = 'Unknown';
    end
    
    figure, imshow(img_contrast);
    hold on;
    visboundaries(edges, 'Color', 'r'); 
    title(['Step 6: Final Image with Edge Overlay - Disaster Type: ', disaster_type]);
    step6_path = fullfile(output_folder, ['Step6_Final_', image_files(k).name]);
    saveas(gcf, step6_path);
    
    fprintf('Image: %s - Classified as: %s\n', image_files(k).name, disaster_type);

    close all;
end

disp('Processing complete. Stepwise images saved to the output folder.');