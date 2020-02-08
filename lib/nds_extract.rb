# Provided, don't edit
require 'directors_database'


# A method we're giving you. This "flattens"  Arrays of Arrays so: 
# [[1,2], [3,4,5], [6]] => [1,2,3,4,5,6].

def flatten_a_o_a(aoa)
  result = []
  i = 0

  while i < aoa.length do
    k = 0
    while k < aoa[i].length do
      result << aoa[i][k]
      k += 1
    end
    i += 1
  end

  result
end

def movie_with_director_name(director_name, movie_data)
  { 
    :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => director_name
  }
end


# Your code after this point

def movies_with_director_key(name, movies_collection)
  result =[]
  film_idx = 0
  while film_idx < movies_collection.length do  
   
      result << movie_with_director_name(name, movies_collection[film_idx])
      
      film_idx += 1 
  end
  return result
  
  
  # GOAL: For each Hash in an Array (movies_collection), provide a collection
  # of movies and a directors name to the movie_with_director_name method
  # and accumulate the returned Array of movies into a new Array that's
  # returned by this method.
  #
  # INPUT:
  # * name: A director's name
  # * movies_collection: An Array of Hashes where each Hash represents a movie
  #
  # RETURN:
  #
  # Array of Hashes where each Hash represents a movie; however, they should all have a
  # :director_name key. This addition can be done by using the provided
  # movie_with_director_name method
  
  # Ellos te van a dar dos input: el nombre del director y la lista de peliculas.
  # Si partimos del nds de los ejercicios pasados, el nombre seria nds[0][:name] y la lista es nds[0][:movies]
  # Tu output tiene que ser una lista de peliculas PERO que ahora las peliculas tengan un campo donde dice el director
  # Para yudarte, te han dado una funcion que transforma a un hash pelicula para agregarle el nombre del director, esa funcion se llama movie_with_director_name
  # basicamente tienes que tomar el input, invocar varias veces (en un loop) la funcion que te dieron con los argumentos correctos, y acumular lo que esa funcion retorna en un nuevo array
end


def gross_per_studio(collection)
  # GOAL: Given an Array of Hashes where each Hash represents a movie,
  # return a Hash that includes the total worldwide_gross of all the movies from
  # each studio.
  
  result = {}
  idx_stud = 0

  while idx_stud < collection.length do
   # result[:name][:worldwide_gross]  
  stud_name = collection[idx_stud][:studio]
    if result[stud_name]
    result[stud_name] += collection[idx_stud][:worldwide_gross]
 
    else 
    result[stud_name] = collection[idx_stud][:worldwide_gross]

    end
    idx_stud += 1
  end
  return result
  
  #
  # INPUT:
  # * collection: Array of Hashes where each Hash where each Hash represents a movie
  #
  # RETURN:
  # Hash whose keys are the studio names and whose values are the sum
  # total of all the worldwide_gross numbers for every movie in the input Hash
end

def movies_with_directors_set(source)
  # GOAL: For each director, find their :movies Array and stick it in a new Array
  
  result = []
  idx_dir = 0 
  while idx_dir < source.length
      result << movies_with_director_key(source[idx_dir][:name], source[idx_dir][:movies])
  idx_dir += 1
  end
return result

  
  # INPUT:
  # * source: An Array of Hashes containing director information including
  # :name and :movies
  #
  # RETURN:
  #
  # Array of Arrays containing all of a director's movies. Each movie will need
  # to have a :director_name key added to it.
  
  # result = [[{:title => "Test", :director_name => "A"}], ...[], ... []]
end

# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
