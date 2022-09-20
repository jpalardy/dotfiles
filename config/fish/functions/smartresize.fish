# https://www.smashingmagazine.com/2015/06/efficient-image-resizing-with-imagemagick/
function smartresize
  # --size
  argparse -i size= -- $argv
  or return 1

  set -l size "50%"
  if set -q _flag_size
    set size $_flag_size
  end

  mogrify -filter Triangle -define filter:support=2 -thumbnail $size -unsharp 0.25x0.08+8.3+0.045 -dither None -posterize 136 -quality 82 -define jpeg:fancy-upsampling=off -define png:compression-filter=5 -define png:compression-level=9 -define png:compression-strategy=1 -define png:exclude-chunk=all -interlace none -colorspace sRGB $argv
end
