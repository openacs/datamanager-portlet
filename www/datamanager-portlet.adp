<%
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
%>

<property name="context">@context;noquote@</property>
<property name="title">Dataman</property>

<TABLE>
  <TR>
    <TH>User</TH>
    <TH>Wasted size (MB)</TH>
    <TH>Max bytes allowed (MB)</TH>
    <TH>Wasted files (num. files)</TH>
    <TH>Max num. files allowed</TH>
  </TR>
  <TR>
    <TD align="right">@username@</TD>
    <TD align="right">@wasted_size_datamanager@</TD>
    <TD align="right">@max_size_datamanager@</TD>
    <TD align="right">@wasted_filenumber_datamanager@</TD>
    <TD align="right">@max_filenumber_datamanager@</TD>
  </TR>
</TABLE>

