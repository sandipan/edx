





<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
  <link rel="dns-prefetch" href="https://assets-cdn.github.com">
  <link rel="dns-prefetch" href="https://avatars0.githubusercontent.com">
  <link rel="dns-prefetch" href="https://avatars1.githubusercontent.com">
  <link rel="dns-prefetch" href="https://avatars2.githubusercontent.com">
  <link rel="dns-prefetch" href="https://avatars3.githubusercontent.com">
  <link rel="dns-prefetch" href="https://github-cloud.s3.amazonaws.com">
  <link rel="dns-prefetch" href="https://user-images.githubusercontent.com/">



  <link crossorigin="anonymous" href="https://assets-cdn.github.com/assets/frameworks-77c3b874f32e71b14cded5a120f42f5c7288fa52e0a37f2d5919fbd8bcfca63c.css" integrity="sha256-d8O4dPMucbFM3tWhIPQvXHKI+lLgo38tWRn72Lz8pjw=" media="all" rel="stylesheet" />
  <link crossorigin="anonymous" href="https://assets-cdn.github.com/assets/github-013f798f0f1146a62a1335aa17cc86754ea9e1d4a1295f016fa93a3c3715e282.css" integrity="sha256-AT95jw8RRqYqEzWqF8yGdU6p4dShKV8Bb6k6PDcV4oI=" media="all" rel="stylesheet" />
  
  
  
  

  <meta name="viewport" content="width=device-width">
  
  <title>CNTK/slots.wl at v2.0 · Microsoft/CNTK</title>
  <link rel="search" type="application/opensearchdescription+xml" href="/opensearch.xml" title="GitHub">
  <link rel="fluid-icon" href="https://github.com/fluidicon.png" title="GitHub">
  <meta property="fb:app_id" content="1401488693436528">

    
    <meta content="https://avatars2.githubusercontent.com/u/6154722?v=4&amp;s=400" property="og:image" /><meta content="GitHub" property="og:site_name" /><meta content="object" property="og:type" /><meta content="Microsoft/CNTK" property="og:title" /><meta content="https://github.com/Microsoft/CNTK" property="og:url" /><meta content="Microsoft Cognitive Toolkit (CNTK), an open source deep-learning toolkit" property="og:description" />

  <link rel="assets" href="https://assets-cdn.github.com/">
  <link rel="web-socket" href="wss://live.github.com/_sockets/VjI6MTg0MzkwOTQ0OjkzYWEzNTNmNmQwMGVjZGNmYTNkYjNiYjM3ODliNGRkNDE5ZDkzODkzNTFlOGY0ZTg5OTU1MTliNDAxMTM1MGM=--e7a2fe25aad01e29f395efbc50c4542c6cac3861">
  <meta name="pjax-timeout" content="1000">
  <link rel="sudo-modal" href="/sessions/sudo_modal">
  <meta name="request-id" content="3055:28A5:16BED62:292672C:598E31D8" data-pjax-transient>
  

  <meta name="selected-link" value="repo_source" data-pjax-transient>

  <meta name="google-site-verification" content="KT5gs8h0wvaagLKAVWq8bbeNwnZZK1r1XQysX3xurLU">
<meta name="google-site-verification" content="ZzhVyEFwb7w3e0-uOTltm8Jsck2F5StVihD0exw2fsA">
    <meta name="google-analytics" content="UA-3769691-2">

<meta content="collector.githubapp.com" name="octolytics-host" /><meta content="github" name="octolytics-app-id" /><meta content="https://collector.githubapp.com/github-external/browser_event" name="octolytics-event-url" /><meta content="3055:28A5:16BED62:292672C:598E31D8" name="octolytics-dimension-request_id" /><meta content="iad" name="octolytics-dimension-region_edge" /><meta content="iad" name="octolytics-dimension-region_render" /><meta content="896776" name="octolytics-actor-id" /><meta content="sandipan" name="octolytics-actor-login" /><meta content="e8a43d4e393846aae2bdc3e8b94000963670b48b34ee918cc943ae3054f8fabe" name="octolytics-actor-hash" />
<meta content="/&lt;user-name&gt;/&lt;repo-name&gt;/blob/show" data-pjax-transient="true" name="analytics-location" />




  <meta class="js-ga-set" name="dimension1" content="Logged In">


  

      <meta name="hostname" content="github.com">
  <meta name="user-login" content="sandipan">

      <meta name="expected-hostname" content="github.com">
    <meta name="js-proxy-site-detection-payload" content="Nzc2NjA2NGFiMjQzZjhkNTkzMzM4ODRjZDM0N2QwMjQwMTdiMWM5YjA5MWI4NGI2NjE1YjQ3NjYyNTIwNjY0OXx7InJlbW90ZV9hZGRyZXNzIjoiMjIzLjIyNS4xNDQuMyIsInJlcXVlc3RfaWQiOiIzMDU1OjI4QTU6MTZCRUQ2MjoyOTI2NzJDOjU5OEUzMUQ4IiwidGltZXN0YW1wIjoxNTAyNDkxMTAxLCJob3N0IjoiZ2l0aHViLmNvbSJ9">

    <meta name="enabled-features" content="UNIVERSE_BANNER">

  <meta name="html-safe-nonce" content="5814b4db0e789028a0f902582e1f77de1e5a4694">

  <meta http-equiv="x-pjax-version" content="8ed45ddc28eb670e484e14f2643c67fe">
  

      <link href="https://github.com/Microsoft/CNTK/commits/v2.0.atom" rel="alternate" title="Recent Commits to CNTK:v2.0" type="application/atom+xml">

  <meta name="description" content="Microsoft Cognitive Toolkit (CNTK), an open source deep-learning toolkit">
  <meta name="go-import" content="github.com/Microsoft/CNTK git https://github.com/Microsoft/CNTK.git">

  <meta content="6154722" name="octolytics-dimension-user_id" /><meta content="Microsoft" name="octolytics-dimension-user_login" /><meta content="46918116" name="octolytics-dimension-repository_id" /><meta content="Microsoft/CNTK" name="octolytics-dimension-repository_nwo" /><meta content="true" name="octolytics-dimension-repository_public" /><meta content="false" name="octolytics-dimension-repository_is_fork" /><meta content="46918116" name="octolytics-dimension-repository_network_root_id" /><meta content="Microsoft/CNTK" name="octolytics-dimension-repository_network_root_nwo" /><meta content="false" name="octolytics-dimension-repository_explore_github_marketplace_ci_cta_shown" />


    <link rel="canonical" href="https://github.com/Microsoft/CNTK/blob/v2.0/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl" data-pjax-transient>


  <meta name="browser-stats-url" content="https://api.github.com/_private/browser/stats">

  <meta name="browser-errors-url" content="https://api.github.com/_private/browser/errors">

  <link rel="mask-icon" href="https://assets-cdn.github.com/pinned-octocat.svg" color="#000000">
  <link rel="icon" type="image/x-icon" href="https://assets-cdn.github.com/favicon.ico">

<meta name="theme-color" content="#1e2327">


  <meta name="u2f-support" content="true">

  </head>

  <body class="logged-in env-production page-blob">
    

  <div class="position-relative js-header-wrapper ">
    <a href="#start-of-content" tabindex="1" class="bg-black text-white p-3 show-on-focus js-skip-to-content">Skip to content</a>
    <div id="js-pjax-loader-bar" class="pjax-loader-bar"><div class="progress"></div></div>

    
    
    



        
<div class="header" role="banner">
  <div class="container-lg px-3 clearfix">
    <div class="d-flex flex-justify-between">
      <div class="d-flex">
        <a class="header-logo-invertocat" href="https://github.com/" data-hotkey="g d" aria-label="Homepage" data-ga-click="Header, go to dashboard, icon:logo">
  <svg aria-hidden="true" class="octicon octicon-mark-github" height="32" version="1.1" viewBox="0 0 16 16" width="32"><path fill-rule="evenodd" d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27.68 0 1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.013 8.013 0 0 0 16 8c0-4.42-3.58-8-8-8z"/></svg>
</a>


            <div class="mr-2">
              <div class="header-search scoped-search site-scoped-search js-site-search" role="search">
  <!-- '"` --><!-- </textarea></xmp> --></option></form><form accept-charset="UTF-8" action="/Microsoft/CNTK/search" class="js-site-search-form" data-scoped-search-url="/Microsoft/CNTK/search" data-unscoped-search-url="/search" method="get"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /></div>
    <label class="form-control header-search-wrapper js-chromeless-input-container">
        <a href="/Microsoft/CNTK/blob/v2.0/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl" class="header-search-scope no-underline">This repository</a>
      <input type="text"
        class="form-control header-search-input js-site-search-focus js-site-search-field is-clearable"
        data-hotkey="s"
        name="q"
        value=""
        placeholder="Search"
        aria-label="Search this repository"
        data-unscoped-placeholder="Search GitHub"
        data-scoped-placeholder="Search"
        autocapitalize="off">
        <input type="hidden" class="js-site-search-type-field" name="type" >
    </label>
</form></div>

            </div>

          <ul class="d-flex list-style-none" role="navigation">
            <li>
              <a href="/pulls" aria-label="Pull requests you created" class="js-selected-navigation-item header-navlink" data-ga-click="Header, click, Nav menu - item:pulls context:user" data-hotkey="g p" data-selected-links="/pulls /pulls/assigned /pulls/mentioned /pulls">
                Pull requests
</a>            </li>
            <li>
              <a href="/issues" aria-label="Issues you created" class="js-selected-navigation-item header-navlink" data-ga-click="Header, click, Nav menu - item:issues context:user" data-hotkey="g i" data-selected-links="/issues /issues/assigned /issues/mentioned /issues">
                Issues
</a>            </li>
                <li>
                  <a href="/marketplace" class="js-selected-navigation-item header-navlink" data-ga-click="Header, click, Nav menu - item:marketplace context:user" data-selected-links=" /marketplace">
                    Marketplace
</a>                </li>
              <li>
                <a class="header-navlink" href="https://gist.github.com/" data-ga-click="Header, go to gist, text:gist">Gist</a>
              </li>
          </ul>
      </div>

      <div class="d-flex">
        
<ul class="d-flex user-nav list-style-none" id="user-links">
  <li class="dropdown js-menu-container">
    
      <a href="/notifications" aria-label="You have no unread notifications" class="header-navlink notification-indicator tooltipped tooltipped-s js-socket-channel js-notification-indicator" data-channel="notification-changed:896776" data-ga-click="Header, go to notifications, icon:read" data-hotkey="g n">
          <span class="mail-status "></span>
          <svg aria-hidden="true" class="octicon octicon-bell" height="16" version="1.1" viewBox="0 0 14 16" width="14"><path fill-rule="evenodd" d="M14 12v1H0v-1l.73-.58c.77-.77.81-2.55 1.19-4.42C2.69 3.23 6 2 6 2c0-.55.45-1 1-1s1 .45 1 1c0 0 3.39 1.23 4.16 5 .38 1.88.42 3.66 1.19 4.42l.66.58H14zm-7 4c1.11 0 2-.89 2-2H5c0 1.11.89 2 2 2z"/></svg>
</a>
  </li>

  <li class="dropdown js-menu-container">
    <a class="header-navlink tooltipped tooltipped-s js-menu-target" href="/new"
       aria-label="Create new…"
       aria-expanded="false"
       aria-haspopup="true"
       data-ga-click="Header, create new, icon:add">
      <svg aria-hidden="true" class="octicon octicon-plus float-left" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 9H7v5H5V9H0V7h5V2h2v5h5z"/></svg>
      <span class="dropdown-caret"></span>
    </a>

    <div class="dropdown-menu-content js-menu-content">
      <ul class="dropdown-menu dropdown-menu-sw">
        
<a class="dropdown-item" href="/new" data-ga-click="Header, create new repository">
  New repository
</a>

  <a class="dropdown-item" href="/new/import" data-ga-click="Header, import a repository">
    Import repository
  </a>

<a class="dropdown-item" href="https://gist.github.com/" data-ga-click="Header, create new gist">
  New gist
</a>

  <a class="dropdown-item" href="/organizations/new" data-ga-click="Header, create new organization">
    New organization
  </a>



  <div class="dropdown-divider"></div>
  <div class="dropdown-header">
    <span title="Microsoft/CNTK">This repository</span>
  </div>
    <a class="dropdown-item" href="/Microsoft/CNTK/issues/new" data-ga-click="Header, create new issue">
      New issue
    </a>

      </ul>
    </div>
  </li>

  <li class="dropdown js-menu-container">
    <a class="header-navlink name tooltipped tooltipped-sw js-menu-target" href="/sandipan"
       aria-label="View profile and more"
       aria-expanded="false"
       aria-haspopup="true"
       data-ga-click="Header, show menu, icon:avatar">
      <img alt="@sandipan" class="avatar" src="https://avatars1.githubusercontent.com/u/896776?v=4&amp;s=40" height="20" width="20">
      <span class="dropdown-caret"></span>
    </a>

    <div class="dropdown-menu-content js-menu-content">
      <div class="dropdown-menu dropdown-menu-sw">
        <div class="dropdown-header header-nav-current-user css-truncate">
          Signed in as <strong class="css-truncate-target">sandipan</strong>
        </div>

        <div class="dropdown-divider"></div>

        <a class="dropdown-item" href="/sandipan" data-ga-click="Header, go to profile, text:your profile">
          Your profile
        </a>
        <a class="dropdown-item" href="/sandipan?tab=stars" data-ga-click="Header, go to starred repos, text:your stars">
          Your stars
        </a>
        <a class="dropdown-item" href="/explore" data-ga-click="Header, go to explore, text:explore">
          Explore
        </a>
        <a class="dropdown-item" href="https://help.github.com" data-ga-click="Header, go to help, text:help">
          Help
        </a>

        <div class="dropdown-divider"></div>

        <a class="dropdown-item" href="/settings/profile" data-ga-click="Header, go to settings, icon:settings">
          Settings
        </a>

        <!-- '"` --><!-- </textarea></xmp> --></option></form><form accept-charset="UTF-8" action="/logout" class="logout-form" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="6VVnLJ77HLENEG2bbqk4Dwjh7iL9kyyscJ/lJ8rUmklC3EMBSVVoreVHS0RzqCdY/KNkmwyZL6/b6R3ZEfIojA==" /></div>
          <button type="submit" class="dropdown-item dropdown-signout" data-ga-click="Header, sign out, icon:logout">
            Sign out
          </button>
</form>      </div>
    </div>
  </li>
</ul>


        <!-- '"` --><!-- </textarea></xmp> --></option></form><form accept-charset="UTF-8" action="/logout" class="sr-only right-0" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="34Bz2Az3hmXX4s2NDGdZAs6m8V2EvJ0LkoCkB2Rd9/h0CVf121nyeT+161IRZkZVOuR75HW2ngg59lz5v3tFPQ==" /></div>
          <button type="submit" class="dropdown-item dropdown-signout" data-ga-click="Header, sign out, icon:logout">
            Sign out
          </button>
</form>      </div>
    </div>
  </div>
</div>


      

  </div>

  <div id="start-of-content" class="show-on-focus"></div>

    <div id="js-flash-container">
</div>



  <div role="main">
        <div itemscope itemtype="http://schema.org/SoftwareSourceCode">
    <div id="js-repo-pjax-container" data-pjax-container>
      



  



    <div class="pagehead repohead instapaper_ignore readability-menu experiment-repo-nav">
      <div class="container repohead-details-container">

        <ul class="pagehead-actions">
  <li>
        <!-- '"` --><!-- </textarea></xmp> --></option></form><form accept-charset="UTF-8" action="/notifications/subscribe" class="js-social-container" data-autosubmit="true" data-remote="true" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="Q5rbnTajnDR9GSmJ63kNm//KGOG9w0Yo0LsOW+ckedttXe8ZPeKBOupbwVSG8JJcmaiI1I/eYbxYTeKcdcMFFw==" /></div>      <input class="form-control" id="repository_id" name="repository_id" type="hidden" value="46918116" />

        <div class="select-menu js-menu-container js-select-menu">
          <a href="/Microsoft/CNTK/subscription"
            class="btn btn-sm btn-with-count select-menu-button js-menu-target"
            role="button"
            aria-haspopup="true"
            aria-expanded="false"
            aria-label="Toggle repository notifications menu"
            data-ga-click="Repository, click Watch settings, action:blob#show">
            <span class="js-select-button">
                <svg aria-hidden="true" class="octicon octicon-eye" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M8.06 2C3 2 0 8 0 8s3 6 8.06 6C13 14 16 8 16 8s-3-6-7.94-6zM8 12c-2.2 0-4-1.78-4-4 0-2.2 1.8-4 4-4 2.22 0 4 1.8 4 4 0 2.22-1.78 4-4 4zm2-4c0 1.11-.89 2-2 2-1.11 0-2-.89-2-2 0-1.11.89-2 2-2 1.11 0 2 .89 2 2z"/></svg>
                Watch
            </span>
          </a>
            <a class="social-count js-social-count"
              href="/Microsoft/CNTK/watchers"
              aria-label="1223 users are watching this repository">
              1,223
            </a>

        <div class="select-menu-modal-holder">
          <div class="select-menu-modal subscription-menu-modal js-menu-content">
            <div class="select-menu-header js-navigation-enable" tabindex="-1">
              <svg aria-label="Close" class="octicon octicon-x js-menu-close" height="16" role="img" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M7.48 8l3.75 3.75-1.48 1.48L6 9.48l-3.75 3.75-1.48-1.48L4.52 8 .77 4.25l1.48-1.48L6 6.52l3.75-3.75 1.48 1.48z"/></svg>
              <span class="select-menu-title">Notifications</span>
            </div>

              <div class="select-menu-list js-navigation-container" role="menu">

                <div class="select-menu-item js-navigation-item selected" role="menuitem" tabindex="0">
                  <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
                  <div class="select-menu-item-text">
                    <input checked="checked" id="do_included" name="do" type="radio" value="included" />
                    <span class="select-menu-item-heading">Not watching</span>
                    <span class="description">Be notified when participating or @mentioned.</span>
                    <span class="js-select-button-text hidden-select-button-text">
                      <svg aria-hidden="true" class="octicon octicon-eye" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M8.06 2C3 2 0 8 0 8s3 6 8.06 6C13 14 16 8 16 8s-3-6-7.94-6zM8 12c-2.2 0-4-1.78-4-4 0-2.2 1.8-4 4-4 2.22 0 4 1.8 4 4 0 2.22-1.78 4-4 4zm2-4c0 1.11-.89 2-2 2-1.11 0-2-.89-2-2 0-1.11.89-2 2-2 1.11 0 2 .89 2 2z"/></svg>
                      Watch
                    </span>
                  </div>
                </div>

                <div class="select-menu-item js-navigation-item " role="menuitem" tabindex="0">
                  <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
                  <div class="select-menu-item-text">
                    <input id="do_subscribed" name="do" type="radio" value="subscribed" />
                    <span class="select-menu-item-heading">Watching</span>
                    <span class="description">Be notified of all conversations.</span>
                    <span class="js-select-button-text hidden-select-button-text">
                      <svg aria-hidden="true" class="octicon octicon-eye" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M8.06 2C3 2 0 8 0 8s3 6 8.06 6C13 14 16 8 16 8s-3-6-7.94-6zM8 12c-2.2 0-4-1.78-4-4 0-2.2 1.8-4 4-4 2.22 0 4 1.8 4 4 0 2.22-1.78 4-4 4zm2-4c0 1.11-.89 2-2 2-1.11 0-2-.89-2-2 0-1.11.89-2 2-2 1.11 0 2 .89 2 2z"/></svg>
                        Unwatch
                    </span>
                  </div>
                </div>

                <div class="select-menu-item js-navigation-item " role="menuitem" tabindex="0">
                  <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
                  <div class="select-menu-item-text">
                    <input id="do_ignore" name="do" type="radio" value="ignore" />
                    <span class="select-menu-item-heading">Ignoring</span>
                    <span class="description">Never be notified.</span>
                    <span class="js-select-button-text hidden-select-button-text">
                      <svg aria-hidden="true" class="octicon octicon-mute" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M8 2.81v10.38c0 .67-.81 1-1.28.53L3 10H1c-.55 0-1-.45-1-1V7c0-.55.45-1 1-1h2l3.72-3.72C7.19 1.81 8 2.14 8 2.81zm7.53 3.22l-1.06-1.06-1.97 1.97-1.97-1.97-1.06 1.06L11.44 8 9.47 9.97l1.06 1.06 1.97-1.97 1.97 1.97 1.06-1.06L13.56 8l1.97-1.97z"/></svg>
                        Stop ignoring
                    </span>
                  </div>
                </div>

              </div>

            </div>
          </div>
        </div>
