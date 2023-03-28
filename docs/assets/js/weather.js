const searchButton = document.getElementById('search-btn');
const searchInput = document.getElementById('search-txt');
const cityName = document.getElementById('city-name');
const icon = document.getElementById('icon');
const temperature = document.getElementById('temp');
const humidity = document.getElementById('humidity-div');

searchButton.addEventListener('click', findWeatherDetails);
searchInput.addEventListener('keyup', enterPressed);

function enterPressed(event) {
  if (event.key === 'Enter') {
    findWeatherDetails();
  }
}

function findWeatherDetails() {
  if (searchInput.value === '') {

  }else {
    const appid = '60a010ca788e032f55597166c459f0cf';
    const searchLink = `https://api.openweathermap.org/data/2.5/weather?q=${  searchInput.value  }&appid=${  appid }`;
    httpRequestAsync(searchLink, theResponse);
  }
}

function theResponse(response) {
  const jsonObject = JSON.parse(response);
  cityName.innerHTML = jsonObject.name;
  icon.src = `http://openweathermap.org/img/w/${  jsonObject.weather[0].icon  }.png`;
  temperature.innerHTML = `${ parseInt(jsonObject.main.temp - 273)  }°`;
  humidity.innerHTML = `${ jsonObject.main.humidity  }%`;
}

function httpRequestAsync(url, callback)
{
  const httpRequest = new XMLHttpRequest();
  httpRequest.onreadystatechange = () => {
    if (httpRequest.readyState == 4 && httpRequest.status == 200)
      callback(httpRequest.responseText);
  };
  httpRequest.open('GET', url, true); // true for asynchronous
  httpRequest.send();
}
