clear; clc;
path = 'D:\fMRI\fMRI_EfectSizeCount\SN_17\';
folder_cont=dir(path);
[N, ~] = size(folder_cont);
folder_cont = folder_cont(3:N);
[mask, mask_path] = uigetfile( {'*.img'} , 'chose mask','/D:\fMRI\fMRI_EfectSizeCount');
mask = fullfile(mask_path, mask);
mask_str= spm_vol(mask);
mask_vol= spm_read_vols(mask_str);
vox_card = sum(sum(sum(mask_vol)));

for i =1: size(folder_cont, 1)
    folder_cont(i, 1).name= strcat(path, folder_cont(i, 1).name);
    [pathstr, name, ext] = fileparts(folder_cont(i, 1).name);
%     disp(folder_cont(i, 1).name)
    if strcmp( ext,'.nii')
        mask_str= spm_vol(folder_cont(i, 1).name);
        subj_vol= spm_read_vols(mask_str);
        mean_subj(i, 1)= sum(sum(sum(subj_vol)))/vox_card;
    end
end
