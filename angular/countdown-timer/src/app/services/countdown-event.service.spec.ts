import { TestBed } from '@angular/core/testing';

import { CountdownEventService } from './countdown-event.service';

describe('CountdownEventService', () => {
  let service: CountdownEventService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(CountdownEventService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
