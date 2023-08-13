clear; clc;
path = 'D:\fMRI\fMRI_EfectSizeCount\SN_17\';
folder_cont=dir(path);
[N, ~] = size(folder_cont);
folder_cont = folder_cont(3:N);
[mask, mask_path] = uigetfile( {'*.img'} , 'chose mask','/C:\Research\fMRI_EfectSizeCount ');
mask = fullfile(mask_path, mask);
for i =1: size(folder_cont, 1)
    [pathstr, name, ext] = fileparts(folder_cont(i, 1).name);
    out_masked= strcat(name, '_masked1');
    if strcmp( ext,'.nii')

        subj_vol= strcat(path, folder_cont(i, 1).name);

        disp(subj_vol)
        matlabbatch{1}.spm.util.imcalc.input = {
                                                mask
                                                subj_vol
                                                };
        matlabbatch{1}.spm.util.imcalc.output = out_masked;
        matlabbatch{1}.spm.util.imcalc.outdir = {path};
        matlabbatch{1}.spm.util.imcalc.expression = 'i1.*i2';
        matlabbatch{1}.spm.util.imcalc.var = struct('name', {}, 'value', {});
        matlabbatch{1}.spm.util.imcalc.options.dmtx = 0;
        matlabbatch{1}.spm.util.imcalc.options.mask = 0;
        matlabbatch{1}.spm.util.imcalc.options.interp = 1;
        matlabbatch{1}.spm.util.imcalc.options.dtype = 4;
        spm_jobman('serial', matlabbatch);
    end
end