</form>
  </li>

  <li>
    
  <div class="js-toggler-container js-social-container starring-container ">
    <!-- '"` --><!-- </textarea></xmp> --></option></form><form accept-charset="UTF-8" action="/Microsoft/CNTK/unstar" class="starred" data-remote="true" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="lENX0g9/TT4SNiPEwLDtaeSwdsTrWmZb1HbGb2c7ue1s6d6IJy+dSrVRj2kohTfNzUbGFZwLX3TkarhBPCoYKQ==" /></div>
      <button
        type="submit"
        class="btn btn-sm btn-with-count js-toggler-target"
        aria-label="Unstar this repository" title="Unstar Microsoft/CNTK"
        data-ga-click="Repository, click unstar button, action:blob#show; text:Unstar">
        <svg aria-hidden="true" class="octicon octicon-star" height="16" version="1.1" viewBox="0 0 14 16" width="14"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74z"/></svg>
        Unstar
      </button>
        <a class="social-count js-social-count" href="/Microsoft/CNTK/stargazers"
           aria-label="12039 users starred this repository">
          12,039
        </a>
</form>
    <!-- '"` --><!-- </textarea></xmp> --></option></form><form accept-charset="UTF-8" action="/Microsoft/CNTK/star" class="unstarred" data-remote="true" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="4a+9DZtx5j9gs6foCHHQaKiyMdzBV4G+lkOPXANfDFNoQX3LrnRYUgsMmajj/n4CtKvanJAEr9EjKjq55H+85w==" /></div>
      <button
        type="submit"
        class="btn btn-sm btn-with-count js-toggler-target"
        aria-label="Star this repository" title="Star Microsoft/CNTK"
        data-ga-click="Repository, click star button, action:blob#show; text:Star">
        <svg aria-hidden="true" class="octicon octicon-star" height="16" version="1.1" viewBox="0 0 14 16" width="14"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74z"/></svg>
        Star
      </button>
        <a class="social-count js-social-count" href="/Microsoft/CNTK/stargazers"
           aria-label="12039 users starred this repository">
          12,039
        </a>
</form>  </div>

  </li>

  <li>
          <!-- '"` --><!-- </textarea></xmp> --></option></form><form accept-charset="UTF-8" action="/Microsoft/CNTK/fork" class="btn-with-count" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="RzUd+buvMhUK6weJgAX4ZhiSws/IkaXQbYlDFXyvz3hJb6GuHJ8EG9I0rdyDn14kgsJfHdPQQmgkBFWQt7V5jQ==" /></div>
            <button
                type="submit"
                class="btn btn-sm btn-with-count"
                data-ga-click="Repository, show fork modal, action:blob#show; text:Fork"
                title="Fork your own copy of Microsoft/CNTK to your account"
                aria-label="Fork your own copy of Microsoft/CNTK to your account">
              <svg aria-hidden="true" class="octicon octicon-repo-forked" height="16" version="1.1" viewBox="0 0 10 16" width="10"><path fill-rule="evenodd" d="M8 1a1.993 1.993 0 0 0-1 3.72V6L5 8 3 6V4.72A1.993 1.993 0 0 0 2 1a1.993 1.993 0 0 0-1 3.72V6.5l3 3v1.78A1.993 1.993 0 0 0 5 15a1.993 1.993 0 0 0 1-3.72V9.5l3-3V4.72A1.993 1.993 0 0 0 8 1zM2 4.2C1.34 4.2.8 3.65.8 3c0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zm3 10c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zm3-10c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2z"/></svg>
              Fork
            </button>
</form>
    <a href="/Microsoft/CNTK/network" class="social-count"
       aria-label="3087 users forked this repository">
      3,087
    </a>
  </li>
</ul>

        <h1 class="public ">
  <svg aria-hidden="true" class="octicon octicon-repo" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M4 9H3V8h1v1zm0-3H3v1h1V6zm0-2H3v1h1V4zm0-2H3v1h1V2zm8-1v12c0 .55-.45 1-1 1H6v2l-1.5-1.5L3 16v-2H1c-.55 0-1-.45-1-1V1c0-.55.45-1 1-1h10c.55 0 1 .45 1 1zm-1 10H1v2h2v-1h3v1h5v-2zm0-10H2v9h9V1z"/></svg>
  <span class="author" itemprop="author"><a href="/Microsoft" class="url fn" rel="author">Microsoft</a></span><!--
--><span class="path-divider">/</span><!--
--><strong itemprop="name"><a href="/Microsoft/CNTK" data-pjax="#js-repo-pjax-container">CNTK</a></strong>

</h1>

      </div>
      <div class="container">
        
<nav class="reponav js-repo-nav js-sidenav-container-pjax"
     itemscope
     itemtype="http://schema.org/BreadcrumbList"
     role="navigation"
     data-pjax="#js-repo-pjax-container">

  <span itemscope itemtype="http://schema.org/ListItem" itemprop="itemListElement">
    <a href="/Microsoft/CNTK/tree/v2.0" class="js-selected-navigation-item selected reponav-item" data-hotkey="g c" data-selected-links="repo_source repo_downloads repo_commits repo_releases repo_tags repo_branches /Microsoft/CNTK/tree/v2.0" itemprop="url">
      <svg aria-hidden="true" class="octicon octicon-code" height="16" version="1.1" viewBox="0 0 14 16" width="14"><path fill-rule="evenodd" d="M9.5 3L8 4.5 11.5 8 8 11.5 9.5 13 14 8 9.5 3zm-5 0L0 8l4.5 5L6 11.5 2.5 8 6 4.5 4.5 3z"/></svg>
      <span itemprop="name">Code</span>
      <meta itemprop="position" content="1">
</a>  </span>

    <span itemscope itemtype="http://schema.org/ListItem" itemprop="itemListElement">
      <a href="/Microsoft/CNTK/issues" class="js-selected-navigation-item reponav-item" data-hotkey="g i" data-selected-links="repo_issues repo_labels repo_milestones /Microsoft/CNTK/issues" itemprop="url">
        <svg aria-hidden="true" class="octicon octicon-issue-opened" height="16" version="1.1" viewBox="0 0 14 16" width="14"><path fill-rule="evenodd" d="M7 2.3c3.14 0 5.7 2.56 5.7 5.7s-2.56 5.7-5.7 5.7A5.71 5.71 0 0 1 1.3 8c0-3.14 2.56-5.7 5.7-5.7zM7 1C3.14 1 0 4.14 0 8s3.14 7 7 7 7-3.14 7-7-3.14-7-7-7zm1 3H6v5h2V4zm0 6H6v2h2v-2z"/></svg>
        <span itemprop="name">Issues</span>
        <span class="Counter">137</span>
        <meta itemprop="position" content="2">
</a>    </span>

  <span itemscope itemtype="http://schema.org/ListItem" itemprop="itemListElement">
    <a href="/Microsoft/CNTK/pulls" class="js-selected-navigation-item reponav-item" data-hotkey="g p" data-selected-links="repo_pulls /Microsoft/CNTK/pulls" itemprop="url">
      <svg aria-hidden="true" class="octicon octicon-git-pull-request" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M11 11.28V5c-.03-.78-.34-1.47-.94-2.06C9.46 2.35 8.78 2.03 8 2H7V0L4 3l3 3V4h1c.27.02.48.11.69.31.21.2.3.42.31.69v6.28A1.993 1.993 0 0 0 10 15a1.993 1.993 0 0 0 1-3.72zm-1 2.92c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zM4 3c0-1.11-.89-2-2-2a1.993 1.993 0 0 0-1 3.72v6.56A1.993 1.993 0 0 0 2 15a1.993 1.993 0 0 0 1-3.72V4.72c.59-.34 1-.98 1-1.72zm-.8 10c0 .66-.55 1.2-1.2 1.2-.65 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2zM2 4.2C1.34 4.2.8 3.65.8 3c0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2z"/></svg>
      <span itemprop="name">Pull requests</span>
      <span class="Counter">34</span>
      <meta itemprop="position" content="3">
</a>  </span>


    <a href="/Microsoft/CNTK/wiki" class="js-selected-navigation-item reponav-item" data-hotkey="g w" data-selected-links="repo_wiki /Microsoft/CNTK/wiki">
      <svg aria-hidden="true" class="octicon octicon-book" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M3 5h4v1H3V5zm0 3h4V7H3v1zm0 2h4V9H3v1zm11-5h-4v1h4V5zm0 2h-4v1h4V7zm0 2h-4v1h4V9zm2-6v9c0 .55-.45 1-1 1H9.5l-1 1-1-1H2c-.55 0-1-.45-1-1V3c0-.55.45-1 1-1h5.5l1 1 1-1H15c.55 0 1 .45 1 1zm-8 .5L7.5 3H2v9h6V3.5zm7-.5H9.5l-.5.5V12h6V3z"/></svg>
      Wiki
</a>

    <div class="reponav-dropdown js-menu-container">
      <button type="button" class="btn-link reponav-item reponav-dropdown js-menu-target " data-no-toggle aria-expanded="false" aria-haspopup="true">
        Insights
        <svg aria-hidden="true" class="octicon octicon-triangle-down v-align-middle text-gray" height="11" version="1.1" viewBox="0 0 12 16" width="8"><path fill-rule="evenodd" d="M0 5l6 6 6-6z"/></svg>
      </button>
      <div class="dropdown-menu-content js-menu-content">
        <div class="dropdown-menu dropdown-menu-sw">
          <a class="dropdown-item" href="/Microsoft/CNTK/pulse" data-skip-pjax>
            <svg aria-hidden="true" class="octicon octicon-pulse" height="16" version="1.1" viewBox="0 0 14 16" width="14"><path fill-rule="evenodd" d="M11.5 8L8.8 5.4 6.6 8.5 5.5 1.6 2.38 8H0v2h3.6l.9-1.8.9 5.4L9 8.5l1.6 1.5H14V8z"/></svg>
            Pulse
          </a>
          <a class="dropdown-item" href="/Microsoft/CNTK/graphs" data-skip-pjax>
            <svg aria-hidden="true" class="octicon octicon-graph" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M16 14v1H0V0h1v14h15zM5 13H3V8h2v5zm4 0H7V3h2v10zm4 0h-2V6h2v7z"/></svg>
            Graphs
          </a>
        </div>
      </div>
    </div>
</nav>

      </div>
    </div>

<div class="container new-discussion-timeline experiment-repo-nav">
  <div class="repository-content">

    
  <a href="/Microsoft/CNTK/blob/ade8bc05d30e61160da729aee078e22f8bd4fced/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl" class="d-none js-permalink-shortcut" data-hotkey="y">Permalink</a>

  <!-- blob contrib key: blob_contributors:v21:0f21e36407cab1040f1a18749aab1a5e -->

  <div class="file-navigation js-zeroclipboard-container">
    
