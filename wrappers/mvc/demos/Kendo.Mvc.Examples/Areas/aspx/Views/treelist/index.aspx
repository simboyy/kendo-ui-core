<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/aspx/Views/Shared/Web.Master" 
Inherits="System.Web.Mvc.ViewPage<IEnumerable<Kendo.Mvc.Examples.Models.TreeList.EmployeeDirectoryModel>>" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
<div class="demo-section k-header">
    <%: Html.Kendo().TreeList<Kendo.Mvc.Examples.Models.TreeList.EmployeeDirectoryModel>()
        .Name("treelist")
        .Columns(columns =>
        {
            columns.Add().Field("FirstName").Title("First Name").Width("220px");
            columns.Add().Field("LastName").Title("Last Name").Width("160px");
            columns.Add().Field("Position");
            columns.Add().Field("Phone").Width("200px");
            columns.Add().Field("Extension").Width("140px");
            columns.Add().Field("Address");
        })
        .Filterable(true)
        .Sortable(true)
        .DataSource(dataSource => dataSource
            .Read(read => read.Action("All", "EmployeeDirectory"))
            .Model(m => {
                m.Id(f => f.EmployeeId);
                m.ParentId(f => f.ReportsTo);
                m.Field(f => f.FirstName);
                m.Field(f => f.LastName);
                m.Field(f => f.ReportsTo);
            })
        )
        .Height(540)
    %>
</div>
</asp:Content>
