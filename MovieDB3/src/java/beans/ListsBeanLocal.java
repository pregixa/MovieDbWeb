/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import java.util.List;
import javax.ejb.Local;
import moviedb_classes.Lists;

/**
 *
 * @author Utilizador
 */
@Local
public interface ListsBeanLocal {
    
    public List<Lists> get_user_lists(int user_id);

    public List<Lists> get_list(int id, String list_type);

    public void remove_from_list(int user_id, int movie_id, String list_type);

    public void remove_list(String id, String list_name);
    
}