<div class="select-menu branch-select-menu js-menu-container js-select-menu float-left">
  <button class=" btn btn-sm select-menu-button js-menu-target css-truncate" data-hotkey="w"
    
    type="button" aria-label="Switch branches or tags" aria-expanded="false" aria-haspopup="true">
      <i>Tag:</i>
      <span class="js-select-button css-truncate-target">v2.0</span>
  </button>

  <div class="select-menu-modal-holder js-menu-content js-navigation-container" data-pjax>

    <div class="select-menu-modal">
      <div class="select-menu-header">
        <svg aria-label="Close" class="octicon octicon-x js-menu-close" height="16" role="img" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M7.48 8l3.75 3.75-1.48 1.48L6 9.48l-3.75 3.75-1.48-1.48L4.52 8 .77 4.25l1.48-1.48L6 6.52l3.75-3.75 1.48 1.48z"/></svg>
        <span class="select-menu-title">Switch branches/tags</span>
      </div>

      <div class="select-menu-filters">
        <div class="select-menu-text-filter">
          <input type="text" aria-label="Filter branches/tags" id="context-commitish-filter-field" class="form-control js-filterable-field js-navigation-enable" placeholder="Filter branches/tags">
        </div>
        <div class="select-menu-tabs">
          <ul>
            <li class="select-menu-tab">
              <a href="#" data-tab-filter="branches" data-filter-placeholder="Filter branches/tags" class="js-select-menu-tab" role="tab">Branches</a>
            </li>
            <li class="select-menu-tab">
              <a href="#" data-tab-filter="tags" data-filter-placeholder="Find a tag…" class="js-select-menu-tab" role="tab">Tags</a>
            </li>
          </ul>
        </div>
      </div>

      <div class="select-menu-list select-menu-tab-bucket js-select-menu-tab-bucket" data-tab-filter="branches" role="menu">

        <div data-filterable-for="context-commitish-filter-field" data-filterable-type="substring">


            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/2.0rc/breakingChanges/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="2.0rc/breakingChanges"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                2.0rc/breakingChanges
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/CUDA-elementwise-rework/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="CUDA-elementwise-rework"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                CUDA-elementwise-rework
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/Dev/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="Dev"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                Dev
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/KaldiReaderOnWindows/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="KaldiReaderOnWindows"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                KaldiReaderOnWindows
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/LastKnownGood/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="LastKnownGood"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                LastKnownGood
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/MasterBeforeRemovingUnusedCode/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="MasterBeforeRemovingUnusedCode"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                MasterBeforeRemovingUnusedCode
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/aayushg/Seq2SeqRepro/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="aayushg/Seq2SeqRepro"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                aayushg/Seq2SeqRepro
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/aayushg/autoencoder/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="aayushg/autoencoder"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                aayushg/autoencoder
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/aayushg/seq2seqChanges/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="aayushg/seq2seqChanges"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                aayushg/seq2seqChanges
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/aforesti/compnetwork-constructors/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="aforesti/compnetwork-constructors"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                aforesti/compnetwork-constructors
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/alahiri/distrib-reading-LMSequenceReader/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="alahiri/distrib-reading-LMSequenceReader"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                alahiri/distrib-reading-LMSequenceReader
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/alexeyk/bn_fix/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="alexeyk/bn_fix"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                alexeyk/bn_fix
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/alexeyk/bn/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="alexeyk/bn"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                alexeyk/bn
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/alexeyk/conv_fix/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="alexeyk/conv_fix"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                alexeyk/conv_fix
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/alexeyk/conv_tests/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="alexeyk/conv_tests"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                alexeyk/conv_tests
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/alexeyk/cudnn3/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="alexeyk/cudnn3"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                alexeyk/cudnn3
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/alexeyk/legacy/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="alexeyk/legacy"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                alexeyk/legacy
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/alexeyk/logsum/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="alexeyk/logsum"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                alexeyk/logsum
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/alexeyk/perf/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="alexeyk/perf"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                alexeyk/perf
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/alexeyk/tests/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="alexeyk/tests"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                alexeyk/tests
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/alexeyo/Docker-Image/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="alexeyo/Docker-Image"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                alexeyo/Docker-Image
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/alexeyo/ReadMe-News-February-10/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="alexeyo/ReadMe-News-February-10"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                alexeyo/ReadMe-News-February-10
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/alexeyo/fix-linux-install-mpi-path/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="alexeyo/fix-linux-install-mpi-path"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                alexeyo/fix-linux-install-mpi-path
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/alexeyo/test-winodows-drop-new-file-names/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="alexeyo/test-winodows-drop-new-file-names"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                alexeyo/test-winodows-drop-new-file-names
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/alexeyo/1bit-SGD-License-Update-Do-Not-Integrate/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="alexeyo/1bit-SGD-License-Update-Do-Not-Integrate"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                alexeyo/1bit-SGD-License-Update-Do-Not-Integrate
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/alrezni/MatrixQuantizerTestsFailRepro/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="alrezni/MatrixQuantizerTestsFailRepro"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                alrezni/MatrixQuantizerTestsFailRepro
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/alrezni/RandomGeneratorCpu/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="alrezni/RandomGeneratorCpu"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                alrezni/RandomGeneratorCpu
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/alrezni/RandomUniform/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="alrezni/RandomUniform"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                alrezni/RandomUniform
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/alrezni/ReseedCudaGenerator/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="alrezni/ReseedCudaGenerator"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                alrezni/ReseedCudaGenerator
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/alrezni/bptt_ctf/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="alrezni/bptt_ctf"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                alrezni/bptt_ctf
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/alrezni/checkpointing_v2/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="alrezni/checkpointing_v2"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                alrezni/checkpointing_v2
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/alrezni/ctf_nan/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="alrezni/ctf_nan"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                alrezni/ctf_nan
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/alrezni/cuda_reset_test/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="alrezni/cuda_reset_test"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                alrezni/cuda_reset_test
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/alrezni/divering_loss_with_checkpointing/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="alrezni/divering_loss_with_checkpointing"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                alrezni/divering_loss_with_checkpointing
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/alrezni/fix_pytests/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="alrezni/fix_pytests"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                alrezni/fix_pytests
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/alrezni/index_cache/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="alrezni/index_cache"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                alrezni/index_cache
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/alrezni/learners_v2_serialization/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="alrezni/learners_v2_serialization"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                alrezni/learners_v2_serialization
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/alrezni/learners_v2_uts/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="alrezni/learners_v2_uts"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                alrezni/learners_v2_uts
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/alrezni/learners_v2/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="alrezni/learners_v2"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                alrezni/learners_v2
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/alrezni/mlf_fix/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="alrezni/mlf_fix"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                alrezni/mlf_fix
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/alrezni/mpi_lib_loading/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="alrezni/mpi_lib_loading"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                alrezni/mpi_lib_loading
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/alrezni/proposal_layer/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="alrezni/proposal_layer"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                alrezni/proposal_layer
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/alrezni/reader_randomization_test/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="alrezni/reader_randomization_test"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                alrezni/reader_randomization_test
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/alrezni/simple_mnist_repro/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="alrezni/simple_mnist_repro"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                alrezni/simple_mnist_repro
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/alrezni/text_reader_benchmark/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="alrezni/text_reader_benchmark"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                alrezni/text_reader_benchmark
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/alrezni/v2_communicator/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="alrezni/v2_communicator"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                alrezni/v2_communicator
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/alrezni/xpacker/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="alrezni/xpacker"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                alrezni/xpacker
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/alrezni/xpacker2/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="alrezni/xpacker2"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                alrezni/xpacker2
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/amitaga/apiChangesForRC/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="amitaga/apiChangesForRC"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                amitaga/apiChangesForRC
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/amitaga/batchNorm/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="amitaga/batchNorm"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                amitaga/batchNorm
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/amitaga/beta11BugFixes/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="amitaga/beta11BugFixes"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                amitaga/beta11BugFixes
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/amitaga/bn/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="amitaga/bn"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                amitaga/bn
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/amitaga/cudaErrorBugFix/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="amitaga/cudaErrorBugFix"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                amitaga/cudaErrorBugFix
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/amitaga/cudaMemCheckForE2ETests/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="amitaga/cudaMemCheckForE2ETests"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                amitaga/cudaMemCheckForE2ETests
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/amitaga/dataInteropFeatures/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="amitaga/dataInteropFeatures"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                amitaga/dataInteropFeatures
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/amitaga/fix1BitPerf/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="amitaga/fix1BitPerf"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                amitaga/fix1BitPerf
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/amitaga/fixSimpleAggregatorPerf/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="amitaga/fixSimpleAggregatorPerf"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                amitaga/fixSimpleAggregatorPerf
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/amitaga/htkmlfreaderMemoryOptimizations/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="amitaga/htkmlfreaderMemoryOptimizations"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                amitaga/htkmlfreaderMemoryOptimizations
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/amitaga/mblayoutMismatchError/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="amitaga/mblayoutMismatchError"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                amitaga/mblayoutMismatchError
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/amitaga/memoryDebug/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="amitaga/memoryDebug"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                amitaga/memoryDebug
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/amitaga/noDEBUG/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="amitaga/noDEBUG"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                amitaga/noDEBUG
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/amitaga/sparseMemAllocFix/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="amitaga/sparseMemAllocFix"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                amitaga/sparseMemAllocFix
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/amitaga/v2Library/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="amitaga/v2Library"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                amitaga/v2Library
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/arturl-uwp-doc/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="arturl-uwp-doc"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                arturl-uwp-doc
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/arturl-uwp-sample-pick-model/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="arturl-uwp-sample-pick-model"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                arturl-uwp-sample-pick-model
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/arturl-uwp-sample/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="arturl-uwp-sample"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                arturl-uwp-sample
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/barlaso/SampledTimes/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="barlaso/SampledTimes"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                barlaso/SampledTimes
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/binbzha/backstitch/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="binbzha/backstitch"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                binbzha/backstitch
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/binbzha/latency-control-blstm/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="binbzha/latency-control-blstm"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                binbzha/latency-control-blstm
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/binbzha/low-frame-rate/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="binbzha/low-frame-rate"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                binbzha/low-frame-rate
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/binxu/LeakyReLU/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="binxu/LeakyReLU"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                binxu/LeakyReLU
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/bmitra/NDRMReader/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="bmitra/NDRMReader"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                bmitra/NDRMReader
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/bmitra/fix/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="bmitra/fix"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                bmitra/fix
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/bospoort-maartenb/cntk_103a/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="bospoort-maartenb/cntk_103a"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                bospoort-maartenb/cntk_103a
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/cazhan/lu-seq-reader/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="cazhan/lu-seq-reader"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                cazhan/lu-seq-reader
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/chanliu/TSLearn/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="chanliu/TSLearn"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                chanliu/TSLearn
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/chenta/add_keras_learner/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="chenta/add_keras_learner"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                chenta/add_keras_learner
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/chenta/align_axis_indices/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="chenta/align_axis_indices"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                chenta/align_axis_indices
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/chenta/disable_omp/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="chenta/disable_omp"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                chenta/disable_omp
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/chenta/distPerf/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="chenta/distPerf"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                chenta/distPerf
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/chenta/expose_gradient_api/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="chenta/expose_gradient_api"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                chenta/expose_gradient_api
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/chenta/fix_conv_crash/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="chenta/fix_conv_crash"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                chenta/fix_conv_crash
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/chenta/fix_gather_bug/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="chenta/fix_gather_bug"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                chenta/fix_gather_bug
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/chenta/keras-final/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="chenta/keras-final"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                chenta/keras-final
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/chenta/keras_learner/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="chenta/keras_learner"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                chenta/keras_learner
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/chenta/padding/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="chenta/padding"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                chenta/padding
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/chenta/print_omp_thread/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="chenta/print_omp_thread"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                chenta/print_omp_thread
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/chenta/profile_test/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="chenta/profile_test"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                chenta/profile_test
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/chenta/reverse_support/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="chenta/reverse_support"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                chenta/reverse_support
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/chenta/test/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="chenta/test"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                chenta/test
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/chenta/univeral-learner/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="chenta/univeral-learner"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                chenta/univeral-learner
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/chenzhehuai/lfbmmi-negstream-sil/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="chenzhehuai/lfbmmi-negstream-sil"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                chenzhehuai/lfbmmi-negstream-sil
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/chenzhehuai/lfbmmi-negstream/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="chenzhehuai/lfbmmi-negstream"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                chenzhehuai/lfbmmi-negstream
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/clemensm/cntkmkl-evalx/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="clemensm/cntkmkl-evalx"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                clemensm/cntkmkl-evalx
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/clemensm/cntkmkl/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="clemensm/cntkmkl"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                clemensm/cntkmkl
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/clemensm/dynamicaxis/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="clemensm/dynamicaxis"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                clemensm/dynamicaxis
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/clemensm/fixseqcla/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="clemensm/fixseqcla"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                clemensm/fixseqcla
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/clemensm/mblayouts/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="clemensm/mblayouts"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                clemensm/mblayouts
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/clemensm/perf2/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="clemensm/perf2"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                clemensm/perf2
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/clemensm/perf4b/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="clemensm/perf4b"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                clemensm/perf4b
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/clemensm/perf4/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="clemensm/perf4"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                clemensm/perf4
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/clemensm/profiler/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="clemensm/profiler"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                clemensm/profiler
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/clemensm/quantmultiply2/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="clemensm/quantmultiply2"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                clemensm/quantmultiply2
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/clemensm/runtimeopt/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="clemensm/runtimeopt"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                clemensm/runtimeopt
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/clemensm/s2s/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="clemensm/s2s"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                clemensm/s2s
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/dapisani/Triplet/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="dapisani/Triplet"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                dapisani/Triplet
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/dapisani/center_loss/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="dapisani/center_loss"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                dapisani/center_loss
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/dongyu/addhypertune/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="dongyu/addhypertune"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                dongyu/addhypertune
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/dongyu/htkreaderext/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="dongyu/htkreaderext"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                dongyu/htkreaderext
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/dongyu/writerfix/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="dongyu/writerfix"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                dongyu/writerfix
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/ebarsoum/cleanup/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="ebarsoum/cleanup"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                ebarsoum/cleanup
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/ebarsoum/cntkv2doc/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="ebarsoum/cntkv2doc"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                ebarsoum/cntkv2doc
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/ebarsoum/emotion/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="ebarsoum/emotion"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                ebarsoum/emotion
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/ebarsoum/inceptionv3/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="ebarsoum/inceptionv3"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                ebarsoum/inceptionv3
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/ebarsoum/layerconv/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="ebarsoum/layerconv"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                ebarsoum/layerconv
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/ebarsoum/pixelcnn/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="ebarsoum/pixelcnn"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                ebarsoum/pixelcnn
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/ebarsoum/png16/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="ebarsoum/png16"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                ebarsoum/png16
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/eldak/adaptiveLearningRate/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="eldak/adaptiveLearningRate"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                eldak/adaptiveLearningRate
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/eldak/addingMLFTests/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="eldak/addingMLFTests"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                eldak/addingMLFTests
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/eldak/alignedBundler/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="eldak/alignedBundler"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                eldak/alignedBundler
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/eldak/cesparsebs/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="eldak/cesparsebs"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                eldak/cesparsebs
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/eldak/codeGen/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="eldak/codeGen"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                eldak/codeGen
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/eldak/compositeInMemory/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="eldak/compositeInMemory"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                eldak/compositeInMemory
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/eldak/exposingSequenceIdFromMinibatchData/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="eldak/exposingSequenceIdFromMinibatchData"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                eldak/exposingSequenceIdFromMinibatchData
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/eldak/fixingBatchNorm/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="eldak/fixingBatchNorm"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                eldak/fixingBatchNorm
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/eldak/fixingCrop/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="eldak/fixingCrop"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                eldak/fixingCrop
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/eldak/gpuPrefetchGpuTranspose/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="eldak/gpuPrefetchGpuTranspose"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                eldak/gpuPrefetchGpuTranspose
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/eldak/maxNumSequences/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="eldak/maxNumSequences"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                eldak/maxNumSequences
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/eldak/noRandomizerChunking/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="eldak/noRandomizerChunking"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                eldak/noRandomizerChunking
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/eldak/opencv32/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="eldak/opencv32"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                eldak/opencv32
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/eldak/optimizeO/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="eldak/optimizeO"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                eldak/optimizeO
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/eldak/optimizingMBSize/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="eldak/optimizingMBSize"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                eldak/optimizingMBSize
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/eldak/optimizingSparseRead/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="eldak/optimizingSparseRead"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                eldak/optimizingSparseRead
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/eldak/parallelPacking/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="eldak/parallelPacking"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                eldak/parallelPacking
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/eldak/renamingManual/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="eldak/renamingManual"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                eldak/renamingManual
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/eldak/retryToOpenFile/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="eldak/retryToOpenFile"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                eldak/retryToOpenFile
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/eldak/sequenceKeyLength/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="eldak/sequenceKeyLength"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                eldak/sequenceKeyLength
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/eldak/tempFixInVectorMax/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="eldak/tempFixInVectorMax"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                eldak/tempFixInVectorMax
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/eldak/ud/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="eldak/ud"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                eldak/ud
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/eldak/udRandom/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="eldak/udRandom"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                eldak/udRandom
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/eldak/udRandom2/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="eldak/udRandom2"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                eldak/udRandom2
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/fmegen/eval-internal-test/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="fmegen/eval-internal-test"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                fmegen/eval-internal-test
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/fmegen/eval-vs2015/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="fmegen/eval-vs2015"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                fmegen/eval-vs2015
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/fmegen/eval-vs2015_2/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="fmegen/eval-vs2015_2"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                fmegen/eval-vs2015_2
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/fmegen/linux-debian/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="fmegen/linux-debian"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                fmegen/linux-debian
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/fmegen/vs2015/changing-project-files/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="fmegen/vs2015/changing-project-files"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                fmegen/vs2015/changing-project-files
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/fseide/complexity/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="fseide/complexity"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                fseide/complexity
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/fseide/cudnn5/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="fseide/cudnn5"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                fseide/cudnn5
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/fseide/dynamite/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="fseide/dynamite"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                fseide/dynamite
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/fseide/e2easr/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="fseide/e2easr"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                fseide/e2easr
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/fseide/fixAsMatrix/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="fseide/fixAsMatrix"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                fseide/fixAsMatrix
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/fseide/fixLoad/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="fseide/fixLoad"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                fseide/fixLoad
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/fseide/fixSamples/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="fseide/fixSamples"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                fseide/fixSamples
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/fseide/kdd/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="fseide/kdd"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                fseide/kdd
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/fseide/ndops/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="fseide/ndops"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                fseide/ndops
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/fseide/netlib/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="fseide/netlib"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                fseide/netlib
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/fseide/pathPrefix/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="fseide/pathPrefix"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                fseide/pathPrefix
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/fseide/refactor_nodes/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="fseide/refactor_nodes"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                fseide/refactor_nodes
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/fseide/s2s/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="fseide/s2s"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                fseide/s2s
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/fseide/s2sd/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="fseide/s2sd"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                fseide/s2sd
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/fseide/s2sd5/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="fseide/s2sd5"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                fseide/s2sd5
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/fseide/s2spy/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="fseide/s2spy"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                fseide/s2spy
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/fseide/seqtest/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="fseide/seqtest"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                fseide/seqtest
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/fseide/testlstm/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="fseide/testlstm"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                fseide/testlstm
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/fseide/99/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="fseide/99"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                fseide/99
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/gaizna/cntk_readerless/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="gaizna/cntk_readerless"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                gaizna/cntk_readerless
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/gaizna/eval_import_lib/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="gaizna/eval_import_lib"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                gaizna/eval_import_lib
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/gaizna/writeminibatch_fix/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="gaizna/writeminibatch_fix"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                gaizna/writeminibatch_fix
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/gather_from_target/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="gather_from_target"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                gather_from_target
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/gather_op/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="gather_op"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                gather_op
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/giwye/lightrnn/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="giwye/lightrnn"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                giwye/lightrnn
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/gorand/lstm_experiments/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="gorand/lstm_experiments"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                gorand/lstm_experiments
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/hjl/Char-RNN-Example/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="hjl/Char-RNN-Example"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                hjl/Char-RNN-Example
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/hunter/fast-rcnn/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="hunter/fast-rcnn"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                hunter/fast-rcnn
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/hunter/fast-rcnn2/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="hunter/fast-rcnn2"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                hunter/fast-rcnn2
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/hunter/fix-write/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="hunter/fix-write"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                hunter/fix-write
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/issaca/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="issaca"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                issaca
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/iu_layer/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="iu_layer"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                iu_layer
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/iu.triplet_loss/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="iu.triplet_loss"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                iu.triplet_loss
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/ivanst/profiler_chr/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="ivanst/profiler_chr"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                ivanst/profiler_chr
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/ivanst/profiler_cr/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="ivanst/profiler_cr"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                ivanst/profiler_cr
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/ivanst/profiler_dir/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="ivanst/profiler_dir"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                ivanst/profiler_dir
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/ivanst/profiler_ovr/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="ivanst/profiler_ovr"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                ivanst/profiler_ovr
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/ivanst/profiler/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="ivanst/profiler"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                ivanst/profiler
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/ivanst/profiler2/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="ivanst/profiler2"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                ivanst/profiler2
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/ivanst/profiler3/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="ivanst/profiler3"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                ivanst/profiler3
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/ivanst/profiler5/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="ivanst/profiler5"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                ivanst/profiler5
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/ivanst/profiler_20160510/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="ivanst/profiler_20160510"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                ivanst/profiler_20160510
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/ivanst/profiler_20161108/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="ivanst/profiler_20161108"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                ivanst/profiler_20161108
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/ivanst/temp/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="ivanst/temp"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                ivanst/temp
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/ivanst/temp2/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="ivanst/temp2"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                ivanst/temp2
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/jdroppo/ceiling-mbsize_conttrain/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="jdroppo/ceiling-mbsize_conttrain"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                jdroppo/ceiling-mbsize_conttrain
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/jdroppo/ceiling-mbsize/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="jdroppo/ceiling-mbsize"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                jdroppo/ceiling-mbsize
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/jdroppo/cudnn-rnn-lstm-lfmmi/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="jdroppo/cudnn-rnn-lstm-lfmmi"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                jdroppo/cudnn-rnn-lstm-lfmmi
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/jdroppo/cudnn-rnn-lstm/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="jdroppo/cudnn-rnn-lstm"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                jdroppo/cudnn-rnn-lstm
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/jiajia/DropOutParam2/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="jiajia/DropOutParam2"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                jiajia/DropOutParam2
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/jiajia/IRMetricV2/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="jiajia/IRMetricV2"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                jiajia/IRMetricV2
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/jiajia/IRMetricV4/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="jiajia/IRMetricV4"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                jiajia/IRMetricV4
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/jiajia/cdssm/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="jiajia/cdssm"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                jiajia/cdssm
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/jiajia/cdssm2/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="jiajia/cdssm2"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                jiajia/cdssm2
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/jiajia/ndcgcost/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="jiajia/ndcgcost"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                jiajia/ndcgcost
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/jianblin/CDenseReader/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="jianblin/CDenseReader"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                jianblin/CDenseReader
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/jianblin/CDenseReader1/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="jianblin/CDenseReader1"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                jianblin/CDenseReader1
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/jianluan/test1/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="jianluan/test1"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                jianluan/test1
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/jiashua/CSparsePCReader/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="jiashua/CSparsePCReader"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                jiashua/CSparsePCReader
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/jieli/CTC/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="jieli/CTC"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                jieli/CTC
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/jieli/LFMMI/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="jieli/LFMMI"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                jieli/LFMMI
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/jlie/CSparseDensePCReader/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="jlie/CSparseDensePCReader"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                jlie/CSparseDensePCReader
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/jlie/CSparsePCReader/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="jlie/CSparsePCReader"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                jlie/CSparsePCReader
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/jlie/SparseDensePCReader/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="jlie/SparseDensePCReader"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                jlie/SparseDensePCReader
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/jqian/wip/gloo/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="jqian/wip/gloo"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                jqian/wip/gloo
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/jqian/wip_io/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="jqian/wip_io"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                jqian/wip_io
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/jqian/wip/nccl2.0/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="jqian/wip/nccl2.0"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                jqian/wip/nccl2.0
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/jqian/wip/scale/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="jqian/wip/scale"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                jqian/wip/scale
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/kedeng/FP16/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="kedeng/FP16"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                kedeng/FP16
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/kedeng/boostAsync/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="kedeng/boostAsync"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                kedeng/boostAsync
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/kedeng/cpuPerf/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="kedeng/cpuPerf"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                kedeng/cpuPerf
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/kedeng/fixCudnn/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="kedeng/fixCudnn"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                kedeng/fixCudnn
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/kedeng/fixCudnn2/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="kedeng/fixCudnn2"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                kedeng/fixCudnn2
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/kedeng/nccl2.0/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="kedeng/nccl2.0"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                kedeng/nccl2.0
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/kedeng/perfTest/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="kedeng/perfTest"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                kedeng/perfTest
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/kedeng/profileReader/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="kedeng/profileReader"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                kedeng/profileReader
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/kedeng/testAsyncQueue/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="kedeng/testAsyncQueue"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                kedeng/testAsyncQueue
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/lewlu/inceptionv3-py/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="lewlu/inceptionv3-py"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                lewlu/inceptionv3-py
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/lewlu/optimizer/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="lewlu/optimizer"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                lewlu/optimizer
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/lewlu/rmsprop/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="lewlu/rmsprop"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                lewlu/rmsprop
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/lewlu/ssgd_experiment_wofixedkernel/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="lewlu/ssgd_experiment_wofixedkernel"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                lewlu/ssgd_experiment_wofixedkernel
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/lewlu/subminibatch-test/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="lewlu/subminibatch-test"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                lewlu/subminibatch-test
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/lingfw/adadelta_bs/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="lingfw/adadelta_bs"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                lingfw/adadelta_bs
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/lingfw/conttrain-ceiling-mbsize/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="lingfw/conttrain-ceiling-mbsize"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                lingfw/conttrain-ceiling-mbsize
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/lingfw/lfbmmi-negstream/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="lingfw/lfbmmi-negstream"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                lingfw/lfbmmi-negstream
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/lingfw/lfmmi/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="lingfw/lfmmi"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                lingfw/lfmmi
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/linux-gcc/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="linux-gcc"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                linux-gcc
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/liqun/CSApiShimLayerAndNDShapeFix/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="liqun/CSApiShimLayerAndNDShapeFix"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                liqun/CSApiShimLayerAndNDShapeFix
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/lnunes/add-class-activation-map-example/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="lnunes/add-class-activation-map-example"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                lnunes/add-class-activation-map-example
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/mahilleb/AsyncThrow/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="mahilleb/AsyncThrow"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                mahilleb/AsyncThrow
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/mahilleb/CheckGitVsVs/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="mahilleb/CheckGitVsVs"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                mahilleb/CheckGitVsVs
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/mahilleb/CmakeWip/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="mahilleb/CmakeWip"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                mahilleb/CmakeWip
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/mahilleb/DocTest/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="mahilleb/DocTest"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                mahilleb/DocTest
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/mahilleb/E2eWithTimeTool/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="mahilleb/E2eWithTimeTool"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                mahilleb/E2eWithTimeTool
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/mahilleb/FixCudaProps/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="mahilleb/FixCudaProps"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                mahilleb/FixCudaProps
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/mahilleb/LinuxOobeJupyterTestDevice/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="mahilleb/LinuxOobeJupyterTestDevice"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                mahilleb/LinuxOobeJupyterTestDevice
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/mahilleb/MnistDownload/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="mahilleb/MnistDownload"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                mahilleb/MnistDownload
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/mahilleb/MsbuildExtraCudaVars/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="mahilleb/MsbuildExtraCudaVars"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                mahilleb/MsbuildExtraCudaVars
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/mahilleb/PyLibLocations/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="mahilleb/PyLibLocations"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                mahilleb/PyLibLocations
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/mahilleb/PyLibLocations2/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="mahilleb/PyLibLocations2"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                mahilleb/PyLibLocations2
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/mahilleb/PyScripts/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="mahilleb/PyScripts"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                mahilleb/PyScripts
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/mahilleb/SetupPy/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="mahilleb/SetupPy"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                mahilleb/SetupPy
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/mahilleb/ShareVersion/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="mahilleb/ShareVersion"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                mahilleb/ShareVersion
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/mahilleb/ShelveBlockMultiplier/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="mahilleb/ShelveBlockMultiplier"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                mahilleb/ShelveBlockMultiplier
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/mahilleb/SphinxUpd2/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="mahilleb/SphinxUpd2"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                mahilleb/SphinxUpd2
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/mahilleb/TestDriverIncludeSku/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="mahilleb/TestDriverIncludeSku"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                mahilleb/TestDriverIncludeSku
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/mahilleb/TestDriverNoSix/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="mahilleb/TestDriverNoSix"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                mahilleb/TestDriverNoSix
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/mahilleb/TestDriverNvsmiExit/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="mahilleb/TestDriverNvsmiExit"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                mahilleb/TestDriverNvsmiExit
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/mahilleb/TestDriverTimeoutWip/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="mahilleb/TestDriverTimeoutWip"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                mahilleb/TestDriverTimeoutWip
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/mahilleb/UnitTestEnable/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="mahilleb/UnitTestEnable"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                mahilleb/UnitTestEnable
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/mahilleb/Win1BitSgdSeparateOutDir/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="mahilleb/Win1BitSgdSeparateOutDir"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                mahilleb/Win1BitSgdSeparateOutDir
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/mahilleb/docfxPostprocess/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="mahilleb/docfxPostprocess"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                mahilleb/docfxPostprocess
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/mahilleb/eldak/opencv32/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="mahilleb/eldak/opencv32"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                mahilleb/eldak/opencv32
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/mahilleb/testme/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="mahilleb/testme"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                mahilleb/testme
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/mahilleb/u16/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="mahilleb/u16"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                mahilleb/u16
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/mahilleb/valgrind/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="mahilleb/valgrind"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                mahilleb/valgrind
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/malcolm-cuda-changes/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="malcolm-cuda-changes"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                malcolm-cuda-changes
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/maoyi/fix2/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="maoyi/fix2"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                maoyi/fix2
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/marhamil/jar/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="marhamil/jar"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                marhamil/jar
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/marhamil/java-bindings-backup/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="marhamil/java-bindings-backup"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                marhamil/java-bindings-backup
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/marhamil/java-bindings-one-commit/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="marhamil/java-bindings-one-commit"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                marhamil/java-bindings-one-commit
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/master/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="master"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                master
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/maven-central-jar/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="maven-central-jar"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                maven-central-jar
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/mradmila/dgx1/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="mradmila/dgx1"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                mradmila/dgx1
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/mradmila/modeltime/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="mradmila/modeltime"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                mradmila/modeltime
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/mradmila/nogpu/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="mradmila/nogpu"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                mradmila/nogpu
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/mseltzer/exportdbn_mkl/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="mseltzer/exportdbn_mkl"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                mseltzer/exportdbn_mkl
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/mseltzer/ivectorreader/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="mseltzer/ivectorreader"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                mseltzer/ivectorreader
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/mseltzer/utterancesourcemulti/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="mseltzer/utterancesourcemulti"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                mseltzer/utterancesourcemulti
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/mseltzer/uttreaderfix/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="mseltzer/uttreaderfix"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                mseltzer/uttreaderfix
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/muditj/HTKDeserializerPythonWrapper/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="muditj/HTKDeserializerPythonWrapper"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                muditj/HTKDeserializerPythonWrapper
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/nikmil/acc_agg_fix_2/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="nikmil/acc_agg_fix_2"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                nikmil/acc_agg_fix_2
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/nikmil/cv_best/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="nikmil/cv_best"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                nikmil/cv_best
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/nikosk/bidaf/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="nikosk/bidaf"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                nikosk/bidaf
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/nikosk/clang/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="nikosk/clang"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                nikosk/clang
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/nikosk/cudnn-find-algo-margins/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="nikosk/cudnn-find-algo-margins"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                nikosk/cudnn-find-algo-margins
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/nikosk/lrdisplay/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="nikosk/lrdisplay"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                nikosk/lrdisplay
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/nikosk/nce/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="nikosk/nce"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                nikosk/nce
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/nikosk/rangan_repro/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="nikosk/rangan_repro"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                nikosk/rangan_repro
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/nikosk/tuned_bidaf/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="nikosk/tuned_bidaf"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                nikosk/tuned_bidaf
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/nikosk/zeros_like/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="nikosk/zeros_like"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                nikosk/zeros_like
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/nvidia/dgx1/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="nvidia/dgx1"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                nvidia/dgx1
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/origin/t-titan/attention/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="origin/t-titan/attention"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                origin/t-titan/attention
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/pahua/CDenseReader/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="pahua/CDenseReader"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                pahua/CDenseReader
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/penhe/issue_repro/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="penhe/issue_repro"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                penhe/issue_repro
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/penhe/native_cosdistance/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="penhe/native_cosdistance"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                penhe/native_cosdistance
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/penhe/reasonet_contractive_loss/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="penhe/reasonet_contractive_loss"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                penhe/reasonet_contractive_loss
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/penhe/reasonet_example/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="penhe/reasonet_example"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                penhe/reasonet_example
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/penhe/reasonet_tutorial/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="penhe/reasonet_tutorial"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                penhe/reasonet_tutorial
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/penhe/reasonet/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="penhe/reasonet"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                penhe/reasonet
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/penhe/rsn_issue_repro/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="penhe/rsn_issue_repro"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                penhe/rsn_issue_repro
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/pkranen/arbDim/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="pkranen/arbDim"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                pkranen/arbDim
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/pkranen/bboxRegression/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="pkranen/bboxRegression"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                pkranen/bboxRegression
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/pkranen/bnFrozenFix/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="pkranen/bnFrozenFix"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                pkranen/bnFrozenFix
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/pkranen/cntkrpn/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="pkranen/cntkrpn"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                pkranen/cntkrpn
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/pkranen/csevalFastrcnn/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="pkranen/csevalFastrcnn"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                pkranen/csevalFastrcnn
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/pkranen/mAP/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="pkranen/mAP"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                pkranen/mAP
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/pkranen/mbSize/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="pkranen/mbSize"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                pkranen/mbSize
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/pkranen/odScripts/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="pkranen/odScripts"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                pkranen/odScripts
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/pkranen/rpnTests/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="pkranen/rpnTests"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                pkranen/rpnTests
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/pkranen/vggFrcn/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="pkranen/vggFrcn"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                pkranen/vggFrcn
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/pkranen/yolo/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="pkranen/yolo"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                pkranen/yolo
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/prototypes/arm64-debian/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="prototypes/arm64-debian"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                prototypes/arm64-debian
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/qiwye/asgd-dev/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="qiwye/asgd-dev"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                qiwye/asgd-dev
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/ratsur/find-by-uid/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="ratsur/find-by-uid"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                ratsur/find-by-uid
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/ratsur/jar-rc3/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="ratsur/jar-rc3"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                ratsur/jar-rc3
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/ratsur/java-bindings/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="ratsur/java-bindings"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                ratsur/java-bindings
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/ratsur/java-csharp-parity/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="ratsur/java-csharp-parity"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                ratsur/java-csharp-parity
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/ratsur/java-training/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="ratsur/java-training"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                ratsur/java-training
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/ratsur/maven-central-jar/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="ratsur/maven-central-jar"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                ratsur/maven-central-jar
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/release/2.0.beta2.0/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="release/2.0.beta2.0"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                release/2.0.beta2.0
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/release/2.0.beta3.0/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="release/2.0.beta3.0"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                release/2.0.beta3.0
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/release/2.0.beta4.0/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="release/2.0.beta4.0"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                release/2.0.beta4.0
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/release/2.0.beta5.0/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="release/2.0.beta5.0"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                release/2.0.beta5.0
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/release/2.0.beta6.0/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="release/2.0.beta6.0"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                release/2.0.beta6.0
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/release/2.0.beta7.0/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="release/2.0.beta7.0"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                release/2.0.beta7.0
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/release/2.0.beta8.0/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="release/2.0.beta8.0"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                release/2.0.beta8.0
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/release/2.0.beta9.0/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="release/2.0.beta9.0"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                release/2.0.beta9.0
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/release/2.0.beta10.0/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="release/2.0.beta10.0"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                release/2.0.beta10.0
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/release/2.0.beta11.0/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="release/2.0.beta11.0"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                release/2.0.beta11.0
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/release/2.0.beta12.0/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="release/2.0.beta12.0"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                release/2.0.beta12.0
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/release/2.0.beta15.0/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="release/2.0.beta15.0"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                release/2.0.beta15.0
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/release/2.0.rc1/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="release/2.0.rc1"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                release/2.0.rc1
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/release/2.0.rc2/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="release/2.0.rc2"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                release/2.0.rc2
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/release/2.0.rc3/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="release/2.0.rc3"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                release/2.0.rc3
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/release/2.0/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="release/2.0"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                release/2.0
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/release/2.1/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="release/2.1"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                release/2.1
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/removeSNB/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="removeSNB"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                removeSNB
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/resetbranch/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="resetbranch"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                resetbranch
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/ruizhao/CTC_NDL/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="ruizhao/CTC_NDL"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                ruizhao/CTC_NDL
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/ruizhao/CTC_blankinmlf/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="ruizhao/CTC_blankinmlf"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                ruizhao/CTC_blankinmlf
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/ruizhao/CTC_checkin2/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="ruizhao/CTC_checkin2"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                ruizhao/CTC_checkin2
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/ruizhao/CTC/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="ruizhao/CTC"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                ruizhao/CTC
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/ruizhao/LFMMI/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="ruizhao/LFMMI"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                ruizhao/LFMMI
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/ruizhao/SE/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="ruizhao/SE"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                ruizhao/SE
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/ruizhao/SMBR/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="ruizhao/SMBR"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                ruizhao/SMBR
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/ruizhao/base/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="ruizhao/base"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                ruizhao/base
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/ruizhao/lfmmi-2pass-m15/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="ruizhao/lfmmi-2pass-m15"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                ruizhao/lfmmi-2pass-m15
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/ruizhao/lfmmi-2pass-test/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="ruizhao/lfmmi-2pass-test"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                ruizhao/lfmmi-2pass-test
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/ruizhao/lfmmi-2pass/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="ruizhao/lfmmi-2pass"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                ruizhao/lfmmi-2pass
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/ruzhao/CTC_leftTC/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="ruzhao/CTC_leftTC"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                ruzhao/CTC_leftTC
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/sanjeevm/test_branch/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="sanjeevm/test_branch"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                sanjeevm/test_branch
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/sayanpa/contribmd/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="sayanpa/contribmd"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                sayanpa/contribmd
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/sayanpa/gi2022/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="sayanpa/gi2022"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                sayanpa/gi2022
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/sayanpa/slawek/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="sayanpa/slawek"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                sayanpa/slawek
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/shuzhe/treeps/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="shuzhe/treeps"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                shuzhe/treeps
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/singletonComm/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="singletonComm"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                singletonComm
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/slayton58/divmod/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="slayton58/divmod"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                slayton58/divmod
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/sptiwari/Add_pad/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="sptiwari/Add_pad"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                sptiwari/Add_pad
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/sptiwari/fasterRcnn_NoFastMath/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="sptiwari/fasterRcnn_NoFastMath"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                sptiwari/fasterRcnn_NoFastMath
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/t-alkhar/cntk-board/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="t-alkhar/cntk-board"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                t-alkhar/cntk-board
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/t-alkhar/distributed-sequence-example/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="t-alkhar/distributed-sequence-example"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                t-alkhar/distributed-sequence-example
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/t-alkhar/distributed-testing/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="t-alkhar/distributed-testing"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                t-alkhar/distributed-testing
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/t-alkhar/graph-output-bug-fix/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="t-alkhar/graph-output-bug-fix"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                t-alkhar/graph-output-bug-fix
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/t-alkhar/resnet-example-fix/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="t-alkhar/resnet-example-fix"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                t-alkhar/resnet-example-fix
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/t-alkhar/tensorboard-cntk-connect/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="t-alkhar/tensorboard-cntk-connect"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                t-alkhar/tensorboard-cntk-connect
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/t-alkhar/visualization-tool/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="t-alkhar/visualization-tool"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                t-alkhar/visualization-tool
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/t-ivrodr/refactoring_readers_file_handling/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="t-ivrodr/refactoring_readers_file_handling"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                t-ivrodr/refactoring_readers_file_handling
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/t-ivrodr/setting_py_value_to_deserializer/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="t-ivrodr/setting_py_value_to_deserializer"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                t-ivrodr/setting_py_value_to_deserializer
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/t-ivrodr/using_filewrapper_in_bin_reader/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="t-ivrodr/using_filewrapper_in_bin_reader"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                t-ivrodr/using_filewrapper_in_bin_reader
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/t-makrei/YOLOv2/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="t-makrei/YOLOv2"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                t-makrei/YOLOv2
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/t-makrei/hierClass/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="t-makrei/hierClass"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                t-makrei/hierClass
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/t-makrei/hierarchical_FastRCNN/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="t-makrei/hierarchical_FastRCNN"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                t-makrei/hierarchical_FastRCNN
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/t-makrei/new_yolo/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="t-makrei/new_yolo"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                t-makrei/new_yolo
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/t-mofun/learners_grad_clip_doc/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="t-mofun/learners_grad_clip_doc"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                t-mofun/learners_grad_clip_doc
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/t-mofun/rmspropgraves/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="t-mofun/rmspropgraves"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                t-mofun/rmspropgraves
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/t-tiah/LMNCE-dev/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="t-tiah/LMNCE-dev"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                t-tiah/LMNCE-dev
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/t-tiah/lm/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="t-tiah/lm"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                t-tiah/lm
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/t-tiah/reader-debug/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="t-tiah/reader-debug"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                t-tiah/reader-debug
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/t-tidett/ExtendedCUDAErrors/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="t-tidett/ExtendedCUDAErrors"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                t-tidett/ExtendedCUDAErrors
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/t-tidett/memoryswapping/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="t-tidett/memoryswapping"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                t-tidett/memoryswapping
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/t-tidett/memoryswappingWithFlagToTrue/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="t-tidett/memoryswappingWithFlagToTrue"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                t-tidett/memoryswappingWithFlagToTrue
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/t-tidett/onDemandMemorySwapping/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="t-tidett/onDemandMemorySwapping"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                t-tidett/onDemandMemorySwapping
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/t-titan/attention/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="t-titan/attention"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                t-titan/attention
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/t-titan/shiftread/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="t-titan/shiftread"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                t-titan/shiftread
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/thhoens/NewBinaryReader/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="thhoens/NewBinaryReader"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                thhoens/NewBinaryReader
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/thhoens/atomic-nosync-nop/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="thhoens/atomic-nosync-nop"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                thhoens/atomic-nosync-nop
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/thhoens/atomic-nosync/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="thhoens/atomic-nosync"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                thhoens/atomic-nosync
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/thhoens/atomic/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="thhoens/atomic"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                thhoens/atomic
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/thhoens/basemat/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="thhoens/basemat"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                thhoens/basemat
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/thhoens/binreader/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="thhoens/binreader"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                thhoens/binreader
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/thhoens/bnfix/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="thhoens/bnfix"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                thhoens/bnfix
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/thhoens/cdssm/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="thhoens/cdssm"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                thhoens/cdssm
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/thhoens/cuda7/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="thhoens/cuda7"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                thhoens/cuda7
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/thhoens/distgradfix/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="thhoens/distgradfix"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                thhoens/distgradfix
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/thhoens/mblayout/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="thhoens/mblayout"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                thhoens/mblayout
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/thhoens/multi/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="thhoens/multi"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                thhoens/multi
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/thhoens/multivalid/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="thhoens/multivalid"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                thhoens/multivalid
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/thhoens/nbr/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="thhoens/nbr"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                thhoens/nbr
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/thhoens/nbr2/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="thhoens/nbr2"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                thhoens/nbr2
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/thhoens/newbinreader/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="thhoens/newbinreader"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                thhoens/newbinreader
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/thhoens/nosync/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="thhoens/nosync"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                thhoens/nosync
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/thhoens/packmatrix/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="thhoens/packmatrix"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                thhoens/packmatrix
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/thhoens/pathfix/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="thhoens/pathfix"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                thhoens/pathfix
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/thhoens/perf2/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="thhoens/perf2"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                thhoens/perf2
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/thhoens/perf4/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="thhoens/perf4"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                thhoens/perf4
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/thhoens/reader/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="thhoens/reader"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                thhoens/reader
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/thhoens/readertest/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="thhoens/readertest"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                thhoens/readertest
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/thhoens/s2s/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="thhoens/s2s"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                thhoens/s2s
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/thhoens/seq2seq/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="thhoens/seq2seq"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                thhoens/seq2seq
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/thhoens/sparsematrix/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="thhoens/sparsematrix"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                thhoens/sparsematrix
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/thhoens/sparsemul/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="thhoens/sparsemul"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                thhoens/sparsemul
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/thhoens/syncguard/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="thhoens/syncguard"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                thhoens/syncguard
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/thhoens/test/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="thhoens/test"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                thhoens/test
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/thhoens/unatomic-nosync-nop/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="thhoens/unatomic-nosync-nop"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                thhoens/unatomic-nosync-nop
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/thhoens/unatomic-nosync/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="thhoens/unatomic-nosync"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                thhoens/unatomic-nosync
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/thhoens/unatomic/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="thhoens/unatomic"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                thhoens/unatomic
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/users/fmegen/brainwave-cntk-beta15/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="users/fmegen/brainwave-cntk-beta15"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                users/fmegen/brainwave-cntk-beta15
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/v-lelu/facereader-test/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="v-lelu/facereader-test"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                v-lelu/facereader-test
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/v-lelu/facereader/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="v-lelu/facereader"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                v-lelu/facereader
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/v-lelu/inception-resnet-v2/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="v-lelu/inception-resnet-v2"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                v-lelu/inception-resnet-v2
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/v-lelu/inceptionv4/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="v-lelu/inceptionv4"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                v-lelu/inceptionv4
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/v-niveli/mem_sharing_supressed/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="v-niveli/mem_sharing_supressed"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                v-niveli/mem_sharing_supressed
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/v-niveli/mpi_bcast_with_profiler/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="v-niveli/mpi_bcast_with_profiler"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                v-niveli/mpi_bcast_with_profiler
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/v-yuxgu/crosstalkcaffe/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="v-yuxgu/crosstalkcaffe"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                v-yuxgu/crosstalkcaffe
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/v-yuxgu/model2cntk/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="v-yuxgu/model2cntk"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                v-yuxgu/model2cntk
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/v-yuxgu/psroipooling/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="v-yuxgu/psroipooling"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                v-yuxgu/psroipooling
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/v-yuxgu/rpn/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="v-yuxgu/rpn"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                v-yuxgu/rpn
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/v-zhke/model2cntk_testcase/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="v-zhke/model2cntk_testcase"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                v-zhke/model2cntk_testcase
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/v-zhke/smb_verify/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="v-zhke/smb_verify"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                v-zhke/smb_verify
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/v-zhke/ssgd_experiment/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="v-zhke/ssgd_experiment"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                v-zhke/ssgd_experiment
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/vad/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="vad"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                vad
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/vadimma/AddLogs/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="vadimma/AddLogs"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                vadimma/AddLogs
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/vadimma/AddSaveLogs/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="vadimma/AddSaveLogs"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                vadimma/AddSaveLogs
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/vadimma/CTC_R/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="vadimma/CTC_R"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                vadimma/CTC_R
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/vadimma/CTCDebug/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="vadimma/CTCDebug"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                vadimma/CTCDebug
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/vadimma/CTCNode/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="vadimma/CTCNode"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                vadimma/CTCNode
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/vadimma/Eval_optimizations/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="vadimma/Eval_optimizations"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                vadimma/Eval_optimizations
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/vadimma/ExtendedEvalExample/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="vadimma/ExtendedEvalExample"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                vadimma/ExtendedEvalExample
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/vadimma/FixRepetitiveValueUpdate/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="vadimma/FixRepetitiveValueUpdate"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                vadimma/FixRepetitiveValueUpdate
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/vadimma/ModelVersionLog/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="vadimma/ModelVersionLog"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                vadimma/ModelVersionLog
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/vadimma/MomDouble/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="vadimma/MomDouble"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                vadimma/MomDouble
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/vadimma/MomentumLog/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="vadimma/MomentumLog"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                vadimma/MomentumLog
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/vadimma/QuantizedParameter/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="vadimma/QuantizedParameter"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                vadimma/QuantizedParameter
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/vadimma/RemoveCodeDuplication/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="vadimma/RemoveCodeDuplication"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                vadimma/RemoveCodeDuplication
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/vadimma/ctc_ndl/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="vadimma/ctc_ndl"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                vadimma/ctc_ndl
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/vadimma/evaluateStreamMode/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="vadimma/evaluateStreamMode"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                vadimma/evaluateStreamMode
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/vadimma/mlfreader/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="vadimma/mlfreader"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                vadimma/mlfreader
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/vadimma/reader_c/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="vadimma/reader_c"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                vadimma/reader_c
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/vadimma/updateDoc/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="vadimma/updateDoc"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                vadimma/updateDoc
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/vlivan/large-minibatches/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="vlivan/large-minibatches"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                vlivan/large-minibatches
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/vlivan/linux-gpu-locking/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="vlivan/linux-gpu-locking"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                vlivan/linux-gpu-locking
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/vlivan/linux-reader-catchup/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="vlivan/linux-reader-catchup"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                vlivan/linux-reader-catchup
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/vlivan/linux-reader-catchup2/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="vlivan/linux-reader-catchup2"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                vlivan/linux-reader-catchup2
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/vlivan/test-master/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="vlivan/test-master"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                vlivan/test-master
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/wdarling/axisdoc/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="wdarling/axisdoc"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                wdarling/axisdoc
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/wdarling/lstmaux/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="wdarling/lstmaux"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                wdarling/lstmaux
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/wdarling/pythongru/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="wdarling/pythongru"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                wdarling/pythongru
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/wdarling/tutorial/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="wdarling/tutorial"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                wdarling/tutorial
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/wdarling/update_fastrcnn/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="wdarling/update_fastrcnn"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                wdarling/update_fastrcnn
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/wdarling/updatezeroes/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="wdarling/updatezeroes"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                wdarling/updatezeroes
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/weixi/autolr/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="weixi/autolr"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                weixi/autolr
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/weixi/conttrain/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="weixi/conttrain"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                weixi/conttrain
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/weixi/lfmmi-2-lstm/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="weixi/lfmmi-2-lstm"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                weixi/lfmmi-2-lstm
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/weixi/lfmmi-2pass-cr/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="weixi/lfmmi-2pass-cr"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                weixi/lfmmi-2pass-cr
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/weixi/lfmmi-2pass-test/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="weixi/lfmmi-2pass-test"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                weixi/lfmmi-2pass-test
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/weixi/lfmmi-2pass/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="weixi/lfmmi-2pass"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                weixi/lfmmi-2pass
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/weixi/lfmmi-conttrain-neg/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="weixi/lfmmi-conttrain-neg"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                weixi/lfmmi-conttrain-neg
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/weixi/lfmmi-conttrain-wlstm/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="weixi/lfmmi-conttrain-wlstm"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                weixi/lfmmi-conttrain-wlstm
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/weixi/lfmmi-conttrain/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="weixi/lfmmi-conttrain"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                weixi/lfmmi-conttrain
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/weixi/lfmmi-debug/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="weixi/lfmmi-debug"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                weixi/lfmmi-debug
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/weixi/lfmmi-memzip/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="weixi/lfmmi-memzip"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                weixi/lfmmi-memzip
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/weixi/lfmmi-new/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="weixi/lfmmi-new"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                weixi/lfmmi-new
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/weixi/lfmmi/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="weixi/lfmmi"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                weixi/lfmmi
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/weixi/oldbuild/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="weixi/oldbuild"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                weixi/oldbuild
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/weixi/pcv/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="weixi/pcv"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                weixi/pcv
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/weixi/waynecoding/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="weixi/waynecoding"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                weixi/waynecoding
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/wilrich/cntkv2Cython/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="wilrich/cntkv2Cython"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                wilrich/cntkv2Cython
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/wilrich/cntkv2Swig/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="wilrich/cntkv2Swig"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                wilrich/cntkv2Swig
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/wolfma/checkdep/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="wolfma/checkdep"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                wolfma/checkdep
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/wolfma/instsplat/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="wolfma/instsplat"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                wolfma/instsplat
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/xwang/tts-lace/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="xwang/tts-lace"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                xwang/tts-lace
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/yingsh/OrderedCEWithSM/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="yingsh/OrderedCEWithSM"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                yingsh/OrderedCEWithSM
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/yuqing/HDF5Reader/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="yuqing/HDF5Reader"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                yuqing/HDF5Reader
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/yuqtang/AugmentMinibatchSourceAPI/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="yuqtang/AugmentMinibatchSourceAPI"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                yuqtang/AugmentMinibatchSourceAPI
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/yuqtang/RateWithReferenceMBSize/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="yuqtang/RateWithReferenceMBSize"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                yuqtang/RateWithReferenceMBSize
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/yuqtang/ReduceOptOverMultiAxis/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="yuqtang/ReduceOptOverMultiAxis"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                yuqtang/ReduceOptOverMultiAxis
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/yuqtang/ReductionMultiAxisStage/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="yuqtang/ReductionMultiAxisStage"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                yuqtang/ReductionMultiAxisStage
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/yuqtang/RefactorLearnerAPI/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="yuqtang/RefactorLearnerAPI"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                yuqtang/RefactorLearnerAPI
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/yuqtang/RefactorUnitType/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="yuqtang/RefactorUnitType"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                yuqtang/RefactorUnitType
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/zhal/randomSeedOffset/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="zhal/randomSeedOffset"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                zhal/randomSeedOffset
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/zhouwang/compositereader-determinismus/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="zhouwang/compositereader-determinismus"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                zhouwang/compositereader-determinismus
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/zhouwang/cseval-unittest/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="zhouwang/cseval-unittest"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                zhouwang/cseval-unittest
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/zhouwang/eval-cppexample/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="zhouwang/eval-cppexample"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                zhouwang/eval-cppexample
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/zhouwang/eval-pythonmodel/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="zhouwang/eval-pythonmodel"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                zhouwang/eval-pythonmodel
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/zhouwang/fix-v2localstatic/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="zhouwang/fix-v2localstatic"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                zhouwang/fix-v2localstatic
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/zhouwang/github1921/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="zhouwang/github1921"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                zhouwang/github1921
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/zhouwang/keran-issue/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="zhouwang/keran-issue"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                zhouwang/keran-issue
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/zhouwang/kevinpan-memoryissue/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="zhouwang/kevinpan-memoryissue"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                zhouwang/kevinpan-memoryissue
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/zhouwang/pr2205/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="zhouwang/pr2205"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                zhouwang/pr2205
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/zhouwang/renbo-issue/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="zhouwang/renbo-issue"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                zhouwang/renbo-issue
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/zhouwang/tlc/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="zhouwang/tlc"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                zhouwang/tlc
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/zhouwang/valueptr-issue/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="zhouwang/valueptr-issue"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                zhouwang/valueptr-issue
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/zhouwang/valueptr-issue2/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="zhouwang/valueptr-issue2"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                zhouwang/valueptr-issue2
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/zhujie/SpDsRowStack_Maxpooling/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="zhujie/SpDsRowStack_Maxpooling"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                zhujie/SpDsRowStack_Maxpooling
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/zhujie/SpDsRowStack/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="zhujie/SpDsRowStack"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                zhujie/SpDsRowStack
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/zhujie/bianry_step_test/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="zhujie/bianry_step_test"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                zhujie/bianry_step_test
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/zhujie/binary_step_continuation/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="zhujie/binary_step_continuation"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                zhujie/binary_step_continuation
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/zhujie/cdssm2_binary/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="zhujie/cdssm2_binary"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                zhujie/cdssm2_binary
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/zhujie/deterministic-st-tanh/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="zhujie/deterministic-st-tanh"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                zhujie/deterministic-st-tanh
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/zhujie/matmul-baseline-readerfix/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="zhujie/matmul-baseline-readerfix"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                zhujie/matmul-baseline-readerfix
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/zhujie/matmul-baseline/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="zhujie/matmul-baseline"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                zhujie/matmul-baseline
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/zhujie/matmul-cusparse/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="zhujie/matmul-cusparse"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                zhujie/matmul-cusparse
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/zhujie/matmul-test/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="zhujie/matmul-test"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                zhujie/matmul-test
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/zhujie/matmul-update/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="zhujie/matmul-update"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                zhujie/matmul-update
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/zhujie/matmul/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="zhujie/matmul"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                zhujie/matmul
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/zhujie/sewt-densebase/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="zhujie/sewt-densebase"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                zhujie/sewt-densebase
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/zhujie/sewt_test/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="zhujie/sewt_test"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                zhujie/sewt_test
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/zhujie/sewt/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="zhujie/sewt"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                zhujie/sewt
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/zhujie/sparseandx/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="zhujie/sparseandx"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                zhujie/sparseandx
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/zhujie/sparsemulandx/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="zhujie/sparsemulandx"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                zhujie/sparsemulandx
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/zhujie/sparserowstack/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="zhujie/sparserowstack"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                zhujie/sparserowstack
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/zhujie/stochastic-st-dropout/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="zhujie/stochastic-st-dropout"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                zhujie/stochastic-st-dropout
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/zhujie/stochastic-st-signp1/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="zhujie/stochastic-st-signp1"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                zhujie/stochastic-st-signp1
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/zhujie/stochastic-st-tanh/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="zhujie/stochastic-st-tanh"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                zhujie/stochastic-st-tanh
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/zhujie/stochastic-st/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="zhujie/stochastic-st"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                zhujie/stochastic-st
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/zhujie/treenode-cleaf/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="zhujie/treenode-cleaf"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                zhujie/treenode-cleaf
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/zhujie/treenode/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="zhujie/treenode"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                zhujie/treenode
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/zhujie/vecmaxpooling/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="zhujie/vecmaxpooling"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                zhujie/vecmaxpooling
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/Microsoft/CNTK/blob/zsoltm/profiler/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
               data-name="zsoltm/profiler"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                zsoltm/profiler
              </span>
            </a>
        </div>

          <div class="select-menu-no-results">Nothing to show</div>
      </div>

      <div class="select-menu-list select-menu-tab-bucket js-select-menu-tab-bucket" data-tab-filter="tags">
        <div data-filterable-for="context-commitish-filter-field" data-filterable-type="substring">


            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/Microsoft/CNTK/tree/v2.1/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
              data-name="v2.1"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target" title="v2.1">
                v2.1
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open selected"
              href="/Microsoft/CNTK/tree/v2.0/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
              data-name="v2.0"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target" title="v2.0">
                v2.0
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/Microsoft/CNTK/tree/v2.0.rc3/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
              data-name="v2.0.rc3"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target" title="v2.0.rc3">
                v2.0.rc3
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/Microsoft/CNTK/tree/v2.0.rc2/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
              data-name="v2.0.rc2"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target" title="v2.0.rc2">
                v2.0.rc2
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/Microsoft/CNTK/tree/v2.0.rc1/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
              data-name="v2.0.rc1"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target" title="v2.0.rc1">
                v2.0.rc1
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/Microsoft/CNTK/tree/v2.0.beta15.0/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
              data-name="v2.0.beta15.0"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target" title="v2.0.beta15.0">
                v2.0.beta15.0
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/Microsoft/CNTK/tree/v2.0.beta12.0/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
              data-name="v2.0.beta12.0"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target" title="v2.0.beta12.0">
                v2.0.beta12.0
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/Microsoft/CNTK/tree/v2.0.beta11.0/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
              data-name="v2.0.beta11.0"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target" title="v2.0.beta11.0">
                v2.0.beta11.0
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/Microsoft/CNTK/tree/v2.0.beta10.0/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
              data-name="v2.0.beta10.0"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target" title="v2.0.beta10.0">
                v2.0.beta10.0
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/Microsoft/CNTK/tree/v2.0.beta9.0/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
              data-name="v2.0.beta9.0"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target" title="v2.0.beta9.0">
                v2.0.beta9.0
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/Microsoft/CNTK/tree/v2.0.beta8.0/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
              data-name="v2.0.beta8.0"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target" title="v2.0.beta8.0">
                v2.0.beta8.0
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/Microsoft/CNTK/tree/v2.0.beta7.0/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
              data-name="v2.0.beta7.0"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target" title="v2.0.beta7.0">
                v2.0.beta7.0
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/Microsoft/CNTK/tree/v2.0.beta6.0/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
              data-name="v2.0.beta6.0"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target" title="v2.0.beta6.0">
                v2.0.beta6.0
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/Microsoft/CNTK/tree/v2.0.beta5.0/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
              data-name="v2.0.beta5.0"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target" title="v2.0.beta5.0">
                v2.0.beta5.0
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/Microsoft/CNTK/tree/v2.0.beta4.0/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
              data-name="v2.0.beta4.0"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target" title="v2.0.beta4.0">
                v2.0.beta4.0
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/Microsoft/CNTK/tree/v2.0.beta3.0/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
              data-name="v2.0.beta3.0"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target" title="v2.0.beta3.0">
                v2.0.beta3.0
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/Microsoft/CNTK/tree/v2.0.beta2.0/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
              data-name="v2.0.beta2.0"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target" title="v2.0.beta2.0">
                v2.0.beta2.0
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/Microsoft/CNTK/tree/v2.0.beta1.0/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
              data-name="v2.0.beta1.0"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target" title="v2.0.beta1.0">
                v2.0.beta1.0
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/Microsoft/CNTK/tree/v2.alpha4/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
              data-name="v2.alpha4"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target" title="v2.alpha4">
                v2.alpha4
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/Microsoft/CNTK/tree/v1.7.2/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
              data-name="v1.7.2"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target" title="v1.7.2">
                v1.7.2
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/Microsoft/CNTK/tree/v1.7.1/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
              data-name="v1.7.1"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target" title="v1.7.1">
                v1.7.1
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/Microsoft/CNTK/tree/v1.7/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
              data-name="v1.7"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target" title="v1.7">
                v1.7
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/Microsoft/CNTK/tree/v1.6/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
              data-name="v1.6"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target" title="v1.6">
                v1.6
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/Microsoft/CNTK/tree/v1.5/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
              data-name="v1.5"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target" title="v1.5">
                v1.5
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/Microsoft/CNTK/tree/v1.1/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
              data-name="v1.1"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target" title="v1.1">
                v1.1
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/Microsoft/CNTK/tree/r2016-02-08/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
              data-name="r2016-02-08"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target" title="r2016-02-08">
                r2016-02-08
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/Microsoft/CNTK/tree/r2016-01-26/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
              data-name="r2016-01-26"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target" title="r2016-01-26">
                r2016-01-26
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/Microsoft/CNTK/tree/feature/CNTKCustomMKL/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
              data-name="feature/CNTKCustomMKL"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target" title="feature/CNTKCustomMKL">
                feature/CNTKCustomMKL
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/Microsoft/CNTK/tree/events/gtc201705/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
              data-name="events/gtc201705"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target" title="events/gtc201705">
                events/gtc201705
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/Microsoft/CNTK/tree/2015-12-08/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl"
              data-name="2015-12-08"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target" title="2015-12-08">
                2015-12-08
              </span>
            </a>
        </div>

        <div class="select-menu-no-results">Nothing to show</div>
      </div>

    </div>
  </div>
