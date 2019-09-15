import { Component, OnInit } from '@angular/core';
import { Occasion } from 'src/app/models/occasion.model';
import { OccasionService } from 'src/app/services/occasion.service';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-edit-occasion',
  templateUrl: './edit-occasion.component.html',
  styleUrls: ['./edit-occasion.component.css']
})
export class EditOccasionComponent implements OnInit {

  constructor(private activatedRoute:ActivatedRoute, private occService:OccasionService) { }

occ:Occasion;
  ngOnInit() {
    this.occService.get(Number(this.activatedRoute.snapshot.params['number']))
    .subscribe(occ => {
      this.occ = occ;
      console.log(occ);
    },err=>console.error(err))
  }
  
}
