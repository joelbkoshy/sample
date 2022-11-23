<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html"/>
  <xsl:template match="article">
    <html lang="en">
      <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"></link>
        <style>
  * {box-sizing: border-box}
  body {font-family: Verdana, sans-serif; margin:0}
  .navbar {
    overflow: hidden;
    background-color: #333;
  }
  
  .navbar a {
    float: left;
    font-size: 16px;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
  }
  
  .dropdown {
    float: left;
    overflow: hidden;
  }
  
  .dropdown .dropbtn {
    font-size: 16px;  
    border: none;
    outline: none;
    color: white;
    padding: 14px 16px;
    background-color: inherit;
    font-family: inherit;
    margin: 0;
  }
  
  .navbar a:hover, .dropdown:hover .dropbtn {
    background-color: red;
  }
  
  .dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
  }
  
  .dropdown-content a {
    float: none;
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
    text-align: left;
  }
  
  .dropdown-content a:hover {
    background-color: #ddd;
  }
  
  .dropdown:hover .dropdown-content {
    display: block;
  }
  
  .navbar .search-container {
    float: right;
  }
  
  .navbar input[type=text] {
    padding: 6px;
    margin-top: 8px;
    font-size: 17px;
    border: none;
  }
  
  .navbar .search-container button {
    float: right;
    padding: 6px 10px;
    margin-top: 8px;
    margin-right: 16px;
    background: #ddd;
    font-size: 17px;
    border: none;
    cursor: pointer;
  }
  
  .navbar .search-container button:hover {
    background: #ccc;
  }
  
        </style>
      </head>
      <body style="background-color:black;color:white">

        <div class="navbar">
          <a href="index.html">Home</a>
          <a href="#">Product</a>
          <div class="dropdown">
            <button class="dropbtn">More
              <i class="fa fa-caret-down"></i>
            </button>
            <div class="dropdown-content">
              <a href="#">LOGIN/REGISTER</a>
              <a href="contact.html">Contact US</a>
              <a href="cart.html">Cart</a>
            </div>
          </div>
          <div class="search-container">
            <form action="">
              <input type="text" placeholder="Search.." name="search"></input>
              <button type="submit">
                <i class="fa fa-search"></i>
              </button>
            </form>
          </div>
        </div>

        <br></br>
        <br></br>
        <br></br>
        <br></br>
        <br></br>

        <input type="radio" name="all" onclick="document.getElementById('all').style.display='block';document.getElementById('price').style.display='none';"></input>All
        <input type="radio" name="all" onclick="document.getElementById('all').style.display='none';document.getElementById('price').style.display='block';"></input>Price > 400
        <div id="all">
          <table align="center" border-radius="10px" width="1000" cellpadding="5">
            <tr>
              <th colspan="6" style="border-style:outset;border-color: #96D4D4;font:30px Comic Sans MS">Order Details</th>
            </tr>
            <tr >
              <th>Order code</th>
              <th>Product ID</th>
              <th>Product Name</th>
              <th>Quantity</th>
              <th>Price</th>
              <th>Status</th>
            </tr>

            <xsl:for-each select="order">
              <xsl:sort select="id"/>
              <tr align="center">
                <td>
                  <xsl:value-of select="code"/>
                </td>
                <td>
                  <xsl:value-of select="id"/>
                </td>
                <td>
                  <xsl:value-of select="name"/>
                </td>
                <td>
                  <xsl:value-of select="quantity"/>
                </td>
                <td>
                  <xsl:value-of select="price"/>
                </td>
                <xsl:choose>
                  <xsl:when test="status='Delivered'">
                    <td style="background-color:purple;">
                      <xsl:value-of select="status"/>
                    </td>
                  </xsl:when>
                  <xsl:otherwise>
                    <td>
                      <xsl:value-of select="status"/>
                    </td>
                  </xsl:otherwise>
                </xsl:choose>
              </tr>
            </xsl:for-each>
          </table>
        </div>

        <br></br>
        <br></br>
        <br></br>
        <br></br>
        <br></br>
        <div id="price" style="display:none;">
          <table align="center" border-radius="10px" width="1000" cellpadding="5">
            <tr>
              <th colspan="5" style="border-style:outset;border-color: #96D4D4;font:30px Comic Sans MS">Order Details using if condition(price>400)</th>
            </tr>

            <tr >
              <th>Order code</th>
              <th>Product ID</th>
              <th>Product Name</th>
              <th>Quantity</th>
              <th>Price</th>
            </tr>

            <xsl:for-each select="order">
              <xsl:if test="price &gt; 400">
                <tr align="center">
                  <td>
                    <xsl:value-of select="code"/>
                  </td>
                  <td>
                    <xsl:value-of select="id"/>
                  </td>
                  <td>
                    <xsl:value-of select="name"/>
                  </td>
                  <td>
                    <xsl:value-of select="quantity"/>
                  </td>
                  <td>
                    <xsl:value-of select="price"/>
                  </td>
                </tr>
              </xsl:if>
            </xsl:for-each>
          </table>
        </div>

        <br></br>
        <br></br>
        <br></br>
        <br></br>
        <br></br>
        <h4 style="text-align:center;">
          <xsl:value-of select="writer"/>
          <xsl:value-of select="copyright"/>
        </h4>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>