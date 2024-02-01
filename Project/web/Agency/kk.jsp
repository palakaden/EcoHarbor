 <td><%=rs.getString("ward_no")%></td>
                    <td><%=rs.getString("location_name")%></td>
                    
                    
                    
                    <th>Ward No</th>
                    <th>Location</th>
                    
                    
                    inner join tbl_ward d on l.ward_id=d.ward_id inner join tbl_location e on d.location_id=e.location_id