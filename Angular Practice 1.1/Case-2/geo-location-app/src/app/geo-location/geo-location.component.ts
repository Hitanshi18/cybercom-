import { Component } from '@angular/core';
import { HttpClient } from '@angular/common/http';

interface GeoLocation {
  ip: string;
  city: string;
  region: string;
  country: string;
  loc: string;
  org: string;
  postal: string;
  timezone: string;
  readme: string;
}
@Component({
  selector: 'app-geo-location',
  templateUrl: './geo-location.component.html',
  styleUrls: ['./geo-location.component.scss']
})
export class GeoLocationComponent {
  ipAddress = '';
  geoLocation: GeoLocation | undefined;

  constructor(private http: HttpClient) {}

  lookup() {
    this.http.get<GeoLocation>(`https://ipinfo.io/${this.ipAddress}/geo`)
      .subscribe(
        data => this.geoLocation = data,
        error => console.log(error)
      );
  }
}
