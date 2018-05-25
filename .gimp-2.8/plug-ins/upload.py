#!/usr/bin/python

"""
The MIT License (MIT)

Copyright (c) 2015 Evan Tschuy

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

Original source: https://github.com/tschuy/gimp-export-to-imgur
"""

from gimpfu import *
import time
import base64
import json
import os
import tempfile

client_id = "75272777892320e"

def upload_image(path):
    """
    Upload an image from a given path to Imgur. Uses the urllib2 library
    to ensure we don't need third-party dependencies for this package.
    """
    import urllib
    import urllib2

    with open(path, "rb") as image_file:
        args = { 'image': base64.b64encode(image_file.read()) }

    request = urllib2.Request('https://api.imgur.com/3/image')
    request.add_header('Authorization', "Client-ID " + client_id)

    request.add_data(urllib.urlencode(args))
    return json.loads(urllib2.urlopen(request).read())['data']


def plugin_main(image, layer):
    image = pdb.gimp_image_duplicate(image)
    layer = pdb.gimp_image_merge_visible_layers(image, CLIP_TO_IMAGE)
    file  = tempfile.NamedTemporaryFile(suffix='.png')
    file.close()
    pdb.file_png_save2(image, layer, file.name, os.path.basename(file.name), 0,5,0,0,0,0,0,0,0)
    imgur = upload_image(file.name)
    clean = os.remove(file.name)
    print imgur['link']
    gimp.message("Successfully uploaded!\n{}".format(imgur['link']))

# For help:
# import gimpfu
# help(gimpfu.register)

register(
        proc_name = "imgur_uploader",
        blurb = "Save and upload the image to Imgur",
        help = "Save and upload the image to Imgur",
        author = "Evan Tschuy",
        copyright = "MIT License",
        date = "2015",
        label = "<Image>/Custom/Upload to Imgur",
        imagetypes = "RGB*, GRAY*",
        params = [],
        results = [],
        function = plugin_main)

main()