</div>

    <div class="BtnGroup float-right">
      <a href="/Microsoft/CNTK/find/v2.0"
            class="js-pjax-capture-input btn btn-sm BtnGroup-item"
            data-pjax
            data-hotkey="t">
        Find file
      </a>
      <button aria-label="Copy file path to clipboard" class="js-zeroclipboard btn btn-sm BtnGroup-item tooltipped tooltipped-s" data-copied-hint="Copied!" type="button">Copy path</button>
    </div>
    <div class="breadcrumb js-zeroclipboard-target">
      <span class="repo-root js-repo-root"><span class="js-path-segment"><a href="/Microsoft/CNTK/tree/v2.0"><span>CNTK</span></a></span></span><span class="separator">/</span><span class="js-path-segment"><a href="/Microsoft/CNTK/tree/v2.0/Examples"><span>Examples</span></a></span><span class="separator">/</span><span class="js-path-segment"><a href="/Microsoft/CNTK/tree/v2.0/Examples/LanguageUnderstanding"><span>LanguageUnderstanding</span></a></span><span class="separator">/</span><span class="js-path-segment"><a href="/Microsoft/CNTK/tree/v2.0/Examples/LanguageUnderstanding/ATIS"><span>ATIS</span></a></span><span class="separator">/</span><span class="js-path-segment"><a href="/Microsoft/CNTK/tree/v2.0/Examples/LanguageUnderstanding/ATIS/BrainScript"><span>BrainScript</span></a></span><span class="separator">/</span><strong class="final-path">slots.wl</strong>
    </div>
  </div>


  <include-fragment class="commit-tease" src="/Microsoft/CNTK/contributors/v2.0/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl">
    <div>
      Fetching contributors&hellip;
    </div>

    <div class="commit-tease-contributors">
      <img alt="" class="loader-loading float-left" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32-EAF2F5.gif" width="16" />
      <span class="loader-error">Cannot retrieve contributors at this time</span>
    </div>
