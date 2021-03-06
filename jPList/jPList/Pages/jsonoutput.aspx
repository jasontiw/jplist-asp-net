﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="jsonoutput.aspx.cs" Inherits="jPList.jsonoutput" MasterPageFile="~/Site.master" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadPlaceHolder">
    	
    <!-- jPList Core  -->
	<script src="//cdnjs.cloudflare.com/ajax/libs/jplist/5.2.0/js/jplist.core.min.js"></script>
	<link href="//cdnjs.cloudflare.com/ajax/libs/jplist/5.2.0/css/jplist.core.min.css" rel="stylesheet" type="text/css" />

    <!-- pagination bundle -->
	<link href="//cdnjs.cloudflare.com/ajax/libs/jplist/5.2.0/css/jplist.pagination-bundle.min.css" rel="stylesheet" type="text/css" />
	<script src="//cdnjs.cloudflare.com/ajax/libs/jplist/5.2.0/js/jplist.pagination-bundle.min.js"></script>
		
	<!-- history bundle -->
	<link href="//cdnjs.cloudflare.com/ajax/libs/jplist/5.2.0/css/jplist.history-bundle.min.css" rel="stylesheet" type="text/css" />
	<script src="//cdnjs.cloudflare.com/ajax/libs/jplist/5.2.0/js/jplist.history-bundle.min.js"></script>
		
	<!-- textbox control -->
	<link href="//cdnjs.cloudflare.com/ajax/libs/jplist/5.2.0/css/jplist.textbox-filter.min.css" rel="stylesheet" type="text/css" />
	<script src="//cdnjs.cloudflare.com/ajax/libs/jplist/5.2.0/js/jplist.textbox-filter.min.js"></script>
		
	<!-- preloader control -->
	<link href="//cdnjs.cloudflare.com/ajax/libs/jplist/5.2.0/css/jplist.preloader-control.min.css" rel="stylesheet" type="text/css" />
	<script src="//cdnjs.cloudflare.com/ajax/libs/jplist/5.2.0/js/jplist.preloader-control.min.js"></script>
		
	<!-- views control -->
	<link href="//cdnjs.cloudflare.com/ajax/libs/jplist/5.2.0/css/jplist.list-grid-view.min.css" rel="stylesheet" type="text/css" />
	<script src="//cdnjs.cloudflare.com/ajax/libs/jplist/5.2.0/js/jplist.list-grid-view.min.js"></script>
		
	<!-- sort bundle -->
	<script src="//cdnjs.cloudflare.com/ajax/libs/jplist/5.2.0/js/jplist.sort-bundle.min.js"></script>
		
	<!-- toggle filter bundle -->
	<link href="//cdnjs.cloudflare.com/ajax/libs/jplist/5.2.0/css/jplist.filter-toggle-bundle.min.css" rel="stylesheet" type="text/css" />
	<script src="//cdnjs.cloudflare.com/ajax/libs/jplist/5.2.0/js/jplist.filter-toggle-bundle.min.js"></script>	
        
    <!-- Handlebars Templates Library: http://handlebarsjs.com -->
	<script src="//cdnjs.cloudflare.com/ajax/libs/handlebars.js/2.0.0-alpha.4/handlebars.min.js"></script>	

	<script>
		$('document').ready(function () {

		    var $list = $('#demo .list')
			    , template = Handlebars.compile($('#jplist-template').html());

		    $('#demo').jplist({

		        itemsBox: '.list'
				, itemPath: '.list-item'
				, panelPath: '.jplist-panel'

		        //data source
				, dataSource: {

				    type: 'server'
					, server: {

					    //ajax settings
					    ajax: {
					        url: '/web/JSONOutputHandler.ashx'
							, dataType: 'json'
							, type: 'POST'
					    }
					}

				    //render function for json + templates like handlebars, xml + xslt etc.
				    , render: function (dataItem, statuses) {
				        $list.html(template(dataItem.content));
				    }
				}

		    });
		});
	</script>
        
    <!-- handlebars template -->
    <script id="jplist-template" type="text/x-handlebars-template">
	    {{#each this}}
						
		    <div class="list-item box">	
			    <div class="img left">
				    <img src="{{Image}}" alt="" title=""/>
			    </div>
								
			    <div class="block right">
				    <p class="title">{{Title}}</p>
				    <p class="desc">{{Description}}</p>
				    <p class="like">{{Likes}} Likes</p>
				    <p class="theme">{{Keyword1}}, {{Keyword2}}</p>
			    </div>
		    </div>
							
	    {{/each}}
    </script>	
</asp:Content>

<asp:Content ID="TitleContent" runat="server" ContentPlaceHolderID="TitlePlaceHolder">
    <h1 class="h1-30-normal">ASP.NET and SQL Server: JSON output and Handlebars template</h1>
</asp:Content>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="BodyPlaceHolder">

    <div class="box">
	<div class="center">

		<div class="box text-shadow">

			<!-- jPList DEMO START -->
			<div id="demo" class="box jplist">
							
				<!-- ios button: show/hide panel -->
				<div class="jplist-ios-button">
					<i class="fa fa-sort"></i>
					jPList Actions
				</div>
								
				<!-- panel -->
				<div class="jplist-panel box panel-top">						

					<!-- reset button -->
					<button 
						type="button" 
						class="jplist-reset-btn"
						data-control-type="reset" 
						data-control-name="reset" 
						data-control-action="reset">
						Reset &nbsp;<i class="fa fa-share"></i>
					</button>

                    <!-- items per page dropdown -->
					<div
						class="jplist-drop-down"
						data-control-type="items-per-page-drop-down"
						data-control-name="paging"
						data-control-action="paging">

						<ul>
							<li><span data-number="3"> 3 per page </span></li>
							<li><span data-number="5"> 5 per page </span></li>
							<li><span data-number="10" data-default="true"> 10 per page </span></li>
							<li><span data-number="all"> View All </span></li>
						</ul>
					</div>

                    <!-- sort dropdown -->
					<div
						class="jplist-drop-down"
						data-control-type="sort-drop-down"
						data-control-name="sort"
						data-control-action="sort">

						<ul>
							<li><span data-path="default">Sort by</span></li>
							<li><span data-path=".title" data-order="asc" data-type="text">Title A-Z</span></li>
							<li><span data-path=".title" data-order="desc" data-type="text">Title Z-A</span></li>
							<li><span data-path=".desc" data-order="asc" data-type="text">Description A-Z</span></li>
							<li><span data-path=".desc" data-order="desc" data-type="text">Description Z-A</span></li>
							<li><span data-path=".like" data-order="asc" data-type="number">Likes asc</span></li>
							<li><span data-path=".like" data-order="desc" data-type="number">Likes desc</span></li>
						</ul>
					</div>

					<!-- filter by title -->
					<div class="text-filter-box">
																	
						<!--[if lt IE 10]>
						<div class="jplist-label">Filter by Title:</div>
						<![endif]-->
										
						<input 
							data-path=".title" 
							data-button="#title-search-button"
							type="text" 
							value="" 
							placeholder="Filter by Title" 
							data-control-type="textbox" 
							data-control-name="title-filter" 
							data-control-action="filter"
						/>
										
						<button 
							type="button" 
							id="title-search-button">
							<i class="fa fa-search"></i>
						</button>
					</div>
									
					<!-- filter by description -->
					<div class="text-filter-box">
																		
						<!--[if lt IE 10]>
						<div class="jplist-label">Filter by Description:</div>
						<![endif]-->
										
						<input 
							data-path=".desc" 
							data-button="#desc-search-button"
							type="text" 
							value="" 
							placeholder="Filter by Description" 
							data-control-type="textbox" 
							data-control-name="desc-filter" 
							data-control-action="filter"
						/>	
										
						<button 
							type="button" 
							id="desc-search-button">
							<i class="fa fa-search"></i>
						</button>
					</div>

					<!-- list / grid view control -->
					<div 
						class="jplist-views" 
						data-control-type="views" 
						data-control-name="views" 
						data-control-action="views"
						data-default="jplist-list-view">
									   
						<button type="button" class="jplist-view jplist-list-view" data-type="jplist-list-view"><i class="fa fa-list"></i></button>
						<button type="button" class="jplist-view jplist-grid-view" data-type="jplist-grid-view"><i class="fa fa-th-large"></i></button>
					</div>
									
					<!-- checkbox filters -->
					<div
						class="jplist-group"
						data-control-type="checkbox-group-filter"
						data-control-action="filter"
						data-control-name="themes">

						<input
							data-path=".architecture"
							id="architecture"
							type="checkbox"
						/>

						<label for="architecture">Architecture</label>

						<input
							data-path=".christmas"
							id="christmas"
							type="checkbox"
						/>

						<label for="christmas">Christmas</label>

						<input
							data-path=".nature"
							id="nature"
							type="checkbox"
						/>

						<label for="nature">Nature</label>

						<input
							data-path=".lifestyle"
							id="lifestyle"
							type="checkbox"
						/>

						<label for="lifestyle">Lifestyle</label>
					</div>

					<div
						class="jplist-group"
						data-control-type="checkbox-group-filter"
						data-control-action="filter"
						data-control-name="colors">

						<input
							data-path=".red"
							id="red-color"
							type="checkbox"
						/>

						<label for="red-color">Red</label>

						<input
							data-path=".green"
							id="green-color"
							type="checkbox"
						/>

						<label for="green-color">Green</label>

						<input
							data-path=".blue"
							id="blue-color"
							type="checkbox"
						/>

						<label for="blue-color">Blue</label>

						<input
							data-path=".brown"
							id="brown-color"
							type="checkbox"
						/>

						<label for="brown-color">Brown</label>
										
					</div>
									
					<!-- pagination results -->
					<div 
						class="jplist-label" 
						data-type="Page {current} of {pages}" 
						data-control-type="pagination-info" 
						data-control-name="paging" 
						data-control-action="paging">
					</div>
										
					<!-- pagination -->
					<div 
						class="jplist-pagination" 
						data-control-type="pagination" 
						data-control-name="paging" 
						data-control-action="paging">
					</div>	

                    <!-- preloader for data sources -->
					<div 
						class="jplist-hide-preloader jplist-preloader"
						data-control-type="preloader" 
						data-control-name="preloader" 
						data-control-action="preloader">
						<img src="/content/img/common/ajax-loader-line.gif" alt="Loading..." title="Loading..." />
					</div>

				</div>
														
				<!-- ajax content here -->   
				<div class="list box text-shadow"></div>
								
				<!-- no result found -->
				<div class="box jplist-no-results text-shadow align-center jplist-hidden">
					<p>No results found</p>
				</div>
								
				<!-- ios button: show/hide panel -->
				<div class="jplist-ios-button">
					<i class="fa fa-sort"></i>
					jPList Actions
				</div>
								
				<!-- panel -->
				<div class="jplist-panel box panel-bottom">						
									
                    <!-- items per pafe dropdown -->						
					<div 
						class="jplist-drop-down left" 
						data-control-type="items-per-page-drop-down" 
						data-control-name="paging" 
						data-control-action="paging"
						data-control-animate-to-top="true">
										
						<ul>
							<li><span data-number="3"> 3 per page </span></li>
							<li><span data-number="5"> 5 per page </span></li>
							<li><span data-number="10" data-default="true"> 10 per page </span></li>
							<li><span data-number="all"> View All </span></li>
						</ul>
					</div>

                    <!-- sort dropdown -->
					<div 
						class="jplist-drop-down left" 
						data-control-type="sort-drop-down" 
						data-control-name="sort" 
						data-control-action="sort"
						data-control-animate-to-top="true">
										
						<ul>
							<li><span data-path="default">Sort by</span></li>
							<li><span data-path=".title" data-order="asc" data-type="text">Title A-Z</span></li>
							<li><span data-path=".title" data-order="desc" data-type="text">Title Z-A</span></li>
							<li><span data-path=".desc" data-order="asc" data-type="text">Description A-Z</span></li>
							<li><span data-path=".desc" data-order="desc" data-type="text">Description Z-A</span></li>
							<li><span data-path=".like" data-order="asc" data-type="number">Likes asc</span></li>
							<li><span data-path=".like" data-order="desc" data-type="number">Likes desc</span></li>
						</ul>
					</div>
									
					<!-- pagination results -->
					<div 
						class="jplist-label" 
						data-type="{start} - {end} of {all}" 
						data-control-type="pagination-info" 
						data-control-name="paging" 
						data-control-action="paging">
					</div>
										
					<!-- pagination -->
					<div 
						class="jplist-pagination" 
						data-control-type="pagination" 
						data-control-name="paging" 
						data-control-action="paging"
						data-control-animate-to-top="true">
					</div>					
				</div>
			</div>
			<!-- jPList DEMO END -->		

		</div>

			   
	</div>
</div>
</asp:Content>



        
