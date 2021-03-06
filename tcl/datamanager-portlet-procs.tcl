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

ad_library {

    Procedures to support the datamanager portlet

    @author Paco Soler (paco.soler@uv.es)
    @creation-date 2004-10-10
    @version $Id: datamanager-portlet-procs.tcl,v 0.1 2004/10/10

}

namespace eval datamanager_portlet {

    ad_proc -private get_my_name {
    } {
        return "datamanager_portlet"
    }

    ad_proc -private my_package_key {
    } {
        return "datamanager-portlet"
    }

    ad_proc -public get_pretty_name {
    } {
        return "#datamanager-portlet.pretty_name#"
    }

    ad_proc -public link {
    } {
        return ""
    }

    ad_proc -public add_self_to_page {
        {-portal_id:required}
        {-page_name ""}
        {-package_id:required}
        {-extra_params ""}
        {-force_region ""}
        {-param_action:required}
    } {
        add the portlet element to the given portal
    } {
        return [portal::add_element_parameters \
            -portal_id $portal_id \
            -page_name $page_name \
            -pretty_name [get_pretty_name] \
            -portlet_name [get_my_name] \
            -key package_id \
            -value $package_id \
            -force_region $force_region \
            -extra_params $extra_params \
            -param_action $param_action
            ]
    }

    ad_proc -public remove_self_from_page {
        {-portal_id:required}
        {-package_id:required}
    } {
        Removes a datamanager PE from the given page or the package_id of the
        datamanager package from the portlet if there are others remaining

        @param portal_id The page to remove self from
        @param package_id
    } {
        portal::remove_element_parameters \
            -portal_id $portal_id \
            -portlet_name [get_my_name] \
            -value $package_id
    }

    ad_proc -public show {
         cf
    } {
    } {
        portal::show_proc_helper \
            -package_key [my_package_key] \
            -config_list $cf \
            -template_src "datamanager-portlet"
    }

}
