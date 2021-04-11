import UIKit

public enum MovieHeaders {
    case Popular_Movies , Top_Movies , Now_Playing_Movies , Up_Coming_Movies
    
    var url : String {
        switch self {
        case .Now_Playing_Movies:               return URLS.nowPlayingMovies
        case .Popular_Movies:                   return URLS.popularMovies
        case .Top_Movies:                       return URLS.topMovies
        case .Up_Coming_Movies:                 return URLS.upComingMovies
        }
    }
    
    var movieHeader : String {
        switch self {
        case .Now_Playing_Movies:               return "Now Playing Movies"
        case .Popular_Movies:                   return "Popular Movies"
        case .Top_Movies:                       return "Top Movies"
        case .Up_Coming_Movies:                 return "Up Coming Movies"
        }
    }
}

public enum TVHeaders {
    case Popular_TV , Top_TV , Now_Playing_TV , Up_Coming_TV
    var url : String {
        switch self {
        case .Now_Playing_TV:                   return URLS.nowPlayingTV
        case .Popular_TV:                       return URLS.popularTV
        case .Top_TV:                           return URLS.topTV
        case .Up_Coming_TV:                     return URLS.upComingTV
        }
    }
    
    var tvHeader : String {
        switch self {
        case .Now_Playing_TV:               return "ON Air TVShows"
        case .Popular_TV:                   return "Popular TVShows"
        case .Top_TV:                       return "Top TVShows"
        case .Up_Coming_TV:                 return "Up Coming TVShows"
        }
    }
}
