# Middleman Boilerplate

Samples for:

- Gulp funtions with `external_pipeline`
- Deploy with `rsync`
- Collect data with `data_source`
- Collect remote json data with javascript
- `active` class in menu items with `helpers`
- Keep accordion menu open with `yield_content`
- Link to any page on language menu item with `yield_content` 
- Localization (i18n)
- Middleman Blog 

Runs on:

- Ruby v2.6.2
- Middleman v4.3.6
- Bootstrap v4.4.0
- jQuery v3.2.1
- popper.js v1.16.0
- Font Awesome Free v5.13.0
- jquery-fancybox v3.1.0
- gulp v4.0.2

---




## Install Ruby & Middleman

- Install [rbenv](https://github.com/rbenv/rbenv#installation): 
  
    ```
    brew install rbenv
    ```
- Install Ruby v2.6.2:
    ```
    rbenv install 2.6.2
    ```
- Install [Middleman](https://middlemanapp.com/):
  
    ```
    gem install middleman
    ```
---


## Downloading Boilerplate


- with middleman init:
    ```
    middleman init ProjectName -T tarikkavaz/Middleman-Boilerplate
    cd ProjectName
    ```
- with cloning from Github
    ``` 
    git clone https://github.com/tarikkavaz/Middleman-Boilerplate.git ProjectName
    cd ProjectName
    rm -rf .git/
    ```


### Install Bundles & Node Packages
- Use Ruby v2.6.2 as local:
    ```
    rbenv local 2.6.2
    ```
- Install Ruby dependencies:
    ```
    bundle install --path vendor/bundle
    ```
- Install Node Packages:
    ```
    npm install
    ```
- Optionally there is a setup file that installs bundles and node packages (_Might need `chmod +x ./bin/setup` if you get  Permission Denied_). Run:
    ```
    bin/setup
    ```
    
- Add your Repo: 
    ```
    git init
    git add .
    git commit -m "init"
    git remote add origin https://github.com/your-name/ProjectName.git
    git push -u origin master
    ```

---


## Development

- Open http://localhost:4567
    ```
    bundle exec middleman
    ```
- Run with Production Env
    ```
    bundle exec middleman -e production
    ```
---


## Build

- All files will be compiled in a folder called `build`:
    ```
    bundle exec middleman build
    ```

---


## Deploy
-  `config.rb` set the site location on your server:
    ```ruby
    rsync.production_server = "123.45.0.56"
    rsync.path = "/home/deployer/sites/ProjectName"
    ```
- Uploading with `rsync` *(This command will ask for confirmation)*: 
    ```bash
    bundle exec middleman rsync production
    ```
---

## Styles and Scripts
- All style files are in folder `source/statics/css/`
    - Use all your styles in `layout.css.scss` 
    - To change asset varaibles like Boostrap colors: `_assets-overwrite.scss`
    - Custom Variables: `_vars.scss`
    - Custom Mixins: `_mixins.scss`

- The main Script file is `source/statics/js/custom.js` 
    Use all your scripts in this file.
    All other assets like jQuery will be compiled in a single file called `source/statics/js/site.js`.
    No need to edit this file. 