</include-fragment>
  <div class="file">
    <div class="file-header">
  <div class="file-actions">

    <div class="BtnGroup">
      <a href="/Microsoft/CNTK/raw/v2.0/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl" class="btn btn-sm BtnGroup-item" id="raw-url">Raw</a>
        <a href="/Microsoft/CNTK/blame/v2.0/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl" class="btn btn-sm js-update-url-with-hash BtnGroup-item" data-hotkey="b">Blame</a>
      <a href="/Microsoft/CNTK/commits/v2.0/Examples/LanguageUnderstanding/ATIS/BrainScript/slots.wl" class="btn btn-sm BtnGroup-item" rel="nofollow">History</a>
    </div>

        <button class="btn-octicon disabled tooltipped tooltipped-nw"
           type="button"
           disabled
           aria-label="You must be on a branch to open this file in GitHub Desktop">
            <svg aria-hidden="true" class="octicon octicon-device-desktop" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M15 2H1c-.55 0-1 .45-1 1v9c0 .55.45 1 1 1h5.34c-.25.61-.86 1.39-2.34 2h8c-1.48-.61-2.09-1.39-2.34-2H15c.55 0 1-.45 1-1V3c0-.55-.45-1-1-1zm0 9H1V3h14v8z"/></svg>
        </button>

        <button type="button" class="btn-octicon disabled tooltipped tooltipped-nw"
          aria-label="You must be on a branch to make or propose changes to this file">
          <svg aria-hidden="true" class="octicon octicon-pencil" height="16" version="1.1" viewBox="0 0 14 16" width="14"><path fill-rule="evenodd" d="M0 12v3h3l8-8-3-3-8 8zm3 2H1v-2h1v1h1v1zm10.3-9.3L12 6 9 3l1.3-1.3a.996.996 0 0 1 1.41 0l1.59 1.59c.39.39.39 1.02 0 1.41z"/></svg>
        </button>
        <button type="button" class="btn-octicon btn-octicon-danger disabled tooltipped tooltipped-nw"
          aria-label="You must be on a branch to make or propose changes to this file">
          <svg aria-hidden="true" class="octicon octicon-trashcan" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M11 2H9c0-.55-.45-1-1-1H5c-.55 0-1 .45-1 1H2c-.55 0-1 .45-1 1v1c0 .55.45 1 1 1v9c0 .55.45 1 1 1h7c.55 0 1-.45 1-1V5c.55 0 1-.45 1-1V3c0-.55-.45-1-1-1zm-1 12H3V5h1v8h1V5h1v8h1V5h1v8h1V5h1v9zm1-10H2V3h9v1z"/></svg>
        </button>
  </div>

  <div class="file-info">
      130 lines (129 sloc)
      <span class="file-info-divider"></span>
    2.39 KB
  </div>
