
import SwiftUI

struct otherView: View {
  
  var body: some View {
    VStack {
      HeaderView()
      
      ScrollView(.vertical, showsIndicators: false) {
        HomeStories()
        
        Divider()
        
        PostView(content: "post_1", description: "This is the user generated description.")
        
        PostView(content: "post_1", description: "This is the user generated description.")
        
        PostView(content: "post_1", description: "This is the user generated description.")
      }
    
      TabBarView()
    }
  }
  
}

struct otherView_Previews: PreviewProvider {
  static var previews: some View {
    otherView()
  }
}

/// Contains Logo, plus, heart, & message
struct HeaderView: View {
  var body: some View {
    HStack {
      Image("arrow")
        .resizable()
        .frame(width: 100, height: 48)
        .aspectRatio(contentMode: .fit)
      
      Spacer()
      
      HStack(spacing: 20) {
        Image(systemName: "plus")
        Image(systemName: "heart")
        Image(systemName: "message")
      }
    }
    .padding(.horizontal, 16)
    .padding(.vertical, 8)
  }
}

/// Contains a single story: Image with Name
/// Pass in `image` and `name` as parameters
/// Used in `HomeStories`
struct Storyview: View {
  
  // Parameters to pass into `StoryView()`
  var image: String
  var name: String
  
  // Private variables
  private var imageSize: CGFloat = 60
  private var lineWidth: CGFloat = 2.5
  private var overlayColors: [Color] = [ .blue, .purple, .red, .pink, .yellow, .orange]
  
  public init(image: String, name: String) {
    self.image = image
    self.name = name
  }
  
  var body: some View {
    VStack {
      VStack {
        Image(image)
          .resizable()
          .frame(width: imageSize, height: imageSize)
          .cornerRadius(imageSize)
      }
      .overlay(
        Circle()
          .stroke(
            LinearGradient(colors: overlayColors, startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: lineWidth)
          .frame(width:  8, height:  8)
      )
      .frame(width:  10, height:  10)
      
      Text("sim")
        .font(.caption)
    }
  }
}

/// Contains a horizontal scroll view of `StoryView`
struct HomeStories: View {
  
  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack(spacing: 16) {
        StoryView(image: "B8CB29AD-73C7-4943-99E4-4BC5B71B43CB", name: "sim")
        StoryView(image: "B8CB29AD-73C7-4943-99E4-4BC5B71B43CB", name: "rachit")
        StoryView(image: "B8CB29AD-73C7-4943-99E4-4BC5B71B43CB", name: "sam")
        StoryView(image: "B8CB29AD-73C7-4943-99E4-4BC5B71B43CB", name: "rahul")
    
      }
      .padding(.horizontal, 8)
    }
    .padding(.vertical, 12)
  }
  
}

struct PostHeader: View {
  
  private var imageSize: CGFloat = 40
  
  var body: some View {
    HStack {
      HStack {
        Image("B8CB29AD-73C7-4943-99E4-4BC5B71B43CB")
          .resizable()
          .frame(width: imageSize, height: imageSize)
          .cornerRadius(imageSize)
        
        Text("simran")
          .font(.caption)
          .fontWeight(.bold)
      }
      
      Spacer()
      
      Image(systemName: "ellipsis")
    }
    .padding(.vertical, 12)
    .padding(.horizontal, 8)
  }
}

struct PostContent: View {
  
  var name: String
  
  public init(name: String) {
    self.name = name
  }
  
  var body: some View {
    VStack {
      Image(name)
        .resizable()
        .frame(width: .infinity, height: 400)
        .aspectRatio(contentMode: .fit)
      
      HStack {
        HStack {
          Image(systemName: "heart")
          Image(systemName: "message")
          Image(systemName: "envelope")
        }
        Spacer()
        
        Image(systemName: "bookmark")
      }
      .padding(.horizontal, 12)
      .padding(.vertical, 10)
    }
  }
}

struct PostView: View {
  
  var postName: String
  var description: String
  
  public init(content: String, description: String) {
    self.postName = content
    self.description = description
  }
  
  var body: some View {
    VStack(alignment: .leading, spacing: 0) {
      PostHeader()
      
      PostContent(name: postName)
      
      VStack(alignment: .leading) {
        Text("Liked by  Rachit and 10 others")
          .font(.footnote)
        HStack(spacing: 6) {
          Text("simran")
            .fontWeight(.bold)
          
          Text(description)
        }
        .font(.caption)
        
        HStack {
          HStack(spacing: 8) {
            Image("B8CB29AD-73C7-4943-99E4-4BC5B71B43CB")
              .resizable()
              .frame(width: 30, height: 30)
              .cornerRadius(50)
            
            Text("Add comment...")
              .font(.caption)
              .foregroundColor(.secondary)
          }
          
          Spacer()
          
          HStack {
            Text("😍")
            Text("😆")
            Image(systemName: "plus.circle")
              .foregroundColor(.secondary)
          }
        }
      }
      .frame(width: .infinity)
      .padding(.horizontal, 12)
      
      
    }
  }
}

struct TabBarView: View {
  var body: some View {
    VStack(spacing: 0) {
      Divider()
      HStack {
        Image(systemName: "house")
        Spacer()
        Image(systemName: "magnifyingglass")
        Spacer()
        Image(systemName: "display")
        Spacer()
        Image(systemName: "bag")
        Spacer()
        Image("person_2")
          .resizable()
          .frame(width: 22, height: 22)
          .cornerRadius(50)
      }
      .padding(.horizontal, 24)
      .padding(.top, 12)
    }
  }
}
