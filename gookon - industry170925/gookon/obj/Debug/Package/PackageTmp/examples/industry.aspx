<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="industry.aspx.vb" Inherits="gookon.industry" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>2017新竹科學園區產業地圖</title>
		<meta charset="big5">
		<meta name="viewport" content="width=device-width, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
		<style align="center">
			html, body {
				height: 100%;
				width:100%;				
			}

			body {
				background-color: #FFFFFF;
				margin: 0;
				font-family: Helvetica, sans-serif;
				overflow: hidden;
			}

			a {
				color: #ffffff;
			}

			#info {
	            position: absolute;
				width: 100%;
				color: #000;
				padding: 5px;
				font-family: Monospace;
				font-size: 13px;
				font-weight: bold;
				text-align: center;
				z-index: 1;
                top: 0px;
                left: 0px;
            }
			          		
			#menu {
				position: absolute;
				bottom: 5px;
				width: 100%;
				text-align: center;
            }
            #menu2 {
				position: absolute;
				top: 30px;				
				width: 100%;
				text-align: center;
                z-index:2;
            }
			#container {
				position: absolute;
				top: 30px;
				width:100%;
				text-align: left;
                left: 0px;
                z-index:0;
            }
			
			.element {
                  width: 180px;
                  height:260px;
                  font-weight: bold;
                  -webkit-font-smoothing: antialiased;
                  -moz-osx-font-smoothing: grayscale;
                
                  border: 3px solid rgba(127,255,255,1);
                  order-radius: 8px;
                  text-align: center;
                  cursor: default;
                  
                }

                .element:hover {
                  box-shadow: 0px 0px 12px rgba(0,255,255,0.75);
                  border: 1px solid rgba(127,255,255,0.75);
                  
                }
                .element svg {
                  position: absolute;
                  top: 20px;
                  left: 2px;
                  right: 0px;
                }
				.element .done{
                  position: absolute;
                  top:80px;
                  left:0px;
                  width: 100%;
                  height: 180px;
                  border-style:ridge;
                  border-color:brown;
                  border-width: 0px;
                }
				.element .number {
					position: absolute;
					top: 20px;
					right: 20px;
					font-size: 10px;
					text-shadow:1px 1px 1px #cccccc;
					color: rgba(0,0,0,0.75);
				}

				.element .medicine {
				  position: absolute; 
                  top: 35px;
                  left: 0px;
                  right: 0px;
                  font-size: 20px;
                  color: rgba(0, 0, 0,0.75);
				}

				.element .symton {
				    position: absolute;
                    top: 5px;
                    left: 0px;
                    right: 0px;
                    font-size: 20px;
                    color: rgba(0,0, 199,0.75);
				}

			button {
				color: rgba(0,0,0,0.75);
				background: transparent;
				outline: 1px solid rgba(127,255,255,0);
				border: 0px;
				padding: 5px 10px;
				cursor: pointer;
			}
			button:hover {
				background-color: rgba(255,187,0,0.5);
			}
			button:active {
				color: #FFFFFF;
				background-color: rgba(0,255,255,0.75);
			}
		    #btnGet
            {
                height: 45px;
                margin-top: 0px;
                width: 100px;
            }
		</style>
     <script src="js/jquery-1.3.2.js" type="text/javascript"></script>
     
