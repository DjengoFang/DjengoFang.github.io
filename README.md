# Academic Webpage

This is the source code for the personal webpage of Djengo Cyun-Jyun Fang.

It is derived from [Eldar Insafutdinov's personal website](https://github.com/eldar/personal-website); the rest of this README is his, lightly adapted.

The code is based on the **Academic** framework for **Hugo**.
This framework allows you to never touch HTML/CSS to build your own website.
I simplified and streamlined the theme significantly to match the type of personal webpages you would find in the Machine Learning community.
You can check out [the original demo](https://themes.gohugo.io/theme/academic/) of Academic or its [official documentation](https://sourcethemes.com/academic/docs/).

In this README I will re-iterate the very basics needed to get started, mostly for my own sake.

## Getting Started

1. Download [Hugo v0.53](https://github.com/gohugoio/hugo/releases/tag/v0.53).

2. Clone this repo with the theme submodule, on the `source` branch:

```bash
git clone --recurse-submodules -b source git@github.com:DjengoFang/DjengoFang.github.io.git
cd DjengoFang.github.io
```

3. Preview the website at http://localhost:1313:

```bash
hugo server
```

4. Edit the bio in `content/home/` and the research entries in `content/publication/`.

5. Publish. The `source` branch holds this Hugo source and the `main` branch holds the built site that GitHub Pages serves at https://djengofang.github.io. `deploy.sh` builds the site into `public/` (a worktree of `main`) and pushes it:

```bash
./deploy.sh "Describe the change"
git add -A && git commit -m "Describe the change" && git push origin source
```

## Filling Content

### General Info
1. Set your name in `config.toml` in the `[params]` section. Also set the title of the website

2. Add short bio to the `content/home/about.md`

### Publications
1. Now you can start adding publications. Publications are stored in the `content/publication` directory, you can use mine as an example. In order to generate data for publication you can use a python tool that is supplied with the **Academic** framework:

```bash
# First install the tool:
pip3 install academic

# then import the .bib file into the website
# make sure your current directory is the root of the website repo
academic import --bibtex /path/to/publication.bib
```

2. The previous step will create a directory corresponding to the publication under `content/publication`. This directory will contain file `index.md` which contains various definitions. You will have to open it and make further edits:

- Set the abstract to the `abstract` field, if not already there
- Set unique publication identifier to the `shortname`, much like you do in the bibtex, for example `"watson2018cvpr"`
- Specify abbreviation for the conference in `venue` field, for example `"CVPR, 2018"`
- You can place an optional teaser image to the publication directory, its file name has to contain `featured` in it.
- Add various URLs associated with the paper: `url_pdf` to link to the PDF of the paper (required), `url_project` for the project page, `url_video` for the video, `url_code` for the code and `url_slides` for the slides.

## License

Copyright 2018 [George Cushen](https://georgecushen.com), [Eldar Insafutdinov](https://eldar.github.io).

Site content (text under `content/`) copyright 2026 Djengo Cyun-Jyun Fang.

Released under the [MIT](https://github.com/sourcethemes/academic-kickstart/blob/master/LICENSE.md) license.
