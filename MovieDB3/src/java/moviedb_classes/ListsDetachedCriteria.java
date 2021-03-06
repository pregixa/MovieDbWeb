/**
 * "Visual Paradigm: DO NOT MODIFY THIS FILE!"
 * 
 * This is an automatic generated file. It will be regenerated every time 
 * you generate persistence class.
 * 
 * Modifying its content may cause the program not work, or your work may lost.
 */

/**
 * Licensee: Universidade do Minho
 * License Type: Academic
 */
package moviedb_classes;

import java.util.List;
import org.hibernate.criterion.DetachedCriteria;
import org.orm.PersistentSession;
import org.orm.criteria.*;

public class ListsDetachedCriteria extends AbstractORMDetachedCriteria {
	public final IntegerExpression userId;
	public final AssociationExpression user;
	public final IntegerExpression movieId;
	public final AssociationExpression movie;
	public final StringExpression list_name;
	
	public ListsDetachedCriteria() {
		super(moviedb_classes.Lists.class, moviedb_classes.ListsCriteria.class);
		userId = new IntegerExpression("ORM_User.id", this.getDetachedCriteria());
		user = new AssociationExpression("ORM_User", this.getDetachedCriteria());
		movieId = new IntegerExpression("ORM_Movie.id", this.getDetachedCriteria());
		movie = new AssociationExpression("ORM_Movie", this.getDetachedCriteria());
		list_name = new StringExpression("list_name", this.getDetachedCriteria());
	}
	
	public ListsDetachedCriteria(DetachedCriteria aDetachedCriteria) {
		super(aDetachedCriteria, moviedb_classes.ListsCriteria.class);
		userId = new IntegerExpression("ORM_User.id", this.getDetachedCriteria());
		user = new AssociationExpression("ORM_User", this.getDetachedCriteria());
		movieId = new IntegerExpression("ORM_Movie.id", this.getDetachedCriteria());
		movie = new AssociationExpression("ORM_Movie", this.getDetachedCriteria());
		list_name = new StringExpression("list_name", this.getDetachedCriteria());
	}
	
	public UserDetachedCriteria createUserCriteria() {
		return new UserDetachedCriteria(createCriteria("ORM_User"));
	}
	
	public MovieDetachedCriteria createMovieCriteria() {
		return new MovieDetachedCriteria(createCriteria("ORM_Movie"));
	}
	
	public Lists uniqueLists(PersistentSession session) {
		return (Lists) super.createExecutableCriteria(session).uniqueResult();
	}
	
	public Lists[] listLists(PersistentSession session) {
		List list = super.createExecutableCriteria(session).list();
		return (Lists[]) list.toArray(new Lists[list.size()]);
	}
}