</div>

    

  <div itemprop="text" class="blob-wrapper data type-mathematica">
      <table class="highlight tab-size js-file-line-container" data-tab-size="8">
      <tr>
        <td id="L1" class="blob-num js-line-number" data-line-number="1"></td>
        <td id="LC1" class="blob-code blob-code-inner js-file-line"><span class="pl-v">B</span><span class="pl-k">-</span><span class="pl-v">aircraft_</span><span class="pl-v">code</span></td>
      </tr>
      <tr>
        <td id="L2" class="blob-num js-line-number" data-line-number="2"></td>
        <td id="LC2" class="blob-code blob-code-inner js-file-line"><span class="pl-v">B</span><span class="pl-k">-</span><span class="pl-v">airline_</span><span class="pl-v">code</span></td>
      </tr>
      <tr>
        <td id="L3" class="blob-num js-line-number" data-line-number="3"></td>
        <td id="LC3" class="blob-code blob-code-inner js-file-line"><span class="pl-v">B</span><span class="pl-k">-</span><span class="pl-v">airline_</span><span class="pl-v">name</span></td>
      </tr>
      <tr>
        <td id="L4" class="blob-num js-line-number" data-line-number="4"></td>
        <td id="LC4" class="blob-code blob-code-inner js-file-line"><span class="pl-v">B</span><span class="pl-k">-</span><span class="pl-v">airport_</span><span class="pl-v">code</span></td>
      </tr>
      <tr>
        <td id="L5" class="blob-num js-line-number" data-line-number="5"></td>
        <td id="LC5" class="blob-code blob-code-inner js-file-line"><span class="pl-v">B</span><span class="pl-k">-</span><span class="pl-v">airport_</span><span class="pl-v">name</span></td>
      </tr>
      <tr>
        <td id="L6" class="blob-num js-line-number" data-line-number="6"></td>
        <td id="LC6" class="blob-code blob-code-inner js-file-line"><span class="pl-v">B</span><span class="pl-k">-</span><span class="pl-v">arrive_</span><span class="pl-v">date</span>.<span class="pl-v">date_</span><span class="pl-v">relative</span></td>
      </tr>
      <tr>
        <td id="L7" class="blob-num js-line-number" data-line-number="7"></td>
        <td id="LC7" class="blob-code blob-code-inner js-file-line"><span class="pl-v">B</span><span class="pl-k">-</span><span class="pl-v">arrive_</span><span class="pl-v">date</span>.<span class="pl-v">day_</span><span class="pl-v">name</span></td>
      </tr>
      <tr>
        <td id="L8" class="blob-num js-line-number" data-line-number="8"></td>
        <td id="LC8" class="blob-code blob-code-inner js-file-line"><span class="pl-v">B</span><span class="pl-k">-</span><span class="pl-v">arrive_</span><span class="pl-v">date</span>.<span class="pl-v">day_</span><span class="pl-v">number</span></td>
      </tr>
      <tr>
        <td id="L9" class="blob-num js-line-number" data-line-number="9"></td>
        <td id="LC9" class="blob-code blob-code-inner js-file-line"><span class="pl-v">B</span><span class="pl-k">-</span><span class="pl-v">arrive_</span><span class="pl-v">date</span>.<span class="pl-v">month_</span><span class="pl-v">name</span></td>
      </tr>
      <tr>
        <td id="L10" class="blob-num js-line-number" data-line-number="10"></td>
        <td id="LC10" class="blob-code blob-code-inner js-file-line"><span class="pl-v">B</span><span class="pl-k">-</span><span class="pl-v">arrive_</span><span class="pl-v">date</span>.<span class="pl-v">today_</span><span class="pl-v">relative</span></td>
      </tr>
      <tr>
        <td id="L11" class="blob-num js-line-number" data-line-number="11"></td>
        <td id="LC11" class="blob-code blob-code-inner js-file-line"><span class="pl-v">B</span><span class="pl-k">-</span><span class="pl-v">arrive_</span><span class="pl-v">time</span>.<span class="pl-v">end_</span><span class="pl-v">time</span></td>
      </tr>
      <tr>
        <td id="L12" class="blob-num js-line-number" data-line-number="12"></td>
        <td id="LC12" class="blob-code blob-code-inner js-file-line"><span class="pl-v">B</span><span class="pl-k">-</span><span class="pl-v">arrive_</span><span class="pl-v">time</span>.<span class="pl-v">period_</span><span class="pl-v">mod</span></td>
      </tr>
      <tr>
        <td id="L13" class="blob-num js-line-number" data-line-number="13"></td>
        <td id="LC13" class="blob-code blob-code-inner js-file-line"><span class="pl-v">B</span><span class="pl-k">-</span><span class="pl-v">arrive_</span><span class="pl-v">time</span>.<span class="pl-v">period_of_</span><span class="pl-v">day</span></td>
      </tr>
      <tr>
        <td id="L14" class="blob-num js-line-number" data-line-number="14"></td>
        <td id="LC14" class="blob-code blob-code-inner js-file-line"><span class="pl-v">B</span><span class="pl-k">-</span><span class="pl-v">arrive_</span><span class="pl-v">time</span>.<span class="pl-v">start_</span><span class="pl-v">time</span></td>
      </tr>
      <tr>
        <td id="L15" class="blob-num js-line-number" data-line-number="15"></td>
        <td id="LC15" class="blob-code blob-code-inner js-file-line"><span class="pl-v">B</span><span class="pl-k">-</span><span class="pl-v">arrive_</span><span class="pl-v">time</span>.<span class="pl-v">time</span></td>
      </tr>
      <tr>
        <td id="L16" class="blob-num js-line-number" data-line-number="16"></td>
        <td id="LC16" class="blob-code blob-code-inner js-file-line"><span class="pl-v">B</span><span class="pl-k">-</span><span class="pl-v">arrive_</span><span class="pl-v">time</span>.<span class="pl-v">time_</span><span class="pl-v">relative</span></td>
      </tr>
      <tr>
        <td id="L17" class="blob-num js-line-number" data-line-number="17"></td>
        <td id="LC17" class="blob-code blob-code-inner js-file-line"><span class="pl-v">B</span><span class="pl-k">-</span><span class="pl-v">booking_</span><span class="pl-v">class</span></td>
      </tr>
      <tr>
        <td id="L18" class="blob-num js-line-number" data-line-number="18"></td>
        <td id="LC18" class="blob-code blob-code-inner js-file-line"><span class="pl-v">B</span><span class="pl-k">-</span><span class="pl-v">city_</span><span class="pl-v">name</span></td>
      </tr>
      <tr>
        <td id="L19" class="blob-num js-line-number" data-line-number="19"></td>
        <td id="LC19" class="blob-code blob-code-inner js-file-line"><span class="pl-v">B</span><span class="pl-k">-</span><span class="pl-v">class_</span><span class="pl-v">type</span></td>
      </tr>
      <tr>
        <td id="L20" class="blob-num js-line-number" data-line-number="20"></td>
        <td id="LC20" class="blob-code blob-code-inner js-file-line"><span class="pl-v">B</span><span class="pl-k">-</span><span class="pl-v">compartment</span></td>
      </tr>
      <tr>
        <td id="L21" class="blob-num js-line-number" data-line-number="21"></td>
        <td id="LC21" class="blob-code blob-code-inner js-file-line"><span class="pl-v">B</span><span class="pl-k">-</span><span class="pl-v">connect</span></td>
      </tr>
      <tr>
        <td id="L22" class="blob-num js-line-number" data-line-number="22"></td>
        <td id="LC22" class="blob-code blob-code-inner js-file-line"><span class="pl-v">B</span><span class="pl-k">-</span><span class="pl-v">cost_</span><span class="pl-v">relative</span></td>
      </tr>
      <tr>
        <td id="L23" class="blob-num js-line-number" data-line-number="23"></td>
        <td id="LC23" class="blob-code blob-code-inner js-file-line"><span class="pl-v">B</span><span class="pl-k">-</span><span class="pl-v">day_</span><span class="pl-v">name</span></td>
      </tr>
      <tr>
        <td id="L24" class="blob-num js-line-number" data-line-number="24"></td>
        <td id="LC24" class="blob-code blob-code-inner js-file-line"><span class="pl-v">B</span><span class="pl-k">-</span><span class="pl-v">day_</span><span class="pl-v">number</span></td>
      </tr>
      <tr>
        <td id="L25" class="blob-num js-line-number" data-line-number="25"></td>
        <td id="LC25" class="blob-code blob-code-inner js-file-line"><span class="pl-v">B</span><span class="pl-k">-</span><span class="pl-v">days_</span><span class="pl-v">code</span></td>
      </tr>
      <tr>
        <td id="L26" class="blob-num js-line-number" data-line-number="26"></td>
        <td id="LC26" class="blob-code blob-code-inner js-file-line"><span class="pl-v">B</span><span class="pl-k">-</span><span class="pl-v">depart_</span><span class="pl-v">date</span>.<span class="pl-v">date_</span><span class="pl-v">relative</span></td>
      </tr>
      <tr>
        <td id="L27" class="blob-num js-line-number" data-line-number="27"></td>
        <td id="LC27" class="blob-code blob-code-inner js-file-line"><span class="pl-v">B</span><span class="pl-k">-</span><span class="pl-v">depart_</span><span class="pl-v">date</span>.<span class="pl-v">day_</span><span class="pl-v">name</span></td>
      </tr>
      <tr>
        <td id="L28" class="blob-num js-line-number" data-line-number="28"></td>
        <td id="LC28" class="blob-code blob-code-inner js-file-line"><span class="pl-v">B</span><span class="pl-k">-</span><span class="pl-v">depart_</span><span class="pl-v">date</span>.<span class="pl-v">day_</span><span class="pl-v">number</span></td>
      </tr>
      <tr>
        <td id="L29" class="blob-num js-line-number" data-line-number="29"></td>
        <td id="LC29" class="blob-code blob-code-inner js-file-line"><span class="pl-v">B</span><span class="pl-k">-</span><span class="pl-v">depart_</span><span class="pl-v">date</span>.<span class="pl-v">month_</span><span class="pl-v">name</span></td>
      </tr>
      <tr>
        <td id="L30" class="blob-num js-line-number" data-line-number="30"></td>
        <td id="LC30" class="blob-code blob-code-inner js-file-line"><span class="pl-v">B</span><span class="pl-k">-</span><span class="pl-v">depart_</span><span class="pl-v">date</span>.<span class="pl-v">today_</span><span class="pl-v">relative</span></td>
      </tr>
      <tr>
        <td id="L31" class="blob-num js-line-number" data-line-number="31"></td>
        <td id="LC31" class="blob-code blob-code-inner js-file-line"><span class="pl-v">B</span><span class="pl-k">-</span><span class="pl-v">depart_</span><span class="pl-v">date</span>.<span class="pl-v">year</span></td>
      </tr>
      <tr>
        <td id="L32" class="blob-num js-line-number" data-line-number="32"></td>
        <td id="LC32" class="blob-code blob-code-inner js-file-line"><span class="pl-v">B</span><span class="pl-k">-</span><span class="pl-v">depart_</span><span class="pl-v">time</span>.<span class="pl-v">end_</span><span class="pl-v">time</span></td>
      </tr>
      <tr>
        <td id="L33" class="blob-num js-line-number" data-line-number="33"></td>
        <td id="LC33" class="blob-code blob-code-inner js-file-line"><span class="pl-v">B</span><span class="pl-k">-</span><span class="pl-v">depart_</span><span class="pl-v">time</span>.<span class="pl-v">period_</span><span class="pl-v">mod</span></td>
      </tr>
      <tr>
        <td id="L34" class="blob-num js-line-number" data-line-number="34"></td>
        <td id="LC34" class="blob-code blob-code-inner js-file-line"><span class="pl-v">B</span><span class="pl-k">-</span><span class="pl-v">depart_</span><span class="pl-v">time</span>.<span class="pl-v">period_of_</span><span class="pl-v">day</span></td>
      </tr>
      <tr>
        <td id="L35" class="blob-num js-line-number" data-line-number="35"></td>
        <td id="LC35" class="blob-code blob-code-inner js-file-line"><span class="pl-v">B</span><span class="pl-k">-</span><span class="pl-v">depart_</span><span class="pl-v">time</span>.<span class="pl-v">start_</span><span class="pl-v">time</span></td>
      </tr>
      <tr>
        <td id="L36" class="blob-num js-line-number" data-line-number="36"></td>
        <td id="LC36" class="blob-code blob-code-inner js-file-line"><span class="pl-v">B</span><span class="pl-k">-</span><span class="pl-v">depart_</span><span class="pl-v">time</span>.<span class="pl-v">time</span></td>
      </tr>
      <tr>
        <td id="L37" class="blob-num js-line-number" data-line-number="37"></td>
        <td id="LC37" class="blob-code blob-code-inner js-file-line"><span class="pl-v">B</span><span class="pl-k">-</span><span class="pl-v">depart_</span><span class="pl-v">time</span>.<span class="pl-v">time_</span><span class="pl-v">relative</span></td>
      </tr>
      <tr>
        <td id="L38" class="blob-num js-line-number" data-line-number="38"></td>
        <td id="LC38" class="blob-code blob-code-inner js-file-line"><span class="pl-v">B</span><span class="pl-k">-</span><span class="pl-v">economy</span></td>
      </tr>
      <tr>
        <td id="L39" class="blob-num js-line-number" data-line-number="39"></td>
        <td id="LC39" class="blob-code blob-code-inner js-file-line"><span class="pl-v">B</span><span class="pl-k">-</span><span class="pl-v">fare_</span><span class="pl-v">amount</span></td>
      </tr>
      <tr>
        <td id="L40" class="blob-num js-line-number" data-line-number="40"></td>
        <td id="LC40" class="blob-code blob-code-inner js-file-line"><span class="pl-v">B</span><span class="pl-k">-</span><span class="pl-v">fare_basis_</span><span class="pl-v">code</span></td>
      </tr>
      <tr>
        <td id="L41" class="blob-num js-line-number" data-line-number="41"></td>
        <td id="LC41" class="blob-code blob-code-inner js-file-line"><span class="pl-v">B</span><span class="pl-k">-</span><span class="pl-v">flight</span></td>
      </tr>
      <tr>
        <td id="L42" class="blob-num js-line-number" data-line-number="42"></td>
        <td id="LC42" class="blob-code blob-code-inner js-file-line"><span class="pl-v">B</span><span class="pl-k">-</span><span class="pl-v">flight_</span><span class="pl-v">days</span></td>
      </tr>
      <tr>
        <td id="L43" class="blob-num js-line-number" data-line-number="43"></td>
        <td id="LC43" class="blob-code blob-code-inner js-file-line"><span class="pl-v">B</span><span class="pl-k">-</span><span class="pl-v">flight_</span><span class="pl-v">mod</span></td>
      </tr>
      <tr>
        <td id="L44" class="blob-num js-line-number" data-line-number="44"></td>
        <td id="LC44" class="blob-code blob-code-inner js-file-line"><span class="pl-v">B</span><span class="pl-k">-</span><span class="pl-v">flight_</span><span class="pl-v">number</span></td>
      </tr>
      <tr>
        <td id="L45" class="blob-num js-line-number" data-line-number="45"></td>
        <td id="LC45" class="blob-code blob-code-inner js-file-line"><span class="pl-v">B</span><span class="pl-k">-</span><span class="pl-v">flight_</span><span class="pl-v">stop</span></td>
      </tr>
      <tr>
        <td id="L46" class="blob-num js-line-number" data-line-number="46"></td>
        <td id="LC46" class="blob-code blob-code-inner js-file-line"><span class="pl-v">B</span><span class="pl-k">-</span><span class="pl-v">flight_</span><span class="pl-v">time</span></td>
      </tr>
      <tr>
        <td id="L47" class="blob-num js-line-number" data-line-number="47"></td>
        <td id="LC47" class="blob-code blob-code-inner js-file-line"><span class="pl-v">B</span><span class="pl-k">-</span><span class="pl-v">fromloc</span>.<span class="pl-v">airport_</span><span class="pl-v">code</span></td>
      </tr>
      <tr>
        <td id="L48" class="blob-num js-line-number" data-line-number="48"></td>
        <td id="LC48" class="blob-code blob-code-inner js-file-line"><span class="pl-v">B</span><span class="pl-k">-</span><span class="pl-v">fromloc</span>.<span class="pl-v">airport_</span><span class="pl-v">name</span></td>
      </tr>
      <tr>
        <td id="L49" class="blob-num js-line-number" data-line-number="49"></td>
        <td id="LC49" class="blob-code blob-code-inner js-file-line"><span class="pl-v">B</span><span class="pl-k">-</span><span class="pl-v">fromloc</span>.<span class="pl-v">city_</span><span class="pl-v">name</span></td>
      </tr>
      <tr>
        <td id="L50" class="blob-num js-line-number" data-line-number="50"></td>
        <td id="LC50" class="blob-code blob-code-inner js-file-line"><span class="pl-v">B</span><span class="pl-k">-</span><span class="pl-v">fromloc</span>.<span class="pl-v">state_</span><span class="pl-v">code</span></td>
      </tr>
      <tr>
        <td id="L51" class="blob-num js-line-number" data-line-number="51"></td>
        <td id="LC51" class="blob-code blob-code-inner js-file-line"><span class="pl-v">B</span><span class="pl-k">-</span><span class="pl-v">fromloc</span>.<span class="pl-v">state_</span><span class="pl-v">name</span></td>
      </tr>
      <tr>
        <td id="L52" class="blob-num js-line-number" data-line-number="52"></td>
        <td id="LC52" class="blob-code blob-code-inner js-file-line"><span class="pl-v">B</span><span class="pl-k">-</span><span class="pl-v">meal</span></td>
      </tr>
      <tr>
        <td id="L53" class="blob-num js-line-number" data-line-number="53"></td>
        <td id="LC53" class="blob-code blob-code-inner js-file-line"><span class="pl-v">B</span><span class="pl-k">-</span><span class="pl-v">meal_</span><span class="pl-v">code</span></td>
      </tr>
      <tr>
        <td id="L54" class="blob-num js-line-number" data-line-number="54"></td>
        <td id="LC54" class="blob-code blob-code-inner js-file-line"><span class="pl-v">B</span><span class="pl-k">-</span><span class="pl-v">meal_</span><span class="pl-v">description</span></td>
      </tr>
      <tr>
        <td id="L55" class="blob-num js-line-number" data-line-number="55"></td>
        <td id="LC55" class="blob-code blob-code-inner js-file-line"><span class="pl-v">B</span><span class="pl-k">-</span><span class="pl-v">mod</span></td>
      </tr>
      <tr>
        <td id="L56" class="blob-num js-line-number" data-line-number="56"></td>
        <td id="LC56" class="blob-code blob-code-inner js-file-line"><span class="pl-v">B</span><span class="pl-k">-</span><span class="pl-v">month_</span><span class="pl-v">name</span></td>
      </tr>
      <tr>
        <td id="L57" class="blob-num js-line-number" data-line-number="57"></td>
        <td id="LC57" class="blob-code blob-code-inner js-file-line"><span class="pl-v">B</span><span class="pl-k">-</span><span class="pl-v">or</span></td>
      </tr>
      <tr>
        <td id="L58" class="blob-num js-line-number" data-line-number="58"></td>
        <td id="LC58" class="blob-code blob-code-inner js-file-line"><span class="pl-v">B</span><span class="pl-k">-</span><span class="pl-v">period_of_</span><span class="pl-v">day</span></td>
      </tr>
      <tr>
        <td id="L59" class="blob-num js-line-number" data-line-number="59"></td>
        <td id="LC59" class="blob-code blob-code-inner js-file-line"><span class="pl-v">B</span><span class="pl-k">-</span><span class="pl-v">restriction_</span><span class="pl-v">code</span></td>
      </tr>
      <tr>
        <td id="L60" class="blob-num js-line-number" data-line-number="60"></td>
        <td id="LC60" class="blob-code blob-code-inner js-file-line"><span class="pl-v">B</span><span class="pl-k">-</span><span class="pl-v">return_</span><span class="pl-v">date</span>.<span class="pl-v">date_</span><span class="pl-v">relative</span></td>
      </tr>
      <tr>
        <td id="L61" class="blob-num js-line-number" data-line-number="61"></td>
        <td id="LC61" class="blob-code blob-code-inner js-file-line"><span class="pl-v">B</span><span class="pl-k">-</span><span class="pl-v">return_</span><span class="pl-v">date</span>.<span class="pl-v">day_</span><span class="pl-v">name</span></td>
      </tr>
      <tr>
        <td id="L62" class="blob-num js-line-number" data-line-number="62"></td>
        <td id="LC62" class="blob-code blob-code-inner js-file-line"><span class="pl-v">B</span><span class="pl-k">-</span><span class="pl-v">return_</span><span class="pl-v">date</span>.<span class="pl-v">day_</span><span class="pl-v">number</span></td>
      </tr>
      <tr>
        <td id="L63" class="blob-num js-line-number" data-line-number="63"></td>
        <td id="LC63" class="blob-code blob-code-inner js-file-line"><span class="pl-v">B</span><span class="pl-k">-</span><span class="pl-v">return_</span><span class="pl-v">date</span>.<span class="pl-v">month_</span><span class="pl-v">name</span></td>
      </tr>
      <tr>
        <td id="L64" class="blob-num js-line-number" data-line-number="64"></td>
        <td id="LC64" class="blob-code blob-code-inner js-file-line"><span class="pl-v">B</span><span class="pl-k">-</span><span class="pl-v">return_</span><span class="pl-v">date</span>.<span class="pl-v">today_</span><span class="pl-v">relative</span></td>
      </tr>
      <tr>
        <td id="L65" class="blob-num js-line-number" data-line-number="65"></td>
        <td id="LC65" class="blob-code blob-code-inner js-file-line"><span class="pl-v">B</span><span class="pl-k">-</span><span class="pl-v">return_</span><span class="pl-v">time</span>.<span class="pl-v">period_</span><span class="pl-v">mod</span></td>
      </tr>
      <tr>
        <td id="L66" class="blob-num js-line-number" data-line-number="66"></td>
        <td id="LC66" class="blob-code blob-code-inner js-file-line"><span class="pl-v">B</span><span class="pl-k">-</span><span class="pl-v">return_</span><span class="pl-v">time</span>.<span class="pl-v">period_of_</span><span class="pl-v">day</span></td>
      </tr>
      <tr>
        <td id="L67" class="blob-num js-line-number" data-line-number="67"></td>
        <td id="LC67" class="blob-code blob-code-inner js-file-line"><span class="pl-v">B</span><span class="pl-k">-</span><span class="pl-v">round_</span><span class="pl-v">trip</span></td>
      </tr>
      <tr>
        <td id="L68" class="blob-num js-line-number" data-line-number="68"></td>
        <td id="LC68" class="blob-code blob-code-inner js-file-line"><span class="pl-v">B</span><span class="pl-k">-</span><span class="pl-v">state_</span><span class="pl-v">code</span></td>
      </tr>
      <tr>
        <td id="L69" class="blob-num js-line-number" data-line-number="69"></td>
        <td id="LC69" class="blob-code blob-code-inner js-file-line"><span class="pl-v">B</span><span class="pl-k">-</span><span class="pl-v">state_</span><span class="pl-v">name</span></td>
      </tr>
      <tr>
        <td id="L70" class="blob-num js-line-number" data-line-number="70"></td>
        <td id="LC70" class="blob-code blob-code-inner js-file-line"><span class="pl-v">B</span><span class="pl-k">-</span><span class="pl-v">stoploc</span>.<span class="pl-v">airport_</span><span class="pl-v">code</span></td>
      </tr>
      <tr>
        <td id="L71" class="blob-num js-line-number" data-line-number="71"></td>
        <td id="LC71" class="blob-code blob-code-inner js-file-line"><span class="pl-v">B</span><span class="pl-k">-</span><span class="pl-v">stoploc</span>.<span class="pl-v">airport_</span><span class="pl-v">name</span></td>
      </tr>
      <tr>
        <td id="L72" class="blob-num js-line-number" data-line-number="72"></td>
        <td id="LC72" class="blob-code blob-code-inner js-file-line"><span class="pl-v">B</span><span class="pl-k">-</span><span class="pl-v">stoploc</span>.<span class="pl-v">city_</span><span class="pl-v">name</span></td>
      </tr>
      <tr>
        <td id="L73" class="blob-num js-line-number" data-line-number="73"></td>
        <td id="LC73" class="blob-code blob-code-inner js-file-line"><span class="pl-v">B</span><span class="pl-k">-</span><span class="pl-v">stoploc</span>.<span class="pl-v">state_</span><span class="pl-v">code</span></td>
      </tr>
      <tr>
        <td id="L74" class="blob-num js-line-number" data-line-number="74"></td>
        <td id="LC74" class="blob-code blob-code-inner js-file-line"><span class="pl-v">B</span><span class="pl-k">-</span><span class="pl-v">time</span></td>
      </tr>
      <tr>
        <td id="L75" class="blob-num js-line-number" data-line-number="75"></td>
        <td id="LC75" class="blob-code blob-code-inner js-file-line"><span class="pl-v">B</span><span class="pl-k">-</span><span class="pl-v">time_</span><span class="pl-v">relative</span></td>
      </tr>
      <tr>
        <td id="L76" class="blob-num js-line-number" data-line-number="76"></td>
        <td id="LC76" class="blob-code blob-code-inner js-file-line"><span class="pl-v">B</span><span class="pl-k">-</span><span class="pl-v">today_</span><span class="pl-v">relative</span></td>
      </tr>
      <tr>
        <td id="L77" class="blob-num js-line-number" data-line-number="77"></td>
        <td id="LC77" class="blob-code blob-code-inner js-file-line"><span class="pl-v">B</span><span class="pl-k">-</span><span class="pl-v">toloc</span>.<span class="pl-v">airport_</span><span class="pl-v">code</span></td>
      </tr>
      <tr>
        <td id="L78" class="blob-num js-line-number" data-line-number="78"></td>
        <td id="LC78" class="blob-code blob-code-inner js-file-line"><span class="pl-v">B</span><span class="pl-k">-</span><span class="pl-v">toloc</span>.<span class="pl-v">airport_</span><span class="pl-v">name</span></td>
      </tr>
      <tr>
        <td id="L79" class="blob-num js-line-number" data-line-number="79"></td>
        <td id="LC79" class="blob-code blob-code-inner js-file-line"><span class="pl-v">B</span><span class="pl-k">-</span><span class="pl-v">toloc</span>.<span class="pl-v">city_</span><span class="pl-v">name</span></td>
      </tr>
      <tr>
        <td id="L80" class="blob-num js-line-number" data-line-number="80"></td>
        <td id="LC80" class="blob-code blob-code-inner js-file-line"><span class="pl-v">B</span><span class="pl-k">-</span><span class="pl-v">toloc</span>.<span class="pl-v">country_</span><span class="pl-v">name</span></td>
      </tr>
      <tr>
        <td id="L81" class="blob-num js-line-number" data-line-number="81"></td>
        <td id="LC81" class="blob-code blob-code-inner js-file-line"><span class="pl-v">B</span><span class="pl-k">-</span><span class="pl-v">toloc</span>.<span class="pl-v">state_</span><span class="pl-v">code</span></td>
      </tr>
      <tr>
        <td id="L82" class="blob-num js-line-number" data-line-number="82"></td>
        <td id="LC82" class="blob-code blob-code-inner js-file-line"><span class="pl-v">B</span><span class="pl-k">-</span><span class="pl-v">toloc</span>.<span class="pl-v">state_</span><span class="pl-v">name</span></td>
      </tr>
      <tr>
        <td id="L83" class="blob-num js-line-number" data-line-number="83"></td>
        <td id="LC83" class="blob-code blob-code-inner js-file-line"><span class="pl-v">B</span><span class="pl-k">-</span><span class="pl-v">transport_</span><span class="pl-v">type</span></td>
      </tr>
      <tr>
        <td id="L84" class="blob-num js-line-number" data-line-number="84"></td>
        <td id="LC84" class="blob-code blob-code-inner js-file-line"><span class="pl-v">I</span><span class="pl-k">-</span><span class="pl-v">airline_</span><span class="pl-v">name</span></td>
      </tr>
      <tr>
        <td id="L85" class="blob-num js-line-number" data-line-number="85"></td>
        <td id="LC85" class="blob-code blob-code-inner js-file-line"><span class="pl-v">I</span><span class="pl-k">-</span><span class="pl-v">airport_</span><span class="pl-v">name</span></td>
      </tr>
      <tr>
        <td id="L86" class="blob-num js-line-number" data-line-number="86"></td>
        <td id="LC86" class="blob-code blob-code-inner js-file-line"><span class="pl-v">I</span><span class="pl-k">-</span><span class="pl-v">arrive_</span><span class="pl-v">date</span>.<span class="pl-v">day_</span><span class="pl-v">number</span></td>
      </tr>
      <tr>
        <td id="L87" class="blob-num js-line-number" data-line-number="87"></td>
        <td id="LC87" class="blob-code blob-code-inner js-file-line"><span class="pl-v">I</span><span class="pl-k">-</span><span class="pl-v">arrive_</span><span class="pl-v">time</span>.<span class="pl-v">end_</span><span class="pl-v">time</span></td>
      </tr>
      <tr>
        <td id="L88" class="blob-num js-line-number" data-line-number="88"></td>
        <td id="LC88" class="blob-code blob-code-inner js-file-line"><span class="pl-v">I</span><span class="pl-k">-</span><span class="pl-v">arrive_</span><span class="pl-v">time</span>.<span class="pl-v">period_of_</span><span class="pl-v">day</span></td>
      </tr>
      <tr>
        <td id="L89" class="blob-num js-line-number" data-line-number="89"></td>
        <td id="LC89" class="blob-code blob-code-inner js-file-line"><span class="pl-v">I</span><span class="pl-k">-</span><span class="pl-v">arrive_</span><span class="pl-v">time</span>.<span class="pl-v">start_</span><span class="pl-v">time</span></td>
      </tr>
      <tr>
        <td id="L90" class="blob-num js-line-number" data-line-number="90"></td>
        <td id="LC90" class="blob-code blob-code-inner js-file-line"><span class="pl-v">I</span><span class="pl-k">-</span><span class="pl-v">arrive_</span><span class="pl-v">time</span>.<span class="pl-v">time</span></td>
      </tr>
      <tr>
        <td id="L91" class="blob-num js-line-number" data-line-number="91"></td>
        <td id="LC91" class="blob-code blob-code-inner js-file-line"><span class="pl-v">I</span><span class="pl-k">-</span><span class="pl-v">arrive_</span><span class="pl-v">time</span>.<span class="pl-v">time_</span><span class="pl-v">relative</span></td>
      </tr>
      <tr>
        <td id="L92" class="blob-num js-line-number" data-line-number="92"></td>
        <td id="LC92" class="blob-code blob-code-inner js-file-line"><span class="pl-v">I</span><span class="pl-k">-</span><span class="pl-v">city_</span><span class="pl-v">name</span></td>
      </tr>
      <tr>
        <td id="L93" class="blob-num js-line-number" data-line-number="93"></td>
        <td id="LC93" class="blob-code blob-code-inner js-file-line"><span class="pl-v">I</span><span class="pl-k">-</span><span class="pl-v">class_</span><span class="pl-v">type</span></td>
      </tr>
      <tr>
        <td id="L94" class="blob-num js-line-number" data-line-number="94"></td>
        <td id="LC94" class="blob-code blob-code-inner js-file-line"><span class="pl-v">I</span><span class="pl-k">-</span><span class="pl-v">cost_</span><span class="pl-v">relative</span></td>
      </tr>
      <tr>
        <td id="L95" class="blob-num js-line-number" data-line-number="95"></td>
        <td id="LC95" class="blob-code blob-code-inner js-file-line"><span class="pl-v">I</span><span class="pl-k">-</span><span class="pl-v">depart_</span><span class="pl-v">date</span>.<span class="pl-v">day_</span><span class="pl-v">name</span></td>
      </tr>
      <tr>
        <td id="L96" class="blob-num js-line-number" data-line-number="96"></td>
        <td id="LC96" class="blob-code blob-code-inner js-file-line"><span class="pl-v">I</span><span class="pl-k">-</span><span class="pl-v">depart_</span><span class="pl-v">date</span>.<span class="pl-v">day_</span><span class="pl-v">number</span></td>
      </tr>
      <tr>
        <td id="L97" class="blob-num js-line-number" data-line-number="97"></td>
        <td id="LC97" class="blob-code blob-code-inner js-file-line"><span class="pl-v">I</span><span class="pl-k">-</span><span class="pl-v">depart_</span><span class="pl-v">date</span>.<span class="pl-v">today_</span><span class="pl-v">relative</span></td>
      </tr>
      <tr>
        <td id="L98" class="blob-num js-line-number" data-line-number="98"></td>
        <td id="LC98" class="blob-code blob-code-inner js-file-line"><span class="pl-v">I</span><span class="pl-k">-</span><span class="pl-v">depart_</span><span class="pl-v">time</span>.<span class="pl-v">end_</span><span class="pl-v">time</span></td>
      </tr>
      <tr>
        <td id="L99" class="blob-num js-line-number" data-line-number="99"></td>
        <td id="LC99" class="blob-code blob-code-inner js-file-line"><span class="pl-v">I</span><span class="pl-k">-</span><span class="pl-v">depart_</span><span class="pl-v">time</span>.<span class="pl-v">period_of_</span><span class="pl-v">day</span></td>
      </tr>
      <tr>
        <td id="L100" class="blob-num js-line-number" data-line-number="100"></td>
        <td id="LC100" class="blob-code blob-code-inner js-file-line"><span class="pl-v">I</span><span class="pl-k">-</span><span class="pl-v">depart_</span><span class="pl-v">time</span>.<span class="pl-v">start_</span><span class="pl-v">time</span></td>
      </tr>
      <tr>
        <td id="L101" class="blob-num js-line-number" data-line-number="101"></td>
        <td id="LC101" class="blob-code blob-code-inner js-file-line"><span class="pl-v">I</span><span class="pl-k">-</span><span class="pl-v">depart_</span><span class="pl-v">time</span>.<span class="pl-v">time</span></td>
      </tr>
      <tr>
        <td id="L102" class="blob-num js-line-number" data-line-number="102"></td>
        <td id="LC102" class="blob-code blob-code-inner js-file-line"><span class="pl-v">I</span><span class="pl-k">-</span><span class="pl-v">depart_</span><span class="pl-v">time</span>.<span class="pl-v">time_</span><span class="pl-v">relative</span></td>
      </tr>
      <tr>
        <td id="L103" class="blob-num js-line-number" data-line-number="103"></td>
        <td id="LC103" class="blob-code blob-code-inner js-file-line"><span class="pl-v">I</span><span class="pl-k">-</span><span class="pl-v">economy</span></td>
      </tr>
      <tr>
        <td id="L104" class="blob-num js-line-number" data-line-number="104"></td>
        <td id="LC104" class="blob-code blob-code-inner js-file-line"><span class="pl-v">I</span><span class="pl-k">-</span><span class="pl-v">fare_</span><span class="pl-v">amount</span></td>
      </tr>
      <tr>
        <td id="L105" class="blob-num js-line-number" data-line-number="105"></td>
        <td id="LC105" class="blob-code blob-code-inner js-file-line"><span class="pl-v">I</span><span class="pl-k">-</span><span class="pl-v">fare_basis_</span><span class="pl-v">code</span></td>
      </tr>
      <tr>
        <td id="L106" class="blob-num js-line-number" data-line-number="106"></td>
        <td id="LC106" class="blob-code blob-code-inner js-file-line"><span class="pl-v">I</span><span class="pl-k">-</span><span class="pl-v">flight_</span><span class="pl-v">mod</span></td>
      </tr>
      <tr>
        <td id="L107" class="blob-num js-line-number" data-line-number="107"></td>
        <td id="LC107" class="blob-code blob-code-inner js-file-line"><span class="pl-v">I</span><span class="pl-k">-</span><span class="pl-v">flight_</span><span class="pl-v">number</span></td>
      </tr>
      <tr>
        <td id="L108" class="blob-num js-line-number" data-line-number="108"></td>
        <td id="LC108" class="blob-code blob-code-inner js-file-line"><span class="pl-v">I</span><span class="pl-k">-</span><span class="pl-v">flight_</span><span class="pl-v">stop</span></td>
      </tr>
      <tr>
        <td id="L109" class="blob-num js-line-number" data-line-number="109"></td>
        <td id="LC109" class="blob-code blob-code-inner js-file-line"><span class="pl-v">I</span><span class="pl-k">-</span><span class="pl-v">flight_</span><span class="pl-v">time</span></td>
      </tr>
      <tr>
        <td id="L110" class="blob-num js-line-number" data-line-number="110"></td>
        <td id="LC110" class="blob-code blob-code-inner js-file-line"><span class="pl-v">I</span><span class="pl-k">-</span><span class="pl-v">fromloc</span>.<span class="pl-v">airport_</span><span class="pl-v">name</span></td>
      </tr>
      <tr>
        <td id="L111" class="blob-num js-line-number" data-line-number="111"></td>
        <td id="LC111" class="blob-code blob-code-inner js-file-line"><span class="pl-v">I</span><span class="pl-k">-</span><span class="pl-v">fromloc</span>.<span class="pl-v">city_</span><span class="pl-v">name</span></td>
      </tr>
      <tr>
        <td id="L112" class="blob-num js-line-number" data-line-number="112"></td>
        <td id="LC112" class="blob-code blob-code-inner js-file-line"><span class="pl-v">I</span><span class="pl-k">-</span><span class="pl-v">fromloc</span>.<span class="pl-v">state_</span><span class="pl-v">name</span></td>
      </tr>
      <tr>
        <td id="L113" class="blob-num js-line-number" data-line-number="113"></td>
        <td id="LC113" class="blob-code blob-code-inner js-file-line"><span class="pl-v">I</span><span class="pl-k">-</span><span class="pl-v">meal_</span><span class="pl-v">code</span></td>
      </tr>
      <tr>
        <td id="L114" class="blob-num js-line-number" data-line-number="114"></td>
        <td id="LC114" class="blob-code blob-code-inner js-file-line"><span class="pl-v">I</span><span class="pl-k">-</span><span class="pl-v">meal_</span><span class="pl-v">description</span></td>
      </tr>
      <tr>
        <td id="L115" class="blob-num js-line-number" data-line-number="115"></td>
        <td id="LC115" class="blob-code blob-code-inner js-file-line"><span class="pl-v">I</span><span class="pl-k">-</span><span class="pl-v">mod</span></td>
      </tr>
      <tr>
        <td id="L116" class="blob-num js-line-number" data-line-number="116"></td>
        <td id="LC116" class="blob-code blob-code-inner js-file-line"><span class="pl-v">I</span><span class="pl-k">-</span><span class="pl-v">restriction_</span><span class="pl-v">code</span></td>
      </tr>
      <tr>
        <td id="L117" class="blob-num js-line-number" data-line-number="117"></td>
        <td id="LC117" class="blob-code blob-code-inner js-file-line"><span class="pl-v">I</span><span class="pl-k">-</span><span class="pl-v">return_</span><span class="pl-v">date</span>.<span class="pl-v">date_</span><span class="pl-v">relative</span></td>
      </tr>
      <tr>
        <td id="L118" class="blob-num js-line-number" data-line-number="118"></td>
        <td id="LC118" class="blob-code blob-code-inner js-file-line"><span class="pl-v">I</span><span class="pl-k">-</span><span class="pl-v">return_</span><span class="pl-v">date</span>.<span class="pl-v">day_</span><span class="pl-v">number</span></td>
      </tr>
      <tr>
        <td id="L119" class="blob-num js-line-number" data-line-number="119"></td>
        <td id="LC119" class="blob-code blob-code-inner js-file-line"><span class="pl-v">I</span><span class="pl-k">-</span><span class="pl-v">return_</span><span class="pl-v">date</span>.<span class="pl-v">today_</span><span class="pl-v">relative</span></td>
      </tr>
      <tr>
        <td id="L120" class="blob-num js-line-number" data-line-number="120"></td>
        <td id="LC120" class="blob-code blob-code-inner js-file-line"><span class="pl-v">I</span><span class="pl-k">-</span><span class="pl-v">round_</span><span class="pl-v">trip</span></td>
      </tr>
      <tr>
        <td id="L121" class="blob-num js-line-number" data-line-number="121"></td>
        <td id="LC121" class="blob-code blob-code-inner js-file-line"><span class="pl-v">I</span><span class="pl-k">-</span><span class="pl-v">state_</span><span class="pl-v">name</span></td>
      </tr>
      <tr>
        <td id="L122" class="blob-num js-line-number" data-line-number="122"></td>
        <td id="LC122" class="blob-code blob-code-inner js-file-line"><span class="pl-v">I</span><span class="pl-k">-</span><span class="pl-v">stoploc</span>.<span class="pl-v">city_</span><span class="pl-v">name</span></td>
      </tr>
      <tr>
        <td id="L123" class="blob-num js-line-number" data-line-number="123"></td>
        <td id="LC123" class="blob-code blob-code-inner js-file-line"><span class="pl-v">I</span><span class="pl-k">-</span><span class="pl-v">time</span></td>
      </tr>
      <tr>
        <td id="L124" class="blob-num js-line-number" data-line-number="124"></td>
        <td id="LC124" class="blob-code blob-code-inner js-file-line"><span class="pl-v">I</span><span class="pl-k">-</span><span class="pl-v">today_</span><span class="pl-v">relative</span></td>
      </tr>
      <tr>
        <td id="L125" class="blob-num js-line-number" data-line-number="125"></td>
        <td id="LC125" class="blob-code blob-code-inner js-file-line"><span class="pl-v">I</span><span class="pl-k">-</span><span class="pl-v">toloc</span>.<span class="pl-v">airport_</span><span class="pl-v">name</span></td>
      </tr>
      <tr>
        <td id="L126" class="blob-num js-line-number" data-line-number="126"></td>
        <td id="LC126" class="blob-code blob-code-inner js-file-line"><span class="pl-v">I</span><span class="pl-k">-</span><span class="pl-v">toloc</span>.<span class="pl-v">city_</span><span class="pl-v">name</span></td>
      </tr>
      <tr>
        <td id="L127" class="blob-num js-line-number" data-line-number="127"></td>
        <td id="LC127" class="blob-code blob-code-inner js-file-line"><span class="pl-v">I</span><span class="pl-k">-</span><span class="pl-v">toloc</span>.<span class="pl-v">state_</span><span class="pl-v">name</span></td>
      </tr>
      <tr>
        <td id="L128" class="blob-num js-line-number" data-line-number="128"></td>
        <td id="LC128" class="blob-code blob-code-inner js-file-line"><span class="pl-v">I</span><span class="pl-k">-</span><span class="pl-v">transport_</span><span class="pl-v">type</span></td>
      </tr>
      <tr>
        <td id="L129" class="blob-num js-line-number" data-line-number="129"></td>
        <td id="LC129" class="blob-code blob-code-inner js-file-line"><span class="pl-v">O</span></td>
      </tr>
