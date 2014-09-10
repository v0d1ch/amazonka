{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.Redshift.DescribeEventCategories
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Displays a list of event categories for all event source types, or for a
-- specified source type. For a list of the event categories and source types,
-- go to Amazon Redshift Event Notifications.
module Network.AWS.Redshift.DescribeEventCategories
    (
    -- * Request
      DescribeEventCategories
    -- ** Request constructor
    , mkDescribeEventCategories
    -- ** Request lenses
    , decSourceType

    -- * Response
    , DescribeEventCategoriesResponse
    -- ** Response constructor
    , mkDescribeEventCategoriesResponse
    -- ** Response lenses
    , decrEventCategoriesMapList
    ) where

import Network.AWS.Request.Query
import Network.AWS.Redshift.Types
import Network.AWS.Prelude

-- | 
newtype DescribeEventCategories = DescribeEventCategories
    { _decSourceType :: !(Maybe Text)
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'DescribeEventCategories' request.
--
-- The fields accessible through corresponding lenses are:
--
-- * @SourceType ::@ @Maybe Text@
--
mkDescribeEventCategories :: DescribeEventCategories
mkDescribeEventCategories = DescribeEventCategories
    { _decSourceType = Nothing
    }

-- | The source type, such as cluster or parameter group, to which the described
-- event categories apply. Valid values: cluster, snapshot, parameter group,
-- and security group.
decSourceType :: Lens' DescribeEventCategories (Maybe Text)
decSourceType = lens _decSourceType (\s a -> s { _decSourceType = a })

instance ToQuery DescribeEventCategories where
    toQuery = genericQuery def

-- | 
newtype DescribeEventCategoriesResponse = DescribeEventCategoriesResponse
    { _decrEventCategoriesMapList :: [EventCategoriesMap]
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'DescribeEventCategoriesResponse' response.
--
-- This constructor is provided for convenience and testing purposes.
--
-- The fields accessible through corresponding lenses are:
--
-- * @EventCategoriesMapList ::@ @[EventCategoriesMap]@
--
mkDescribeEventCategoriesResponse :: DescribeEventCategoriesResponse
mkDescribeEventCategoriesResponse = DescribeEventCategoriesResponse
    { _decrEventCategoriesMapList = mempty
    }

-- | A list of event categories descriptions.
decrEventCategoriesMapList :: Lens' DescribeEventCategoriesResponse [EventCategoriesMap]
decrEventCategoriesMapList =
    lens _decrEventCategoriesMapList
         (\s a -> s { _decrEventCategoriesMapList = a })

instance FromXML DescribeEventCategoriesResponse where
    fromXMLOptions = xmlOptions

instance AWSRequest DescribeEventCategories where
    type Sv DescribeEventCategories = Redshift
    type Rs DescribeEventCategories = DescribeEventCategoriesResponse

    request = post "DescribeEventCategories"
    response _ = xmlResponse
