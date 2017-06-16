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

public class Movie {
	public Movie() {
	}
	
	private java.util.Set this_getSet (int key) {
		if (key == moviedb_classes.ORMConstants.KEY_MOVIE_RATED) {
			return ORM_rated;
		}
		else if (key == moviedb_classes.ORMConstants.KEY_MOVIE_PARTICIPANTS) {
			return ORM_participants;
		}
		else if (key == moviedb_classes.ORMConstants.KEY_MOVIE_MOVIE_REVIEWS) {
			return ORM_movie_reviews;
		}
		
		return null;
	}
	
	org.orm.util.ORMAdapter _ormAdapter = new org.orm.util.AbstractORMAdapter() {
		public java.util.Set getSet(int key) {
			return this_getSet(key);
		}
		
	};
	
	private int id;
	
	private int duration;
	
	private int release_day;
	
	private int release_month;
	
	private int release_year;
	
	private float rating;
	
	private String title;
	
	private String poster;
	
	private String genre;
	
	private String synopsys;
	
	private float box_office;
	
	private java.util.Set ORM_rated = new java.util.HashSet();
	
	private java.util.Set ORM_participants = new java.util.HashSet();
	
	private java.util.Set ORM_movie_reviews = new java.util.HashSet();
	
	private void setId(int value) {
		this.id = value;
	}
	
	public int getId() {
		return id;
	}
	
	public int getORMID() {
		return getId();
	}
	
	public void setDuration(int value) {
		this.duration = value;
	}
	
	public int getDuration() {
		return duration;
	}
	
	public void setRelease_day(int value) {
		this.release_day = value;
	}
	
	public int getRelease_day() {
		return release_day;
	}
	
	public void setRelease_month(int value) {
		this.release_month = value;
	}
	
	public int getRelease_month() {
		return release_month;
	}
	
	public void setRelease_year(int value) {
		this.release_year = value;
	}
	
	public int getRelease_year() {
		return release_year;
	}
	
	public void setRating(float value) {
		this.rating = value;
	}
	
	public float getRating() {
		return rating;
	}
	
	public void setTitle(String value) {
		this.title = value;
	}
	
	public String getTitle() {
		return title;
	}
	
	public void setPoster(String value) {
		this.poster = value;
	}
	
	public String getPoster() {
		return poster;
	}
	
	public void setGenre(String value) {
		this.genre = value;
	}
	
	public String getGenre() {
		return genre;
	}
	
	public void setSynopsys(String value) {
		this.synopsys = value;
	}
	
	public String getSynopsys() {
		return synopsys;
	}
	
	public void setBox_office(float value) {
		this.box_office = value;
	}
	
	public float getBox_office() {
		return box_office;
	}
	
	private void setORM_Rated(java.util.Set value) {
		this.ORM_rated = value;
	}
	
	private java.util.Set getORM_Rated() {
		return ORM_rated;
	}
	
	public final moviedb_classes.UserSetCollection rated = new moviedb_classes.UserSetCollection(this, _ormAdapter, moviedb_classes.ORMConstants.KEY_MOVIE_RATED, moviedb_classes.ORMConstants.KEY_USER_EVALUATED, moviedb_classes.ORMConstants.KEY_MUL_MANY_TO_MANY);
	
	private void setORM_Participants(java.util.Set value) {
		this.ORM_participants = value;
	}
	
	private java.util.Set getORM_Participants() {
		return ORM_participants;
	}
	
	public final moviedb_classes.StaffSetCollection participants = new moviedb_classes.StaffSetCollection(this, _ormAdapter, moviedb_classes.ORMConstants.KEY_MOVIE_PARTICIPANTS, moviedb_classes.ORMConstants.KEY_STAFF_WORKED, moviedb_classes.ORMConstants.KEY_MUL_MANY_TO_MANY);
	
	private void setORM_Movie_reviews(java.util.Set value) {
		this.ORM_movie_reviews = value;
	}
	
	private java.util.Set getORM_Movie_reviews() {
		return ORM_movie_reviews;
	}
	
	public final moviedb_classes.ReviewSetCollection movie_reviews = new moviedb_classes.ReviewSetCollection(this, _ormAdapter, moviedb_classes.ORMConstants.KEY_MOVIE_MOVIE_REVIEWS, moviedb_classes.ORMConstants.KEY_MUL_ONE_TO_MANY);
	
	public String toString() {
		return String.valueOf(getId());
	}
	
}