</table>

  <div class="BlobToolbar position-absolute js-file-line-actions dropdown js-menu-container js-select-menu d-none" aria-hidden="true">
    <button class="btn-octicon ml-0 px-2 p-0 bg-white border border-gray-dark rounded-1 dropdown-toggle js-menu-target" id="js-file-line-action-button" type="button" aria-expanded="false" aria-haspopup="true" aria-label="Inline file action toolbar" aria-controls="inline-file-actions">
      <svg aria-hidden="true" class="octicon" height="16" version="1.1" viewBox="0 0 13 4" width="14">
        <g stroke="none" stroke-width="1" fill-rule="evenodd">
            <g transform="translate(-1.000000, -6.000000)">
                <path d="M2.5,9.5 C1.67157288,9.5 1,8.82842712 1,8 C1,7.17157288 1.67157288,6.5 2.5,6.5 C3.32842712,6.5 4,7.17157288 4,8 C4,8.82842712 3.32842712,9.5 2.5,9.5 Z M7.5,9.5 C6.67157288,9.5 6,8.82842712 6,8 C6,7.17157288 6.67157288,6.5 7.5,6.5 C8.32842712,6.5 9,7.17157288 9,8 C9,8.82842712 8.32842712,9.5 7.5,9.5 Z M12.5,9.5 C11.6715729,9.5 11,8.82842712 11,8 C11,7.17157288 11.6715729,6.5 12.5,6.5 C13.3284271,6.5 14,7.17157288 14,8 C14,8.82842712 13.3284271,9.5 12.5,9.5 Z"></path>
            </g>
        </g>
      </svg>
    </button>
    <div class="dropdown-menu-content js-menu-content" id="inline-file-actions">
      <ul class="BlobToolbar-dropdown dropdown-menu dropdown-menu-se mt-2">
        <li><a class="js-zeroclipboard dropdown-item" style="cursor:pointer;" id="js-copy-lines" data-original-text="Copy lines">Copy lines</a></li>
        <li><a class="js-zeroclipboard dropdown-item" id= "js-copy-permalink" style="cursor:pointer;" data-original-text="Copy permalink">Copy permalink</a></li>
          <li><a href="/Microsoft/CNTK/issues/new" class="dropdown-item" id="js-new-issue">Open new issue</a></li>
      </ul>
    </div>
  </div>

  </div>

  </div>

  <button type="button" data-facebox="#jump-to-line" data-facebox-class="linejump" data-hotkey="l" class="d-none">Jump to Line</button>
  <div id="jump-to-line" style="display:none">
    <!-- '"` --><!-- </textarea></xmp> --></option></form><form accept-charset="UTF-8" action="" class="js-jump-to-line-form" method="get"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /></div>
      <input class="form-control linejump-input js-jump-to-line-field" type="text" placeholder="Jump to line&hellip;" aria-label="Jump to line" autofocus>
      <button type="submit" class="btn">Go</button>