</head>
<body>
  
    <!--    sphere jsp start --->
   
    	<script src="../build/three.js"></script>
		<script src="js/libs/tween.min.js"></script>
		<script src="js/controls/TrackballControls.js"></script>
		<script src="js/renderers/CSS3DRenderer.js"></script>
              

		<div id="container"></div>
		<div id="info" >2017新竹科學園區產業地圖</div>
 
		<div id="menu">
			<button id="table">TABLE</button>
			<button id="sphere">SPHERE</button>
			<button id="helix">HELIX</button>
			<button id="grid">GRID</button>
		</div>

        <div id="menu2">
         <select name="select-song1" id="select-song1"  style="width:100px" onchange="k1Onchange()">
                        <option value="" >IC封裝/測試</option>
         </select>
         <select name="select-song2" id="select-song2"  style="width:100px" onchange="k2Onchange()">
                         <option value="" >IC製造</option>
         </select>
         <select name="select-song3" id="select-song3"  style="width:100px" onchange="k3Onchange()">
                         <option value="" >IC設計</option>
         </select>
         <select name="select-song4" id="select-song4"  style="width:100px" onchange="k4Onchange()">
                         <option value="" >IC設備/材料</option>
         </select>
        </div>
       	
        <script type="text/javascript">
           

            var camera, scene, renderer;
            var controls;

            var objects = [];
            var targets = { table: [], sphere: [], helix: [], grid: [] };

            init();
            animate();

            function init() {

                camera = new THREE.PerspectiveCamera(4000, window.innerWidth / window.innerHeight, 1, 10000);
                camera.position.z = 3000;
             

                scene = new THREE.Scene();

                // table
                $(document).ready(function () {
                    var table = []; //symton
                    var medicine = [];
                    var image = [];
                    var color = [];
                    var dlist1 = [];
                    var dlist2 = [];
                    var dlist3 = [];
                    var dlist4 = [];
                    var did1 = [];
                    var did2 = [];
                    var did3 = [];
                    var did4 = [];

                    $("#btnOpen").click(function () {
                        $("#panel").show();
                        $("#open").hide();
                    });

                    $("#btnGet").click(function () {
                        $("#panel").hide();
                        $("#open").show();

                        dlist1 = [];
                        dlist2 = [];
                        dlist3 = [];
                        dlist4 = [];
                        did1 = [];
                        did2 = [];
                        did3 = [];
                        did4 = [];
                        select_num = 0;

                        $("#<%=GridView1.ClientID %> tr").each(function () {
                            //Skip first(header) row
                            if (!this.rowIndex) return;
                            var sname = $(this).children('td').eq(2).html(); //kind
                            var mname = $(this).children('td').eq(1).html(); //cname
                            var imgid = $(this).children('td').eq(0).html(); //cid
                            var icolor = $(this).children('td').eq(3).html();
//                            alert("test");
//                            alert(mname);
                            table.push(sname); //kind
                            medicine.push(mname); //cname
                            image.push(imgid); //cid
                            color.push(icolor);

                            select_num++;
                            if (sname == 'IC封裝/測試') {
                                dlist1.push(mname);
                                did1.push(select_num);
                            }
                            else if (sname == 'IC製造') {
                                dlist2.push(mname);
                                did2.push(select_num);
                            }
                            else if (sname == 'IC設計') {
                                dlist3.push(mname);
                                did3.push(select_num);
                            }
                            else if (sname == 'IC設備/材料') {
                                dlist4.push(mname);
                                did4.push(select_num);
                            }

                        });
                        for (i = 0; i < dlist1.length; i += 1) {

                            $("#select-song1").append("<option value= \"" + did1[i] + "\"  label= \"" + dlist1[i] + "\"></option>");
                        }
                        for (i = 0; i < dlist2.length; i += 1) {

                            $("#select-song2").append("<option value= \"" + did2[i] + "\"  label= \"" + dlist2[i] + "\"></option>");
                        }
                        for (i = 0; i < dlist3.length; i += 1) {

                            $("#select-song3").append("<option value= \"" + did3[i] + "\"  label= \"" + dlist3[i] + "\"></option>");
                        }
                        for (i = 0; i < dlist4.length; i += 1) {

                            $("#select-song4").append("<option value= \"" + did4[i] + "\"  label= \"" + dlist4[i] + "\"></option>");
                        }

                        //$("#listAge").html($.each(list, function (index, value) { alert(index + ': ' + value); }));
                        for (i = 0; i < table.length; i += 1) {
                            //                              alert(table[i]);
                            var element = document.createElement('div');
                            element.className = 'element';

                            var bg = document.createElement('div');
                            element.setAttribute('style', "background-color:rgba(" + color[i] + ", 0.75)");
                            //                            element.setAttribute('style', "background-color:rgba(127, 255, 255, 0.75)");
                            element.appendChild(bg);

                            var symbol = document.createElement('div');
                            symbol.className = 'medicine'; //大字
                            symbol.textContent = medicine[i];
                            element.appendChild(symbol);

                            var details = document.createElement('div');
                            details.className = 'symton'; //症狀
                            details.innerHTML = table[i];
                            //element.appendChild( details );
                            element.appendChild(details);

                            //image 加聯結
                            var link = document.createElement('a'); // + url
                            //                          '  link.setAttribute('href', table[i + 5]);
                            link.setAttribute('href', "http://140.113.73.198/sc/shortestpathind.html");
                            link.setAttribute('target', "_blank");
                            element.appendChild(link);

                            var Img = document.createElement('img');
                            Img.setAttribute('class', 'done');
                            Img.setAttribute('style', 'background-image:url(img/i' + image[i] + '.jpg);background-size:180px 180px;background-repeat:no-repeat;background-position:center');
                            link.appendChild(Img);

                            var object = new THREE.CSS3DObject(element);
                            object.position.x = Math.random() * 4000 - 2000;
                            object.position.y = Math.random() * 4000 - 2000;
                            object.position.z = Math.random() * 4000 - 2000;
                            scene.add(object);

                            objects.push(object);

                            //

                            var object = new THREE.Object3D();
                            var icol = Math.floor(i / 13); //取商數
                            irow = i % 13; //取餘數

                            object.position.x = (irow * 200) - 1100;  //2600 table 整體水平位置 數字越大越往左
                            object.position.y = -(icol * 300) + 850; //2100 table 整體垂直位置 數字越大越往上
                            targets.table.push(object);
                        }
                        // sphere

                        var vector = new THREE.Vector3();
                        //                        objects.length = 166;
                        //                        console.log(" objects.length" + ":" + objects.length);
                        for (var i = 0, l = objects.length; i < l; i++) {
                            var phi = Math.acos(-1 + (2 * i) / l);
                            var theta = Math.sqrt(l * Math.PI) * phi;

                            var object = new THREE.Object3D();

                            object.position.x = 1000 * Math.cos(theta) * Math.sin(phi);
                            object.position.y = 1000 * Math.sin(theta) * Math.sin(phi);
                            object.position.z = 1000 * Math.cos(phi);

                            vector.copy(object.position).multiplyScalar(2);

                            object.lookAt(vector);

                            targets.sphere.push(object);


                        }

                        // helix

                        var vector = new THREE.Vector3();

                        for (var i = 0, l = objects.length; i < l; i++) {

                            var phi = i * 0.175 + Math.PI;

                            var object = new THREE.Object3D();

                            object.position.x = 1100 * Math.sin(phi); //1100 數字越大 每片越分開
                            object.position.y = -(i * 10) + 660;  //660 垂直移動 數字越大越往上
                            object.position.z = 1100 * Math.cos(phi);

                            vector.x = object.position.x * 2;
                            vector.y = object.position.y;
                            vector.z = object.position.z * 2;

                            object.lookAt(vector);

                            targets.helix.push(object);

                        }

                        // grid

                        for (var i = 0; i < objects.length; i++) {

                            var object = new THREE.Object3D();

                            object.position.x = ((i % 5) * 400) - 800;
                            object.position.y = (-(Math.floor(i / 5) % 5) * 400) + 800;
                            object.position.z = (Math.floor(i / 25)) * 1000 - 2000;

                            targets.grid.push(object);

                        }
                        //

                        renderer = new THREE.CSS3DRenderer();
                        renderer.setSize(window.innerWidth, window.innerHeight);
                        renderer.domElement.style.position = 'absolute';
                        document.getElementById('container').appendChild(renderer.domElement);

                        //

                        controls = new THREE.TrackballControls(camera, renderer.domElement);
                        controls.rotateSpeed = 0.5;
                        controls.minDistance = 500;
                        controls.maxDistance = 6000;
                        controls.addEventListener('change', render);

                        var button = document.getElementById('table');
                        button.addEventListener('click', function (event) {

                            transform(targets.table, 20);

                        }, false);

                        var button = document.getElementById('sphere');
                        button.addEventListener('click', function (event) {

                            transform(targets.sphere, 20);

                        }, false);

                        var button = document.getElementById('helix');
                        button.addEventListener('click', function (event) {

                            transform(targets.helix, 20);

                        }, false);

                        var button = document.getElementById('grid');
                        button.addEventListener('click', function (event) {

                            transform(targets.grid, 20);

                        }, false);

                        transform(targets.table, 20);

                        //

                        window.addEventListener('resize', onWindowResize, false);
                    });
                });
           }

            function transform(targets, duration) {

                TWEEN.removeAll();

                for (var i = 0; i < objects.length; i++) {

                    var object = objects[i];
                    var target = targets[i];

                    new TWEEN.Tween(object.position)
						.to({ x: target.position.x, y: target.position.y, z: target.position.z }, Math.random() * duration + duration)
						.easing(TWEEN.Easing.Exponential.InOut)
						.start();

                    new TWEEN.Tween(object.rotation)
						.to({ x: target.rotation.x, y: target.rotation.y, z: target.rotation.z }, Math.random() * duration + duration)
						.easing(TWEEN.Easing.Exponential.InOut)
						.start();

                }

                new TWEEN.Tween(this)
					.to({}, duration * 2)
					.onUpdate(render)
					.start();

            }
            function transformPos(targets, duration, iX, iY, iZ) {

                TWEEN.removeAll();
                camera.position.x = iX;
                camera.position.y = iY;
                camera.position.z = iZ;
                for (var i = 0; i < objects.length; i++) {

                    var object = objects[i];
                    var target = targets[i];

                    new TWEEN.Tween(object.position)
						.to({ x: target.position.x, y: target.position.y, z: target.position.z }, Math.random() * duration + duration)
						.easing(TWEEN.Easing.Exponential.InOut)
						.start();

                    new TWEEN.Tween(object.rotation)
						.to({ x: target.rotation.x, y: target.rotation.y, z: target.rotation.z }, Math.random() * duration + duration)
						.easing(TWEEN.Easing.Exponential.InOut)
						.start();

                }

                new TWEEN.Tween(this)
					.to({}, duration * 2)
					.onUpdate(render)
					.start();

            }
            function onWindowResize() {

                camera.aspect = window.innerWidth / window.innerHeight;
                camera.updateProjectionMatrix();

                renderer.setSize(window.innerWidth, window.innerHeight);

                render();

            }

            function animate() {

                requestAnimationFrame(animate);

                TWEEN.update();

                controls.update();

            }
             
            function render() {

                renderer.render(scene, camera);

            }

            function k1Onchange() {

                //alert("haha");
                var selectBox = document.getElementById("select-song1");
                var selectedValue = selectBox.options[selectBox.selectedIndex].value;
                //alert(selectedValue);
                selectedValue = selectedValue - 1;
                document.getElementById("select-song2").selectedIndex = "0";
                document.getElementById("select-song3").selectedIndex = "0";
                document.getElementById("select-song4").selectedIndex = "0";

                controls.reset();
                var phi = Math.acos(-1 + (2 * selectedValue) / select_num);
                var theta = Math.sqrt(select_num * Math.PI) * phi;

                x = 3000 * Math.cos(theta) * Math.sin(phi);
                y = 3000 * Math.sin(theta) * Math.sin(phi);
                z = 3000 * Math.cos(phi);
                transformPos(targets.sphere, 20, x, y, z);

            }
            function k2Onchange() {
                //                alert('test onchange');
                var selectBox = document.getElementById("select-song2");
                var selectedValue = selectBox.options[selectBox.selectedIndex].value;
                selectedValue = selectedValue - 1;

                document.getElementById("select-song1").selectedIndex = "0";
                document.getElementById("select-song3").selectedIndex = "0";
                document.getElementById("select-song4").selectedIndex = "0";

                controls.reset();
                var phi = Math.acos(-1 + (2 * selectedValue) / select_num);
                var theta = Math.sqrt(select_num * Math.PI) * phi;
                x = 3000 * Math.cos(theta) * Math.sin(phi);
                y = 3000 * Math.sin(theta) * Math.sin(phi);
                z = 3000 * Math.cos(phi);
                transformPos(targets.sphere, 20, x, y, z);

            }
            function k3Onchange() {
                //                alert('test onchange');
                var selectBox = document.getElementById("select-song3");
                var selectedValue = selectBox.options[selectBox.selectedIndex].value;
                selectedValue = selectedValue - 1;
                document.getElementById("select-song1").selectedIndex = "0";
                document.getElementById("select-song2").selectedIndex = "0";
                document.getElementById("select-song4").selectedIndex = "0";

                controls.reset();
                var phi = Math.acos(-1 + (2 * selectedValue) / select_num);
                var theta = Math.sqrt(select_num * Math.PI) * phi;
                x = 3000 * Math.cos(theta) * Math.sin(phi);
                y = 3000 * Math.sin(theta) * Math.sin(phi);
                z = 3000 * Math.cos(phi);
                transformPos(targets.sphere, 20, x, y, z);

            }
            function k4Onchange() {
                //                alert('test onchange');
                var selectBox = document.getElementById("select-song4");
                var selectedValue = selectBox.options[selectBox.selectedIndex].value;
                selectedValue = selectedValue - 1;
                document.getElementById("select-song1").selectedIndex = "0";
                document.getElementById("select-song2").selectedIndex = "0";
                document.getElementById("select-song3").selectedIndex = "0";

                controls.reset();
                var phi = Math.acos(-1 + (2 * selectedValue) / select_num);
                var theta = Math.sqrt(select_num * Math.PI) * phi;
                x = 3000 * Math.cos(theta) * Math.sin(phi);
                y = 3000 * Math.sin(theta) * Math.sin(phi);
                z = 3000 * Math.cos(phi);
                transformPos(targets.sphere, 20, x, y, z);
            }
       


        </script>    

        <!--.net -->
   <form id="form1" runat="server" style="position: absolute; left: 10px"  >
     
      <div id="panel" style="position: absolute; left: 12px; top: 57px;">
          <br />
          點選產業別:<asp:CheckBox ID="chkAll" runat="server" AutoPostBack="True" 
              Text="全選" />
          <br />
         A <asp:CheckBox ID="a1" runat="server" Text="IC封裝/測試" />
         <asp:CheckBox ID="a2" runat="server" Text="IC製造" />
         <asp:CheckBox ID="a3" runat="server" Text="IC設計" /><br />
          　<asp:CheckBox ID="a4" runat="server" Text="IC設備/材料" />
        <br />
        B  <asp:CheckBox ID="b1" runat="server" Text="觸控面板" />
          <br />
        C  <asp:CheckBox ID="c1" runat="server" Text="LED" />
          <asp:CheckBox ID="c2" runat="server" Text="LCD" />
        
          <br />
       D   <asp:CheckBox ID="d1" runat="server" Text="通訊產業" />
          <br />
         E <asp:CheckBox ID="e1" runat="server" Text="手機" />
          <br />
         F <asp:CheckBox ID="f1" runat="server" Text="電腦" />
          <br />
         G <asp:CheckBox ID="g1" runat="server" Text="組件" />
          <br />
       H   <asp:CheckBox ID="h1" runat="server" Text="資訊服務" />
          <p>
          <asp:Button ID="btnQry" runat="server" Height="45px" Text="步驟1: 查詢" 
              Width="100px" />
          　<input type="button" id="btnGet" value="步驟2: 畫圖" onclick="return btnGet_onclick()" />
    
     <%--<div style="display:none"> --%>  <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" 
            EmptyDataText="沒有資料錄可顯示。" 
              CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="cid" HeaderText="cid" SortExpression="cid" />
                <asp:BoundField DataField="cname" HeaderText="cname" 
                    SortExpression="cname" />
                <asp:BoundField DataField="kind" HeaderText="kind" SortExpression="kind" />
                <asp:BoundField DataField="bg" HeaderText="bg" SortExpression="bg" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView></div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:industryConnectionString %>"
              SelectCommand="SELECT * FROM [ic]">
        </asp:SqlDataSource>
      </div> <div id="open" 
       style="display: none; position: absolute; top: 60px; left: 10px;" ><button id="btnOpen" onclick="return btnOpen_onclick()">New Query</button></div>
    </form>
   
</body>

</html>
