#
#  Copyright (C) 2004 University XYZ
#
#  This file is part of dotLRN.
#
#  dotLRN is free software; you can redistribute it and/or modify it under the
#  terms of the GNU General Public License as published by the Free Software
#  Foundation; either version 2 of the License, or (at your option) any later
#  version.
#
#  dotLRN is distributed in the hope that it will be useful, but WITHOUT ANY
#  WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
#  FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
#  details.
#

ad_page_contract {
    The display logic for the datamanager portlet

    @author YYY ZZZ (YYY.ZZZ@xx.yy)
    @creation-date 2004-10-10
    @version $Id: datamanager-portlet.tcl,v 0.1 2004-10-10

} -properties {
    context:onevalue
    user_id:onevalue
} -validate {

}

array set config $cf
set list_of_package_ids $config(package_id)
set user_id [ad_conn user_id]
set sep_package_ids [join $list_of_package_ids ", "]
if {[llength $list_of_package_ids] == 1} { set single_p "t"} else {set single_p "f"}
set context [list]
set shaded_p $config(shaded_p)
set datamanager_url "[ad_conn package_url]/datamanager/datamanager"
set community_id [dotlrn_community::get_community_id]

if {$sep_package_ids == ""} {
  set sep_package_ids [dotlrn_community::get_package_id $community_id]
}
set one_instance_p [ad_decode [llength $list_of_package_ids] 1 1 0]
set package_id [ad_conn package_id]

if {[exists_and_not_null community_id]} {
    #We are in portal for one class or community
    set inside_comm_p 1
    set url_to_datamanager $datamanager_url
} else {
    #We are in user portal
    set inside_comm_p 0
    set url_to_datamanager ""
}

db_1row get_user_info "select username, first_names, last_name  from acs_users_all where user_id = :user_id"

set wasted_size_datamanager          [datamanager::user_wasted_size -user_id $user_id]
set wasted_filenumber_datamanager    [datamanager::user_wasted_filenumber -user_id $user_id]
set max_size_datamanager             [datamanager::max_user_wasted_size]
set max_filenumber_datamanager       [datamanager::max_user_wasted_filenumber]
set luser_member_groups        [datamanager::user_member_groups -user_id $user_id]

#foreach group $luser_member_groups {
#}

ad_return_template





