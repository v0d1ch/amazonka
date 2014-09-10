{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.EC2.CreateInternetGateway
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Creates an Internet gateway for use with a VPC. After creating the Internet
-- gateway, you attach it to a VPC using AttachInternetGateway. For more
-- information about your VPC and Internet gateway, see the Amazon Virtual
-- Private Cloud User Guide. Example This example creates an Internet gateway.
-- https://ec2.amazonaws.com/?Action=CreateInternetGateway &amp;AUTHPARAMS
-- 59dbff89-35bd-4eac-99ed-be587EXAMPLE igw-eaad4883.
module Network.AWS.EC2.CreateInternetGateway
    (
    -- * Request
      CreateInternetGateway
    -- ** Request constructor
    , mkCreateInternetGateway
    -- * Response
    , CreateInternetGatewayResponse
    -- ** Response constructor
    , mkCreateInternetGatewayResponse
    -- ** Response lenses
    , cigrInternetGateway
    ) where

import Network.AWS.Request.Query
import Network.AWS.EC2.Types
import Network.AWS.Prelude

data CreateInternetGateway = CreateInternetGateway
    deriving (Eq, Show, Generic)

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'CreateInternetGateway' request.
mkCreateInternetGateway :: CreateInternetGateway
mkCreateInternetGateway = CreateInternetGateway

instance ToQuery CreateInternetGateway where
    toQuery = genericQuery def

newtype CreateInternetGatewayResponse = CreateInternetGatewayResponse
    { _cigrInternetGateway :: Maybe InternetGateway
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'CreateInternetGatewayResponse' response.
--
-- This constructor is provided for convenience and testing purposes.
--
-- The fields accessible through corresponding lenses are:
--
-- * @InternetGateway ::@ @Maybe InternetGateway@
--
mkCreateInternetGatewayResponse :: CreateInternetGatewayResponse
mkCreateInternetGatewayResponse = CreateInternetGatewayResponse
    { _cigrInternetGateway = Nothing
    }

-- | Information about the Internet gateway.
cigrInternetGateway :: Lens' CreateInternetGatewayResponse (Maybe InternetGateway)
cigrInternetGateway =
    lens _cigrInternetGateway (\s a -> s { _cigrInternetGateway = a })

instance FromXML CreateInternetGatewayResponse where
    fromXMLOptions = xmlOptions

instance AWSRequest CreateInternetGateway where
    type Sv CreateInternetGateway = EC2
    type Rs CreateInternetGateway = CreateInternetGatewayResponse

    request = post "CreateInternetGateway"
    response _ = xmlResponse