</form>  </div>

  </div>
  <div class="modal-backdrop js-touch-events"></div>
</div>

    </div>
  </div>

  </div>

      
<div class="container-lg site-footer-container">
  <div class="site-footer " role="contentinfo">
    <ul class="site-footer-links float-right">
        <li><a href="https://github.com/contact" data-ga-click="Footer, go to contact, text:contact">Contact GitHub</a></li>
      <li><a href="https://developer.github.com" data-ga-click="Footer, go to api, text:api">API</a></li>
      <li><a href="https://training.github.com" data-ga-click="Footer, go to training, text:training">Training</a></li>
      <li><a href="https://shop.github.com" data-ga-click="Footer, go to shop, text:shop">Shop</a></li>
        <li><a href="https://github.com/blog" data-ga-click="Footer, go to blog, text:blog">Blog</a></li>
        <li><a href="https://github.com/about" data-ga-click="Footer, go to about, text:about">About</a></li>

    </ul>

    <a href="https://github.com" aria-label="Homepage" class="site-footer-mark" title="GitHub">
      <svg aria-hidden="true" class="octicon octicon-mark-github" height="24" version="1.1" viewBox="0 0 16 16" width="24"><path fill-rule="evenodd" d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27.68 0 1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.013 8.013 0 0 0 16 8c0-4.42-3.58-8-8-8z"/></svg>
</a>
    <ul class="site-footer-links">
      <li>&copy; 2017 <span title="0.22140s from unicorn-89384672-7gd2k">GitHub</span>, Inc.</li>
        <li><a href="https://github.com/site/terms" data-ga-click="Footer, go to terms, text:terms">Terms</a></li>
        <li><a href="https://github.com/site/privacy" data-ga-click="Footer, go to privacy, text:privacy">Privacy</a></li>
        <li><a href="https://github.com/security" data-ga-click="Footer, go to security, text:security">Security</a></li>
        <li><a href="https://status.github.com/" data-ga-click="Footer, go to status, text:status">Status</a></li>
        <li><a href="https://help.github.com" data-ga-click="Footer, go to help, text:help">Help</a></li>
    </ul>
  </div>
</div>



  <div id="ajax-error-message" class="ajax-error-message flash flash-error">
    <svg aria-hidden="true" class="octicon octicon-alert" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M8.865 1.52c-.18-.31-.51-.5-.87-.5s-.69.19-.87.5L.275 13.5c-.18.31-.18.69 0 1 .19.31.52.5.87.5h13.7c.36 0 .69-.19.86-.5.17-.31.18-.69.01-1L8.865 1.52zM8.995 13h-2v-2h2v2zm0-3h-2V6h2v4z"/></svg>
    <button type="button" class="flash-close js-flash-close js-ajax-error-dismiss" aria-label="Dismiss error">
      <svg aria-hidden="true" class="octicon octicon-x" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M7.48 8l3.75 3.75-1.48 1.48L6 9.48l-3.75 3.75-1.48-1.48L4.52 8 .77 4.25l1.48-1.48L6 6.52l3.75-3.75 1.48 1.48z"/></svg>
    </button>
    You can't perform that action at this time.
  </div>


    
    <script crossorigin="anonymous" integrity="sha256-PJJrxrJLzT6CCz1jDfQXTRWOO9zmemDQbmLtSlFQluc=" src="https://assets-cdn.github.com/assets/frameworks-3c926bc6b24bcd3e820b3d630df4174d158e3bdce67a60d06e62ed4a515096e7.js"></script>
    
    <script async="async" crossorigin="anonymous" integrity="sha256-aPq/cXV5vd3fYu78N0qureP3WSV+w+45WZcJy205oaw=" src="https://assets-cdn.github.com/assets/github-68fabf717579bddddf62eefc374aaeade3f759257ec3ee39599709cb6d39a1ac.js"></script>
    
    
    
    
  <div class="js-stale-session-flash stale-session-flash flash flash-warn flash-banner d-none">
    <svg aria-hidden="true" class="octicon octicon-alert" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M8.865 1.52c-.18-.31-.51-.5-.87-.5s-.69.19-.87.5L.275 13.5c-.18.31-.18.69 0 1 .19.31.52.5.87.5h13.7c.36 0 .69-.19.86-.5.17-.31.18-.69.01-1L8.865 1.52zM8.995 13h-2v-2h2v2zm0-3h-2V6h2v4z"/></svg>
    <span class="signed-in-tab-flash">You signed in with another tab or window. <a href="">Reload</a> to refresh your session.</span>
    <span class="signed-out-tab-flash">You signed out in another tab or window. <a href="">Reload</a> to refresh your session.</span>
  </div>
  <div class="facebox" id="facebox" style="display:none;">
  <div class="facebox-popup">
    <div class="facebox-content" role="dialog" aria-labelledby="facebox-header" aria-describedby="facebox-description">
    </div>
    <button type="button" class="facebox-close js-facebox-close" aria-label="Close modal">
      <svg aria-hidden="true" class="octicon octicon-x" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M7.48 8l3.75 3.75-1.48 1.48L6 9.48l-3.75 3.75-1.48-1.48L4.52 8 .77 4.25l1.48-1.48L6 6.52l3.75-3.75 1.48 1.48z"/></svg>
    </button>
  </div>
</div>


  </body>
</html>

