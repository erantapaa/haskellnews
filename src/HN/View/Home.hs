{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE NoImplicitPrelude #-}

-- | The home page.

module HN.View.Home where

import HN.View
import HN.View.Template

home groups = template "home" mempty $ do
  container $ do
    row $ span12 $ h1 "Haskell News"
    forM_ groups $ \(source,items) ->
      row $ span12 $ do
        h2 $ toHtml source
        table !. "table" $
          forM_ items $ \item ->
            tr $ td $ do
              a ! hrefURI (iLink item) $ toHtml (iTitle item)