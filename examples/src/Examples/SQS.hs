{-# LANGUAGE OverloadedStrings #-}

-- Module      : Examples.SQS
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

module Examples.SQS where

import           Control.Monad.Trans.AWS (runAWST, send)
import           Examples.Internal       (discoverEnv)
import qualified Network.AWS.SQS         as SQS

sendMessage :: IO ()
sendMessage = do
    env <- discoverEnv
    r   <- runAWST env $ do
        send $ SQS.sendMessage "$MY_SQS_URL_HERE" "Testing!"
    print r