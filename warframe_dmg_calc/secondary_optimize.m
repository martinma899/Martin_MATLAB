clear

mod_name_arr = {'Hornet Strike';
  'Barrel Diffusion';
  'Lethal Torrent';
  'Primed Pistol Gambit';
  'Primed Target Cracker';
  'Magnum Force';
  'Elemental #1';
  'Elemental #2';
  'Elemental #3';
  'Elemental #4';
  'Gunslinger';
  'Quickdraw';
  'Slip Magazine'};

disp([num2cell([1:numel(mod_name_arr)]') mod_name_arr])

mod_total = 13;
mod_collection = [];
blank_mod = struct('name','blank_mod','DM',0,'MM',0,'CCM',0,'CMM',0,'FR',0,'RLSM',0,'mM',0);
for i = 1:mod_total
  mod_collection = [mod_collection blank_mod];
end

mod_collection(1).name = 'Hornet Strike';
mod_collection(1).DM = 2.2;
mod_collection(2).name = 'Barrel Diffusion';
mod_collection(3).name = 'Lethal Torrent';
mod_collection(4).name = 'Primed Pistol Gambit';
mod_collection(5).name = 'Primed Target Cracker';
mod_collection(6).name = 'Magnum Force';
mod_collection(7).name = 'Elemental #1';
mod_collection(8).name = 'Elemental #2';
mod_collection(9).name = 'Elemental #3';
mod_collection(10).name = 'Elemental #4';
mod_collection(11).name = 'Gunslinger';
mod_collection(12).name = 'Quickdraw';
mod_collection(13).name = 'Slip Magazine';




