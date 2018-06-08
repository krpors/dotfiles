#!/usr/bin/python

from gimpfu import *

"""
This plugin just executes a couple of Gimp filters. Every step
is added into a new layer, with their own blend mode.

    1. Copy original selected layer.
    2. 'Oilify enhanced' on the copy.
    3. Copy the layer from step 2.
    4. Apply Edge detection.
    5. Copy the original layer.
    6. Apply HSV noise
    7. Value Invert the layer

For more info check https://github.com/krpors/dotfiles
"""
def plugin_main(image, layer):
    layer_oilified = pdb.gimp_layer_copy(layer, False)
    layer_oilified.name = "Oilified"
    layer_oilified.mode = GRAIN_MERGE_MODE
    layer_oilified.opacity = 63.5
    image.add_layer(layer_oilified, 0)
    pdb.plug_in_oilify_enhanced(image, layer_oilified, 0, 28, None, 12, None)

    layer_edgedet = pdb.gimp_layer_copy(layer_oilified, False)
    layer_edgedet.name = "Edge detected"
    layer_edgedet.mode = OVERLAY_MODE
    image.add_layer(layer_edgedet, 0)
    pdb.plug_in_edge(image, layer_edgedet, 7.6, 2, 0)

    layer_hsvnoise = pdb.gimp_layer_copy(layer, False)
    layer_hsvnoise.name = "HSV Noised"
    layer_hsvnoise.mode = SUBTRACT_MODE
    layer_hsvnoise.opacity = 50.0
    image.add_layer(layer_hsvnoise, 0)
    pdb.plug_in_hsv_noise(image, layer_hsvnoise, 6, 80, 188, 198)
    pdb.plug_in_vinvert(image, layer_hsvnoise)


# For help:
# import gimpfu
# help(gimpfu.register)
# dir(pdb)

register(
        proc_name = "oeh_filter",
        blurb = "Just executes 3 filters in a row.",
        help = "Nothing to know",
        author = "Kevin Pors",
        copyright = "MIT License",
        date = "2018",
        label = "<Image>/Custom/Oil-Edge-Noise",
        imagetypes = "RGB*, GRAY*",
        params = [],
        results = [],
        function = plugin_main)

main()
